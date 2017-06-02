# Copyright (c) 2015 The Foundry Visionmongers Ltd. All Rights Reserved.
"""
Example script that registers a layered menu for the B{Node Graph} tab, which
shows the names of available renderer plugins and sets that to be the default one
when one of the menu entries is chosen.
"""

from Katana import NodegraphAPI, RenderingAPI, LayeredMenuAPI, os
from RenderingAPI import RenderPlugins


def PopulateCallback(layeredMenu):
    """
    Callback for the layered menu, which adds entries to the given
    C{layeredMenu} based on the available renderer plugins.

    @type layeredMenu: L{LayeredMenuAPI.LayeredMenu}
    @param layeredMenu: The layered menu to add entries to.
    """
    # Obtain a list of names of available plugins from the renderer info plug-in
    possibleRenderers = RenderingAPI.RenderPlugins.GetRendererPluginNames(includeViewer=False)

    # Iterate over the names of the renderers and add a menu entry for each of them
    # to the given layered menu, with a varying color
    for renderer in possibleRenderers:
        if renderer == 'dl':
            nodeColor = (0.85, 0.04, 0.04)
            listName = '3Delight'
        elif renderer == 'arnold':
            nodeColor = (0.12, 0.65, 0.87)
            listName = 'Arnold'
        elif renderer == 'prman':
            nodeColor = (0.0, 0.14, 0.6)
            listName = 'Renderman'
        elif renderer == 'vray':
            nodeColor = (1.0, 1.0, 1.0)
            listName = 'V-Ray'
        elif renderer == 'Redshift':
            nodeColor = (0.8, 0.0, 0.8)
            listName = 'Redshift'
        else:
            nodeColor = (0.5, 0.5, 0.5)
        layeredMenu.addEntry(renderer, text=listName,
                             color=nodeColor)

def ActionCallback(value):
    """
    Callback for the layered menu, which sets the default renderer.
    It also clears the shadingNode menu list so it will update.
    @return: An arbitrary object. In our case here, we return the created
    ShadingNode node, which is then placed in the B{Node Graph} tab
    because it is a L{NodegraphAPI.Node} instance.
    """
    setRender = os.environ['DEFAULT_RENDERER']=value
    
    shaderMenu = LayeredMenuAPI.GetLayeredMenu("Shading_Nodes")
    shaderMenu.clear()
    
    return setRender


# Create and register a layered menu using the above callbacks
# This is where you can set the hotkey
layeredMenu = LayeredMenuAPI.LayeredMenu(PopulateCallback, ActionCallback,
                                         'alt+r', alwaysPopulate=False,
                                         onlyMatchWordStart=False)
LayeredMenuAPI.RegisterLayeredMenu(layeredMenu, 'Set_Renderer')
