import sys
import maya.OpenMaya as om
import maya.OpenMayaMPx as OpenMayaMPx

kPluginNodeName = 'DummyNode'

#**************************************************************************
#! @name Dummy Node
#**************************************************************************
#@{
glmDummyNodeId = om.MTypeId(524285)

class glmDummyNode(OpenMayaMPx.MPxNode):
    _x = om.MObject()
    _y = om.MObject()
    _z = om.MObject()

    def __init__(self):
        OpenMayaMPx.MPxNode.__init__(self)

    def compute(self, plug, dataBlock):
        print 'Computing'

# Creator
def glmDummyNodeCreator():
    return OpenMayaMPx.asMPxPtr(glmDummyNode())

def glmDummyNodeInit():
    nAttr = om.MFnNumericAttribute()
    glmDummyNode._x = nAttr.create('x', 'x', om.MFnNumericData.kFloat, 0.0)
    nAttr.setKeyable(True)
    glmDummyNode._y = nAttr.create('y', 'y', om.MFnNumericData.kFloat, 0.0)
    nAttr.setKeyable(True)
    glmDummyNode._z = nAttr.create('z', 'z', om.MFnNumericData.kFloat, 0.0)
    nAttr.setKeyable(True)
    glmDummyNode.addAttribute( glmDummyNode._x )
    glmDummyNode.addAttribute( glmDummyNode._y )
    glmDummyNode.addAttribute( glmDummyNode._z )
#@}

#**************************************************************************
#! @name Plugin Loaded
#**************************************************************************
#@{
# Initialize the script plug-in
def initializePlugin(mobject):
    mplugin = OpenMayaMPx.MFnPlugin(mobject)
    try:
        mplugin.registerNode( kPluginNodeName, glmDummyNodeId, glmDummyNodeCreator, glmDummyNodeInit, OpenMayaMPx.MPxNode.kDependNode)
    except:
        sys.stderr.write( 'Failed to register node: %s\n' % kPluginNodeName )
        raise

# Uninitialize the script plug-in
def uninitializePlugin(mobject):
    mplugin = OpenMayaMPx.MFnPlugin(mobject)
    try:
        mplugin.deregisterNode( glmDummyNodeId )
    except:
        sys.stderr.write( 'Failed to unregister node: %s\n' % kPluginNodeName )
#@}
