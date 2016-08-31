import maya.cmds as cmds
import maya.OpenMayaUI as omui
import maya.api.OpenMayaUI as nomui

# Callback Change layout layers visibility based on camera
def glmChangeVisibility(*args):
    panel = cmds.getPanel(withFocus=True)
    camera = cmds.modelPanel( panel, query=True, camera=True )
    # Change visiblity
    if camera == 'persp':
        print ('hide persp: ' + camera)
        cmds.glmHistory(edit=True, node="cacheProxyShape1", transformId=1, enable=True)
        cmds.glmHistory(edit=True, node="cacheProxyShape1", transformId=0, enable=False)
    elif camera == 'persp1':
        print ('hide persp1 ' + camera)
        cmds.glmHistory(edit=True, node="cacheProxyShape1", transformId=1, enable=False)
        cmds.glmHistory(edit=True, node="cacheProxyShape1", transformId=0, enable=True)
          
# Main
panel = cmds.getPanel(withFocus=True)
camera = cmds.modelPanel(panel, query=True, camera=True)
id = omui.MUiMessage.addCameraChangedCallback(panel, glmChangeVisibility)   
#omui.MUiMessage.removeCallback(id)
