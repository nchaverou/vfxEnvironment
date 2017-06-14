import maya.mel as mel
import maya.cmds as cmds
from pymel.all import *
import random
import math
import maya, maya.OpenMaya

def colorClosestVertex(x,y,z) :

    # Le vertice a comparer
    verticeCible = [x,y,z]

    # Nom de l'objet
    selection = cmds.ls(sl=True)
    name = selection[0]

    # Trouve la face la plus proche
    nodeDagPath = maya.OpenMaya.MObject()

    try:
        selectionList = maya.OpenMaya.MSelectionList()
        selectionList.add(name)
        nodeDagPath = maya.OpenMaya.MDagPath()
        selectionList.getDagPath(0, nodeDagPath)
    except:
        raise RuntimeError('NameToNode() failed on %s' % name)

    # A function set to wrap around the object, indicating you can perform mesh operations on it
    mfnMesh = maya.OpenMaya.MFnMesh(nodeDagPath)

    pointA = maya.OpenMaya.MPoint(x,y,z)
    pointB = maya.OpenMaya.MPoint()
    space = maya.OpenMaya.MSpace.kWorld

    # Maya's way of dealing with pointers
    util = maya.OpenMaya.MScriptUtil()
    util.createFromInt(0)
    idPointer = util.asIntPtr()

    mfnMesh.getClosestPoint(pointA, pointB, space, idPointer)

    #return maya.OpenMaya.MScriptUtil(idPointer).asInt()
    f = maya.OpenMaya.MScriptUtil(idPointer).asInt()

    #Recupere la face en vertex
    cmds.select(cmds.polyListComponentConversion( name+'.f['+`f`+']', ff=True, tv=True))

    #Vertex dans une liste
    vertices = cmds.ls(sl=1, fl=1)


    #Parcours pour savoir lequel est le plus proche
    dist = -1
    for vertice in vertices :
        coorVertice = cmds.pointPosition(vertice)
        tempDist = ((coorVertice[0]-verticeCible[0])**2+(coorVertice[1]-verticeCible[1])**2+(coorVertice[2]-verticeCible[2])**2)**.5
        #Garde en memoire le vertex le plus proche
        if(tempDist < dist or dist == -1) :
            dist = tempDist
            closestVertice = vertice

    cmds.select(closestVertice)
    #cmds.polyColorPerVertex(cdo=False)
    #colorVertex = cmds.polyColorPerVertex(query=True,r=True,g=True,b=True,cdo=True)
    #colorVertex = cmds.polyColorPerVertex(vertices, q=1,b=1)

    uv = cmds.polyListComponentConversion(closestVertice,fv=True,tuv=True)

    cmds.pointPosition(uv[0])
    uvCoord = cmds.polyEditUV(uv[0],query=True,u=True,v=True)

    # get shapes of selection:
    shapesInSel = cmds.ls(dag=1,o=1,s=1,sl=1)
    # get shading groups from shapes:
    shadingGrps = cmds.listConnections(shapesInSel,type='shadingEngine')
    # get the shaders:
    shaders = cmds.ls(cmds.listConnections(shadingGrps),materials=1)
    textureName = cmds.listConnections(shaders[0]+".color")[0]
    colorVertex = cmds.colorAtPoint(textureName,o='RGB',u=uvCoord[0], v=uvCoord[1])

    #mel.eval("polyColorPerVertex -q -g -b")


    cmds.select(name)
    return colorVertex

#colorClosestVertex(0,0,0)



def show():

    #indice et noms couleurs
    clr=["Red","Blue","Green","Yellow","Orange"]
    indiceColor=[[0.871, 0, 0.051],[0, 0.341, 0.659],[0, 0.588, 0.141],[0.996, 0.769, 0],[0.906, 0.388, 0.094]]


    #destruction de fenetre si elle existe deja
    if cmds.window("fenetreLego",title="Legolisator",exists=True):
       cmds.deleteUI("fenetreLego",window=True)

    #creation de la fenetre
    cmds.window("fenetreLego",title="Legolisator")

    #Espace selection de la couleur

    cmds.columnLayout( adjustableColumn=True )
    cmds.frameLayout("couleur",label="Color",cll=True,mh=10)


    cmds.radioButtonGrp("color",nrb=4,labelArray4=["Random Color","Other Color","List Color","Object Color"],on1="RandomClr()", on2="OtherClr()", on3="ListClr()", on4="ObjectClr()",sl=1)
    cmds.textScrollList("colorblinn", numberOfRows=5, allowMultiSelection=True, append=clr, si=1)

    cmds.colorSliderGrp("othrColor",label="Other Color",rgb=(0,0,1))

    cmds.setParent('..')

    #espace selection de la taille du lego

    taille=cmds.frameLayout(label="Size",cll=True,mh=10)

    cmds.intSliderGrp('StepSlider', label="Step", min=5, max=100, value=10, field=True)

    #cmds.intSliderGrp('lLego',label='Largeur Lego',min=1,max=7,value=1,field=True)
    #cmds.intSliderGrp('loLego',label='Longueur Lego',min=1,max=10,value=1,field=True)
    cmds.setParent('..')

    other=cmds.frameLayout(label="Autre",cll=True,mh=10)
    cmds.checkBox("bevel", label="High Poly")
    cmds.checkBox("physics", label="Physics")
    cmds.checkBox("animation", label="Animation")
    cmds.intField('start', minValue=0, maxValue=1000, value=0 )
    cmds.intField('end', minValue=0, maxValue=1000, value=10 )
    cmds.setParent('..')


    cmds.button(label="Legoliser !",h=30,w=20, command="animation()")
    cmds.setParent('..' )
    cmds.showWindow("fenetreLego")
    g=cmds.radioButtonGrp("color", query=True, sl=True)

    #First launch
    RandomClr()

