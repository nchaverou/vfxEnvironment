import maya.cmds as mc
import maya.OpenMaya as OpenMaya

def getMDagPath(object):
    '''
    Return an MDagPath for the input scene object
    @param object: Object to get MDagPath for
    @type object: str
    '''
    # Check input object
    if not mc.objExists(object):
        print 'Object "' + object + '" does not exist!!'
        return None

    # Get selection list
    selectionList = OpenMaya.MSelectionList()
    OpenMaya.MGlobal.getSelectionListByName(object,selectionList)
    mDagPath = OpenMaya.MDagPath()
    selectionList.getDagPath(0,mDagPath)
    return mDagPath

def isMesh(mesh):
    '''
    Check if the specified object is a polygon mesh or transform parent of a mesh
    @param mesh: Object to query
    @type mesh: str
    '''
    # Check object exists
    if not mc.objExists(mesh): return False
    # Check shape
    meshRelatives = []
    if mc.objectType(mesh) == 'transform': meshRelatives = mc.listRelatives(mesh,s=True,ni=True,pa=True)
    if not meshRelatives: return False
    if mc.objectType(meshRelatives[0]) != 'mesh': return False

    # Return result
    return True

def getMeshFaceIter(mesh):
    '''
    Create an MItMeshPolygon class object from the specified polygon mesh
    @param mesh: Mesh to create function class for
    @type mesh: str
    '''
    # Checks
    if not isMesh(mesh):
        print 'Object ' + mesh + ' is not a polygon mesh!'
        return None

    # Get shape
    if mc.objectType(mesh) == 'transform':
        mesh = mc.listRelatives(mesh,s=True,ni=True,pa=True)[0]

    # Get MFnMesh
    meshPath = getMDagPath(mesh)
    if meshPath is None:
        return None
    meshFaceIt = OpenMaya.MItMeshPolygon(meshPath)
    # Return result
    return meshFaceIt

def getMeshFacesWithMoreThanXVertices(mesh, nbVertices):
    '''
    Return the face id of faces with more than x vertices
    @param mesh: Mesh to check
    @type mesh: str
    @param nbVertices: Nb vertices to check for
    @type nbVertices: int
    '''
    facesWithMore = []
    faceIter = getMeshFaceIter(mesh)
    if faceIter is not None:
        faceIter.reset()
        while faceIter.isDone() is False:
            if faceIter.polygonVertexCount() > nbVertices:
                facesWithMore.append(faceIter.index())
            faceIter.next()
    return facesWithMore


def main():
    selection = mc.ls(sl=True)
    objectsNotValid = []
    for item in selection:
        meshFacesNotValid = getMeshFacesWithMoreThanXVertices(item, 4)
        for meshFaceNotValid in meshFacesNotValid:
            objectsNotValid.append(item + '.f[' + str(meshFaceNotValid) + ']')
        print str(len(meshFacesNotValid)) + ' face(s) not valid in mesh "' + item + '"'
    print str(len(objectsNotValid)) + ' face(s) selected in total'
    mc.select(objectsNotValid)


main()
