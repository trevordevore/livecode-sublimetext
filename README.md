livecode-sublimetext
==============
LiveCode Package for Sublime Text

# What does this package do?

The package adds syntax highlighting, auto completion, and symbol indexing (on, command, function, getprop/setprop) for LiveCode files. It is intended for editing script only stacks. The package includes a number of snippets that provide auto completion when creating new handlers, if-then statements, try/catch blocks, etc.

Auto complete is also provided for all keywords, properties, functions, and commands.

# Notifying LiveCode of script only stack updates

When using the LiveCode package you can configure a Sublime Text [project](https://www.sublimetext.com/docs/3/projects.html) to send a request to a server each time you save a LiveCode file. This allows you to notify a stack in LiveCode that is accepting connections about updates to scripts.

To send requests to a specified server and port whenever LiveCode files are saved, create a Sublime Text project for your folder tree.  Once you have done that, edit the  `.sublime-project` file.  Here is an example.
You will need to modify "MyProject" and possibly the port number that you are using.

```
{
	"folders":
	[
		{
			"folder_exclude_patterns":
			[
				"_builds"
			],
			"path": ".",
			"name": "MyProject",
		}
	],
	"livecode":
	{
  		"notify_on_save": true,
  		"notify_server":
  		{
    		"host": "localhost",
    		"port": 61373,
    		"debug": false
  		}
	}
}

```

# Suggested Configuration

Here are some suggested [user configuration settings](https://www.sublimetext.com/docs/3/settings.html) for Sublime Text:

```
{
    "auto_complete": false,
    "auto_complete_commit_on_tab": true,
    "translate_tabs_to_spaces": true,
    "trim_trailing_white_space_on_save": true,
    "ensure_newline_at_eof_on_save": true,
    ...
}
```

**auto_complete**: Set to false so that auto complete suggestions don't appear while typing. Press Control + Spacebar to show a list of suggestions.
**auto_complete_commit_on_tab**: Press TAB to auto complete using the first match. The TAB key can be useful when you want to auto complete a variable name you are typing.
**translate_tabs_to_spaces**: Always store spaces instead of tabs.
**trim_trailing_white_space_on_save**: Remove any trailing white space from all lines when saving. This helps you avoid your version control system seeing files as being changed when there is only trailing white space.
**ensure_newline_at_eof_on_save**: Always add a newline at the end of the file when saving.

# Screencasts

- [Configuring Sublime Text User Settings when Working with LiveCode](https://www.youtube.com/watch?v=RkhrHdah0zY)
- [Connecting a Sublime Text project to a Levure appllication running in the LiveCode IDE](https://www.youtube.com/watch?v=gkVo35Tb3ck)

# Plugin installation
Please use [Package Control][pc] to install the linter plugin. This will ensure that the plugin will be updated when new versions are available. If you want to install from source so you can modify the source code, you probably know what you are doing so we won’t cover that here.

To install via Package Control, do the following:

1. Within Sublime Text, bring up the [Command Palette][cmd] and type `install`. Among the commands you should see `Package Control: Install Package`. If that command is not highlighted, use the keyboard or mouse to select it. There will be a pause of a few seconds while Package Control fetches the list of available plugins.

2. When the plugin list appears, type `livecode`. Among the entries you should see `LiveCode`. If that entry is not highlighted, use the keyboard or mouse to select it.

[pc]: https://sublime.wbond.net/installation
[cmd]: http://docs.sublimetext.info/en/sublime-text-3/extensibility/command_palette.html
