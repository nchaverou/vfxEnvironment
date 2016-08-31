#**********************************************************************
#
#   nMayaUtils.py by N. Chaverou
#   A set of convenient Maya based functions
#
#**********************************************************************

import maya.cmds as cmds
import maya.mel as mel
import maya.OpenMayaUI as omui
import PySide.QtGui as QtGui
from shiboken import wrapInstance
import os
import sys

#**********************************************************************
# Selection
#**********************************************************************

# Return all objects of type
def getObjectsOfType(objectType):
    return cmds.ls(type=objectType)


#**********************************************************************
# Dynamics
#**********************************************************************

# Select particles in component mode
def selectParticlesInComponentMode():
    cmds.select(clear=True)
    particles = getObjectsOfType("particle")
    for particle in particles:
        particleCount = (cmds.particle(particle, query=True, count=True) - 1)
        cmds.select(particle+".pt[0:"+str(particleCount)+"]", add=True)


# Open the Component Editor
def openComponentEditor():
    selectParticlesInComponentMode()
    mel.eval('ComponentEditor;')


#**********************************************************************
# Project
#**********************************************************************

# Set Maya Project
def setMayaProject():
    directories = cmds.fileDialog2(fileMode=3, caption="Select nProject Directory")
    if (directories is not None):
        print ('setProject ' + directories[0])
        mel.eval('setProject "' + directories[0] + '"')

# Reload the python scripts of a directory
def reloadPythonDir(pythonDir):
    for file in os.listdir(pythonDir):
        if file.endswith(".py"):
            moduleName = file.replace('.py', '')
            if moduleName not in sys.modules:
                exec('import '+ moduleName)
            else: 
                print reload(sys.modules[moduleName])

#**********************************************************************
# Misc
#**********************************************************************

# Return MayaMainWindow
def getMayaMainWindow():
    mayaMainWindowPtr = omui.MQtUtil.mainWindow()
    return wrapInstance(long(mayaMainWindowPtr), QtGui.QWidget)

# Delete Unused shaders
def deleteUnusedNodes():
    mel.eval('hyperShadePanelMenuCommand("hyperShadePanel1", "deleteUnusedNodes");')
