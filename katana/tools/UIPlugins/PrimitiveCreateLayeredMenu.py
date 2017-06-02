from Katana import Nodes3DAPI, NodegraphAPI, LayeredMenuAPI


def PopulateCallback(layeredMenu):
    """
    Callback for the layered menu, which adds entries to the given
    C{layeredMenu} based on the primitive types available to the
    PrimitiveCreate node.

    @type layeredMenu: L{LayeredMenuAPI.LayeredMenu}
    @param layeredMenu: The layered menu to add entries to.
    """
    import Nodes3DAPI
    # Optain a list of names of available primitives from the PrimitiveCreate
    # Node type's parameter hints
    primitiveNames = Nodes3DAPI.PrimitiveCreate._ExtraHints.get('PrimitiveCreate.type').get('options').split('|')

    # Iterate over the names of primitives and add a menu entry for each of them
    # to the given layered menu, using a green-ish color
    for primitiveName in primitiveNames:
        layeredMenu.addEntry(primitiveName, text=primitiveName,
                             color=(0.3, 0.7, 0.3))

def ActionCallback(value):
    """
    Callback for the layered menu, which creates a PrimitiveCreate node and
    sets its B{type} parameter to the given C{value}, which is the name of
    a primitive as set for the menu entry in L{PopulateCallback()}.

    @type value: C{str}
    @rtype: C{object}
    @param value: An arbitrary object that the menu entry that was chosen
        represents. In our case here, this is the name of a primitive as
        passed to the L{LayeredMenuAPI.LayeredMenu.addEntry()} function in
        L{PopulateCallback()}.
    @return: An arbitrary object. In our case here, we return the created
        PrimitiveCreate node, which is then placed in the B{Node Graph} tab
        because it is a L{NodegraphAPI.Node} instance.
    """
    # Create the node, set its function, and set the name with the function name
    # In this case it makes the type of primitive you asked for and makes sure it has a unique name.
    node = NodegraphAPI.CreateNode('PrimitiveCreate')
    node.getParameter('type').setValue(value, 0)
    node.setName(value)
    node.getParameter('name').setValue('/root/world/geo/' + node.getName(), 0)
    return node


# Create and register a layered menu using the above callbacks
# This is where you can change the hotkey
layeredMenu = LayeredMenuAPI.LayeredMenu(PopulateCallback, ActionCallback,
                                         'P', alwaysPopulate=False,
                                         onlyMatchWordStart=False)
LayeredMenuAPI.RegisterLayeredMenu(layeredMenu, 'Primitives')

