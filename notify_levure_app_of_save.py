import sublime
import sublime_plugin
import re
import socket
import urllib
import errno

class LiveCodeNotifyOnSave(sublime_plugin.EventListener):
    def on_post_save(self, view):
        # 1. Get script only stack name. line 1: script "Name" [done]
        # 2. Get project key from project settings
        # 3. Send notification over socket with project key, script name, and filename
        # 4. Get response from LiveCode IDE

        # We are only concerned with files using Livecode syntax
        if view.settings().get('syntax').endswith('LiveCode.sublime-syntax'):
            window_settings = view.window().project_data()
            if window_settings.get('livecode').get('notify_on_save', False):
                stack_name = None

                # Get the script only stack name
                # \A matches beginning of file
                region = view.find('\Ascript "([-a-zA-Z0-9_\s\?!]+)"', 0, sublime.IGNORECASE)
                if region.a >= 0:
                    stack_name = re.search('"([-a-zA-Z0-9_\s\?!]+)"', view.substr(region)).group(1)

                    host ="localhost"
                    port = 62475
                    debug = False

                    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM) #socket.SOCK_DGRAM

                    try:
                        s.connect((host,port))
                        query = {'stack': stack_name, 'filename': view.file_name()}
                        data = urllib.parse.urlencode(query) + "\n"
                        s.send(data.encode())
                        data = s.recv(1024).decode()
                        s.close()
                        if data != 'success':
                            print('error updating script in LiveCode: ' + data)
                        else:
                            print('script updated in LiveCode')
                    except socket.error as exc:
                        if debug:
                            print(exc)