def RandomClr():
    cmds.colorSliderGrp("othrColor",edit=True, en=False)
    cmds.textScrollList("colorblinn", edit=True, en=False)



def OtherClr():
    cmds.colorSliderGrp("othrColor",edit=True,en=True)
    cmds.textScrollList("colorblinn", edit=True,en=False)

def ListClr():
    cmds.textScrollList("colorblinn", edit=True,en=True)
    cmds.colorSliderGrp("othrColor",edit=True,en=False)

def ObjectClr():
    cmds.colorSliderGrp("othrColor",edit=True, en=False)
    cmds.textScrollList("colorblinn", edit=True, en=False)


def createLego(x,y,z,name,dimension,victime) :

    g=cmds.radioButtonGrp("color", query=True, sl=True)

    #xlego=cmds.intSliderGrp('lLego', query=True, value=True)
    #zlego=cmds.intSliderGrp('loLego', query=True, value=True)

    #lego de base
    #Base
    cmds.polyCube(name="base",  w=dimension, d=dimension, h=dimension)
    cmds.polyExtrudeFacet('base.f[3]', lsx=0.9, lsy=0.9, kft=True)
    cmds.polyExtrudeFacet('base.f[3]', ltz=-dimension, kft=True)
    cmds.delete("base.f[3]")

    if cmds.checkBox("bevel", query=True, value=True) :
        cmds.polyBevel("base.e[0:11]", "base.e[14]", "base.e[16]", "base.e[18]", "base.e[19]", offset=0.02*dimension)

    #Cylindre
    cmds.polyCylinder(n="cercle0", r=0.3*dimension, h=1.15*dimension, sx=20)
    cmds.move(0,0.1*dimension,0, relative=True)
    cmds.polyExtrudeFacet('cercle0.f[20]',lsx=0.9, lsy=0.9, kft=True)
    cmds.polyExtrudeFacet('cercle0.f[20]',ltz=-dimension, kft=True)
    cmds.delete("cercle0.f[20]")

    if cmds.checkBox("bevel", query=True, value=True) :
        cmds.polyBevel("cercle0.e[20:39]", "cercle0.e[0:19]", "cercle0.e[62:99]", offset=0.02*dimension)


    #Longueur, xLego
    '''for i in range (xlego-1):
        cmds.duplicate("cercle"+`i`, n="cercle"+`i+1`)
        cmds.select("cercle"+`i+1`)
        cmds.move(-2,0,0, relative=True)

    cmds.group("cercle*", name="cerclesx")'''


    # Largeur, zlego
    '''if zlego > 1 :
        for i in range (0, zlego):
            cmds.duplicate("cerclesx", n="cerclesz" +` i+1`)
            cmds.select("cerclesz"+`i+1`)
            cmds.move(0,0,2*i, relative=True)

        cmds.group("cerclesx", "cerclesz*", n="cercles")
        cmds.select("cercles")
        cmds.move(0,0,-zlego+1, relative=True)

    else :
        cmds.rename("cerclesx", "cercles")'''

    # Fin de creation du LEGO
    cmds.polyUnite("cercle0","base", n="lego"+`name`, ch=False)
    cmds.move(x,y,z)

    #Dynamique sur Lego
    if cmds.checkBox("physics", query=True, value=True) and cmds.checkBox("animation", query=True, value=True)==False :
        cmds.rigidBody( n='RigidBodyLego', active=True, b=0.5, sf=0.4 )


    #Shader
    cmds.shadingNode( 'blinn', name='legoBlinn'+`name`, asShader=True )
    cmds.select("lego"+`name`)
    cmds.hyperShade( assign="legoBlinn"+`name`)
    cmds.textScrollList('colorblinn', query=True)

    #Selectionne la victime
    cmds.select(victime)

    #Couleur
    cmds.radioButtonGrp("color", query=True, sl=True)
    #Random
    if cmds.radioButtonGrp("color", query=True, sl=True)==1 :
        randIndClr=random.sample(indiceColor,1)
        cmds.setAttr("legoBlinn"+`name`+".color", randIndClr[0][0],randIndClr[0][1],randIndClr[0][2])


    #Choice
    if cmds.radioButtonGrp("color", query=True, sl=True)==3:
        colorChoice = cmds.textScrollList("colorblinn", query=True,sii=True)
        random.shuffle(colorChoice)
        cmds.setAttr("legoBlinn"+`name`+".color", indiceColor[colorChoice[0]-1][0],indiceColor[colorChoice[0]-1][1],indiceColor[colorChoice[0]-1][2])

    if cmds.radioButtonGrp("color", query=True, sl=True)==2:
        colorOther=cmds.colorSliderGrp("othrColor",query=True,rgb=True)
        cmds.setAttr("legoBlinn"+`name`+".color",colorOther[0],colorOther[1],colorOther[2])

    #Object
    if cmds.radioButtonGrp("color", query=True, sl=True)==4:
        colorObject=colorClosestVertex(x,y,z)
        cmds.setAttr("legoBlinn"+`name`+".color",colorObject[0],colorObject[1],colorObject[2])




