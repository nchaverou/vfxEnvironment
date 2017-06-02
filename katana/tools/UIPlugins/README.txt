Attached is a folder that has the "Tab Menus" that I showed in the video. Copy it to a folder somewhere on your computer. Then in your Katana startup script make sure that you add a reference to that folder to the "KATANA_RESOURCES" environment variable. The scripts must stay in the UIPlugins folder. The environment variable must point to the parent folder of the UIPlugins folder.

For me this looks like:

set "KATANA_RESOURCES=%KATANA_RESOURCES%;C:\Users\Jordan\Dropbox\katana_tools"

If done correctly you will have the following added to your Katana setup.

P - show a menu that allows you to choose a primitive node type and adds it to the node graph.
S - Show you all the shadingNode options for the current default renderer and makes a properly named one when you choose something
Alt + R - Present a list of the active renderer plugins in your setup and allows you to change the default renderer