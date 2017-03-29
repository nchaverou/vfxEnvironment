import maya.cmds as cmds
import maya.OpenMayaUI as omui
from Qtpy.Qt import QtWidgets
mayaApi = cmds.about(api=True)
if mayaApi >= 201700:
    from shiboken2 import wrapInstance
else:
    from shiboken import wrapInstance

#**************************************************************************
#! @name Qt Utils
#**************************************************************************
#@{
# Get Layout (can be used to hack the Attribute Editor)
def getLayout(layout):
    mayaLayoutPtr = omui.MQtUtil.findLayout(layout)
    return wrapInstance(long(mayaLayoutPtr), QtWidgets.QWidget)

# Build QT Widget
def buildQT(layout, node):
    mayaLayout = getLayout(layout)
    mayaLayoutObj = mayaLayout.findChild(QtWidgets.QBoxLayout)

    #create the GUI/widget
    widget = QtWidgets.QLabel()
    widget.setText('my uber awesome label')

    #add the widget to the layout
    mayaLayoutObj.insertWidget(0,widget)

# Update  QT Widget
def updateQT(lay, collisionNode):
    return