# ANIMATION
def animation() :
    # Nom de l'objet
    selection = cmds.ls(sl=True)
    victime = selection[0]
    if(cmds.checkBox("animation", query=True, value=True)) :
        start = cmds.intField('start',query=True, value=True )
        end = cmds.intField('end',query=True, value=True )
        cmds.currentTime( start, edit=True )
        for i in range(end-start):
            voxel(victime)
            cmds.currentTime( start+i+1, edit=True )
    else :
        voxel(victime)

#Recupere la distance entre 2 points
def mag(p1,p2):
    return ((p1[0]-p2[0])**2+(p1[1]-p2[1])**2+(p1[2]-p2[2])**2)**.5

def voxel(victime) :

    #definition
    step = cmds.intSliderGrp('StepSlider',query=True, value=True)


    #Bounding box
    bbox = cmds.exactWorldBoundingBox()

    #Remplit un mesh de particule
    if(len(cmds.ls(sl=1))):
        obj = cmds.ls(sl=1)[0]
        try:
            cmds.particleFill(rs=step,maxX=1,maxY=1,maxZ=1,minX=0,minY=0,minZ=0,pd=1,cp=0)
        except:
            pass

    #Met les particules das une liste
    part = cmds.ls(sl=1)[0]
    closest = cmds.createNode("closestPointOnMesh")
    cmds.connectAttr(obj+".outMesh",closest+".inMesh")
    points = cmds.getAttr(part+".position")
    cmds.delete(part)

    #Recupere tous les rayons
    rayons = []
    for point in points:
        setAttr(closest+".inPosition",point)
        rayons.append(mag(point,getAttr(closest+".position")))
    delete(closest)

    max = 0
    #Recherche le MAX entre 2 particules (distance la plus grande)
    for i in range(len(points)):
            if rayons[i] > max:
                max, p, maxId = rayons[i], points[i], i

    #print max;
    amount = 0
    nbCube = 0.0
    cmds.progressWindow(title='Legosification',progress=amount,status='Legosification',isInterruptable=True )

    #Compte le nombre de lego dans la scene
    objList1=ls("lego*",geometry=True, l=True)
    if (len(objList1)==0) :
        cmds.polyCube(n="lego");
        objList1=ls("lego*",geometry=True, l=True)
    objList2=cmds.listRelatives(objList1,p=True)
    #print len(objList1)
    name=len(objList2)-1
    #Cree des cubes
    for point in points:
        # Check if the dialog has been cancelled
        if cmds.progressWindow( query=True, isCancelled=True ) :
            break
        # Check if end condition has been reached
        if cmds.progressWindow( query=True, progress=True ) >= 100 :
            break
        name+=1
        dimension = (float)(bbox[3]-bbox[0])/(float)(step+1.0);
        #cmds.duplicate("lego")
        #cmds.select("lego"+`i`)
        #cmds.polyCube(w=dimension, h=dimension, d=dimension)
        #cmds.select("lego")
        #cmds.move(point[0],point[1],point[2])
        createLego(point[0],point[1],point[2],name,dimension,victime)
        nbCube += 1
        amount=(nbCube/len(points))*100
        cmds.progressWindow( edit=True, progress=amount, status=('Please Wait ! ') )
    cmds.progressWindow(endProgress=1)

    #Gravity and animation
    if cmds.checkBox("physics", query=True, value=True) and cmds.checkBox("animation", query=True, value=True)==False :
        objList1=ls("lego*",geometry=True, l=True)
        objList2=cmds.listRelatives(objList1, p=True)
        cmds.select(cl=1)
        grav = cmds.gravity()
        #Connect gravity to list of objects
        cmds.connectDynamic(objList2, fields=grav[0])
    #Menage
    if cmds.objExists('lego'):
        cmds.delete("lego")

