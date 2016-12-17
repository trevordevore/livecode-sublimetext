import sublime
import sublime_plugin
import re

class LevureAppNotify(sublime_plugin.EventListener):
    def on_post_save(self, view):
        # 1. Get script only stack name. line 1: script "Name" [done]
        # 2. Get project key from project settings
        # 3. Send notification over socket with project key, script name, and filename
        # 4. Get response from LiveCode IDE

        # We are only concerned with files using Livecode syntax
        if view.settings().get('syntax') == 'Packages/LiveCode/LiveCode.sublime-syntax':
            stack_name = None

            # Get the script only stack name
            # \A matches beginning of file
            region = view.find('\Ascript "([-a-zA-Z0-9_\s\?!]+)"', 0, sublime.IGNORECASE)
            if region.a >= 0:
                stack_name = re.search('"([-a-zA-Z0-9_\s\?!]+)"', view.substr(region)).group(1)

            print('stack name and filename', stack_name, view.file_name())
