from pxr import Sdf, Kind, Usd, UsdGeom
import random

def _AddModel(stage, path, assetPath, animScale):
    '''
    Adds a reference to refPath at the given path in the stage.  This will make
    sure the model hierarchy is maintained by ensuring that all ancestors of
    the path have "kind" set to "group".

    returns the referenced model.
    '''

    # convert path to an Sdf.Path which has several methods that are useful
    # when working with paths.  We use GetPrefixes() here which returns a list
    # of all the prim prefixes for a given path.
    path = Sdf.Path(path)
    for prefixPath in path.GetPrefixes()[1:-1]:
        parentPrim = stage.GetPrimAtPath(prefixPath)
        if not parentPrim:
            parentPrim = UsdGeom.Xform.Define(stage, prefixPath).GetPrim()
            Usd.ModelAPI(parentPrim).SetKind(Kind.Tokens.group)
    # typeless def here because we'll be getting the type from the prim that
    # we're referencing.
    m = stage.DefinePrim(path)
    m.GetReferences().AddReference(assetPath=assetPath, layerOffset=Sdf.LayerOffset(scale=animScale))
    return m

def makeScene():
    femaleAsset = []
    femaleAsset.append('D:/Users/chaverou/Developments/USD/Samples/UsdSkelExamples/HumanFemale/HumanFemale.walk.usd')
    femaleAsset.append('D:/Users/chaverou/Developments/USD/Samples/UsdSkelExamples/HumanFemale/HumanFemale.keepAlive.usd')

    stage = Usd.Stage.CreateNew('Crowds.usda')
    UsdGeom.Xform.Define(stage, '/main')
    UsdGeom.SetStageUpAxis(stage, UsdGeom.Tokens.z)
    stage.SetStartTimeCode(0)
    stage.SetEndTimeCode(150)

    rowColumns = [10, 10]
    for iRow in range(rowColumns[0]):
        for iColumn in range(rowColumns[1]):
            animId = random.randint(0, len(femaleAsset) - 1)
            animScale = random.random()
            translateScale = (random.random() * 2 - 1) * 100
            entityXForm = UsdGeom.Xform.Define(stage, '/main/entity_{}{}'.format(iRow, iColumn))
            _AddModel(stage, '/main/entity_{}{}/skeleton'.format(iRow, iColumn), femaleAsset[animId], animScale)
            translate = ((iRow - 1) * 100 + translateScale, (iColumn - 1) * 100 + translateScale, 0)
            UsdGeom.XformCommonAPI(entityXForm).SetTranslate(translate)

    stage.GetRootLayer().Save()
