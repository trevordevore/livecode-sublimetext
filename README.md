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
