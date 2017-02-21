livecode-sublimetext
==============
LiveCode Package for Sublime Text

# What does this package do?

The package adds syntax highlighting for LiveCode files. It is intended for editing script only stacks. The package includes a number of snippets that provide auto-completion when creating new handlers, if-then statements, try/catch blocks, etc.

Auto-complete is also provided for all keywords, properties, functions, and commands.

# Notifying LiveCode of script only stack updates

To send requests to a specified server and port whenever LiveCode files are saved add the following to your Sublime Text `.sublime-project` file.

```
"livecode":
{
  "notify_on_save": true,
  "notify_server":
  {
    "host": "localhost",
    "port": PORT_NUMBER,
    "debug": false
  }
}
```

# Plugin installation
Please use [Package Control][pc] to install the linter plugin. This will ensure that the plugin will be updated when new versions are available. If you want to install from source so you can modify the source code, you probably know what you are doing so we won’t cover that here.

To install via Package Control, do the following:

1. Within Sublime Text, bring up the [Command Palette][cmd] and type `install`. Among the commands you should see `Package Control: Install Package`. If that command is not highlighted, use the keyboard or mouse to select it. There will be a pause of a few seconds while Package Control fetches the list of available plugins.

2. When the plugin list appears, type `livecode`. Among the entries you should see `LiveCode`. If that entry is not highlighted, use the keyboard or mouse to select it.
