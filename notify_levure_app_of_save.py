import sublime
import sublime_plugin
import re
import socket
import urllib

class LiveCodeNotifyOnSave(sublime_plugin.EventListener):

    def on_activated_async(self, view):
        if self.is_livecode(view):
            query = {'command': 'open', 'filename': self.get_view_filename(view)}
            self.tell_livecode(view, query)
            view.close()

    def on_post_save(self, view):
        # 1. Get script only stack name. line 1: script "Name" [done]
        # 2. Get project key from project settings
        # 3. Send notification over socket with project key, script name, and filename
        # 4. Get response from LiveCode IDE

        # We are only concerned with files using Livecode syntax
        if self.is_livecodescript(view, 'notify_on_save'):
            stack_name = None

            # Get the script only stack name
            # \A matches beginning of file
            region = view.find('\Ascript "([-.a-zA-Z0-9_\s\?!]+)"', 0, sublime.IGNORECASE)
            if region.a >= 0:
                stack_name = re.search('"([-.a-zA-Z0-9_\s\?!]+)"', view.substr(region)).group(1)

                query = {'command': 'reload script', 'stack': stack_name, 'filename': self.get_view_filename(view)}
                self.tell_livecode(view, query)

    def is_livecodescript(self, view, property):
        if view.settings().get('syntax').endswith('LiveCode.sublime-syntax'):
            window_settings = view.window().project_data()
            if window_settings:
                livecode_window_settings = window_settings.get('livecode')
                return livecode_window_settings and livecode_window_settings.get(property, False)
        else:
            return False

    def is_livecode(self, view):
        filename = view.file_name()
        if filename != None:
            if filename.endswith('.livecode') or filename.endswith('.rev'):
                return True
        return False

    def tell_livecode(self, view, query):
        window_settings = view.window().project_data()
        livecode_settings = window_settings.get('livecode')
        if livecode_settings != None:
            host = "localhost"
            port = 61373
            debug = False

            livecode_settings = livecode_settings.get('notify_server')
            if livecode_settings != None:
                host = livecode_settings.get('host', host)
                port = livecode_settings.get('port', port)
                debug = livecode_settings.get('debug', debug)

            s = socket.socket(socket.AF_INET, socket.SOCK_STREAM) #socket.SOCK_DGRAM
            try:
                s.setblocking(300)
                s.connect((host,port))
                data = urllib.parse.urlencode(query) + "\n"
                s.send(data.encode())
                # s.sendto(data.encode(), (host, port))
                data = s.recv(1024).decode()
                s.close()
                if data != 'success':
                    if data.startswith('error: 360,'):
                        print('error: script is being executed within Livecode')
                    else:
                        print('error running command in LiveCode: ' + data)
                else:
                    print('command successfully sent to LiveCode')
                    if debug:
                        print(query)
            except socket.error as exc:
                if debug:
                    print(exc)

    def get_view_filename(self, view):
        filename = view.file_name()
        filename = filename.replace("\\", "/") # Fix path separator on Windows
        return filename
