# Copyright (c) 2015 The Foundry Visionmongers Ltd. All Rights Reserved.
"""
Example script that registers a layered menu for the B{Node Graph} tab, which
shows the names of available shaders and creates a ShadingNode node
with the chosen shader set on it when one of the menu entries is chosen.
"""

from Katana import NodegraphAPI, RenderingAPI, LayeredMenuAPI, os
from RenderingAPI import RenderPlugins


def PopulateCallback(layeredMenu):
    """
    Callback for the layered menu, which adds entries to the given
    C{layeredMenu} based on the available shaders.

    @type layeredMenu: L{LayeredMenuAPI.LayeredMenu}
    @param layeredMenu: The layered menu to add entries to.
    """
    # Obtain a list of names of available shaders from the renderer info plug-in
    renderer = RenderingAPI.RenderPlugins.GetDefaultRendererPluginName()
    rendererInfoPlugin = RenderPlugins.GetInfoPlugin(renderer)
    shaderType = RenderingAPI.RendererInfo.kRendererObjectTypeShader
    shaderNames = rendererInfoPlugin.getRendererObjectNames(shaderType)

    # Iterate over the names of shaders and add a menu entry for each of them
    # to the given layered menu.
    for shaderName in shaderNames:
        layeredMenu.addEntry(shaderName, text=shaderName,
                             color=(1.0, 0.3, 0.3))

def ActionCallback(value):
    """
    Callback for the layered menu, which creates a ShadingNode node and
    sets its B{nodeType} parameter to the given C{value}, which is the name of
    a shader as set for the menu entry in L{PopulateCallback()}.

    @type value: C{str}
    @rtype: C{object}
    @param value: An arbitrary object that the menu entry that was chosen
        represents. In our case here, this is the name of a dl shader as
        passed to the L{LayeredMenuAPI.LayeredMenu.addEntry()} function in
        L{PopulateCallback()}.
    @return: An arbitrary object. In our case here, we return the created
        ShadingNode node, which is then placed in the B{Node Graph} tab
        because it is a L{NodegraphAPI.Node} instance.
    """
    renderer = RenderingAPI.RenderPlugins.GetDefaultRendererPluginName()
    if renderer == 'dl':
        shadingNodeType = 'DlShadingNode'
    elif renderer == 'arnold':
        shadingNodeType = 'ArnoldShadingNode'
    elif renderer == 'prman':
        shadingNodeType = 'PrmanShadingNode'
    elif renderer == 'vray':
        shadingNodeType = 'VrayShadingNode'
    elif renderer == 'Redshift':
        shadingNodeType = 'RedshiftShadingNode'


    # Create the node, set its shader, and set the name with the shader name
    node = NodegraphAPI.CreateNode(shadingNodeType)
    node.getParameter('nodeType').setValue(value, 0)
    node.setName(value)
    node.getParameter('name').setValue(node.getName(), 0)
    node.checkDynamicParameters()
    return node


# Create and register a layered menu using the above callbacks
# This is where you can set the hotkey
layeredMenu = LayeredMenuAPI.LayeredMenu(PopulateCallback, ActionCallback,
                                         'S', alwaysPopulate=False,
                                         onlyMatchWordStart=False)
LayeredMenuAPI.RegisterLayeredMenu(layeredMenu, 'Shading_Nodes')

