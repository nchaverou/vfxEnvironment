"""*************************************************************************
*                                                                          *
*     Copyright (C) Golaem S.A. & Mikros Image - All Rights Reserved.      *
*                                                                          *
*************************************************************************"""

from PySide import QtGui, QtCore
from shiboken import wrapInstance
from maya import OpenMayaUI as OpenMayaUI
import maya.OpenMaya as OpenMaya
import maya.cmds as cmds

mayaMainWindowPtr = OpenMayaUI.MQtUtil.mainWindow()
mayaMainWindow = wrapInstance(long(mayaMainWindowPtr), QtGui.QWidget)

#**********************************************************************
#
# SimCacheLibWindow
#
#**********************************************************************
class OneClickWorkflow(QtGui.QMainWindow):
    #------------------------------------------------------------------
    # Constructor
    #------------------------------------------------------------------
    def __init__(self, parent=None):
        super(OneClickWorkflow, self).__init__(parent)

        self.selectionChangedCb = OpenMaya.MEventMessage.addEventCallback("SelectionChanged", self.eventSelectionChanged)

        # Init
        self.initUI()


    #******************************************************************
    # UI Accessors
    #******************************************************************

    #------------------------------------------------------------------
    # UI
    #------------------------------------------------------------------
    def initUI(self):

        # Window properties
        self.setParent(mayaMainWindow)
        self.setWindowFlags(QtCore.Qt.Window)
        self.setWindowTitle("Golaem One Click Workflow Tool")
        self.setObjectName("glmOneClickWorkflowWnd")
        self.installEventFilter(self)

        # Central Widget
        mainWidget = QtGui.QWidget(self)
        self.setCentralWidget(mainWidget)
        mainLayout = QtGui.QGridLayout(self)
        mainLayout.setHorizontalSpacing(0)
        mainLayout.setVerticalSpacing(0)
        mainWidget.setLayout(mainLayout)

        # Character Widget
        characterLayout = QtGui.QGridLayout(self)
        mainLayout.addLayout(characterLayout, 0, 0)

    #------------------------------------------------------------------
    # Event Filter
    #------------------------------------------------------------------
    def eventFilter(self, obj, event):
        # Close event, do we need to save
        if event.type() == QtCore.QEvent.Close:
            OpenMaya.MMessage.removeCallback(self.selectionChangedCb)
            return True
        return False


    #------------------------------------------------------------------
    # selectionChanged
    #------------------------------------------------------------------
    def eventSelectionChanged(self, selection):
        print ("bimbamboum" + str(cmds.ls(selection=True)))



#**********************************************************************
#
# Launchers
#
#**********************************************************************
def main():
    ui = OneClickWorkflow()
    ui.show()
    return ui

if __name__ == '__main__':
    main()
