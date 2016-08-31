#**********************************************************************
#
# To Complete
#
#
#
#**********************************************************************


from PySide import QtGui, QtCore
import maya.cmds as cmds
import nc.utils.nMaya as nmutils


#**********************************************************************
#
# UI
#
#**********************************************************************

# Main
class nFastWindow(QtGui.QMainWindow):

    def __init__(self, parent=None):
        super(nFastWindow, self).__init__(parent)
        self.setParent(nmutils.getMayaMainWindow())
        self.setWindowFlags(QtCore.Qt.Window | QtCore.Qt.FramelessWindowHint)
        #self.setWindowFlags(QtCore.Qt.FramelessWindowHint)  # no title bar
        self.setAttribute(QtCore.Qt.WA_TranslucentBackground)  # transparent background

        self.installEventFilter(self)  # link events

        # Main Widget
        mainWidget = QtGui.QWidget(self)
        self.setCentralWidget(mainWidget)

        #  Layout
        mainLayout = QtGui.QGridLayout(self)
        mainLayout.setHorizontalSpacing(2)
        mainWidget.setLayout(mainLayout)
        #

        # Create Crowd buttons
        iconDir = "C:/Users/chaverou/My Environment/Maya/icons/"
        mainLayout.addWidget(QtGui.QLabel("Crowd: "), 0, 0)

        dispLayout = QtGui.QGridLayout(self)
        dispLayout.setHorizontalSpacing(1)
        dispLayout.setVerticalSpacing(1)
        dispLayout.addWidget(self.createPushButton(iconDir + "addMtoaAttribute.png", "Cylinders", 10, nChangeDisplayTypeCyl), 0, 0)
        dispLayout.addWidget(self.createPushButton(iconDir + "addMtoaAttribute.png", "Animation Bones", 10, nChangeDisplayTypeAnB), 0, 1)
        dispLayout.addWidget(self.createPushButton(iconDir + "addMtoaAttribute.png", "Physics Shape", 10, nChangeDisplayTypePhS), 1, 0)
        dispLayout.addWidget(self.createPushButton(iconDir + "addMtoaAttribute.png", "Render Previz", 10, nChangeDisplayTypeRPz), 1, 1)

        mainLayout.addLayout(dispLayout, 0, 1)
        mainLayout.addWidget(self.createPushButton(iconDir + "refresh.png", "Refresh Display", 30, nRefreshDisplay), 0, 2)
        mainLayout.addWidget(self.createPushButton(iconDir + "attachObjectToEntity.png", "Abcdef", 30, nRefreshDisplay), 0, 3)

        # Create Maya buttons
        mainLayout.addWidget(QtGui.QLabel("Maya: "), 1, 0)
        mainLayout.addWidget(self.createPushButton(iconDir + "setMayaProject.png", "Set Maya Project", 30, nmutils.nSetMayaProject), 1, 1)
        mainLayout.addWidget(self.createPushButton(iconDir + "deleteUnusedNodes.png", "Delete Unused Nodes", 30, nmutils.nDeleteUnusedNodes), 1, 2)
        mainLayout.addWidget(self.createPushButton(iconDir + "particleComponent.png", "Particle Component", 30, nmutils.nSelectParticlesInComponentMode), 1, 3)
        mainLayout.addWidget(self.createPushButton(iconDir + "particleComponentEditor.png", "Particle Component Editor", 30, nmutils.nOpenComponentEditor), 1, 4)

        # Get Size and center on mouse cursor
        windowSize = mainLayout.minimumSize()
        self.move(nGetMousePos() - QtCore.QPoint(windowSize.width(), windowSize.height()) / 2)  # opens at mouse position

    # Creates a button
    def createPushButton(self, iconPath, toolTip, size, command):
        icon = QtGui.QIcon(iconPath)
        iconSize = QtCore.QSize(size, size)
        button = QtGui.QPushButton(self)
        button.setIcon(icon)
        button.setIconSize(iconSize)
        # button.setFlat(True)
        button.setFixedSize(iconSize + QtCore.QSize(8, 8))
        button.setContentsMargins(4, 4, 4, 4)
        button.setToolTip(toolTip)
        button.clicked.connect(command)
        return button

    # Event filter
    def eventFilter(self, obj, event):
        if event.type() == QtCore.QEvent.WindowDeactivate:
            self.close()
            return True
        return False


#**********************************************************************
#
# System
#
#**********************************************************************

# Return the position of the mouse
def nGetMousePos():
    point = QtGui.QCursor().pos()
    # print "x: %s; y: %s" % (point.x(), point.y())
    return point


#**********************************************************************
#
# Crowd
#
#**********************************************************************

# refresh display for each CrowdEntityType
def nRefreshDisplay():
    eTypes = nmutils.nGetObjectsOfType("CrowdEntityTypeNode")
    for eType in eTypes:
        cmds.setAttr((eType + ".skinnedMeshNeedRefresh"), 1)


# Change display type of each CrowdEntityType
def nChangeDisplayType(displayType):
    eTypes = nmutils.nGetObjectsOfType("CrowdEntityTypeNode")
    for eType in eTypes:
        cmds.setAttr((eType + ".renderFilter"), displayType)


# Declinaisons of nChangeDisplayType
def nChangeDisplayTypeCyl():
    nChangeDisplayType(0)

def nChangeDisplayTypeAnB():
    nChangeDisplayType(1)

def nChangeDisplayTypePhS():
    nChangeDisplayType(2)

def nChangeDisplayTypeRPz():
    nChangeDisplayType(3)


#**********************************************************************
#
# Launchers
#
#**********************************************************************
def main():
    ui = nFastWindow()
    ui.show()
    return ui

if __name__ == '__main__':
    main()
