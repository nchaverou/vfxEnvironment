::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: USD VARS
::***************************************************************************/

::set USD_FILE=D:\Users\chaverou\Developments\USD\Samples\Kitchen_set\Kitchen_set.usd
::set USD_FILE=D:\Users\chaverou\Developments\USD\Samples\PointInstancedMedCity\PointInstancedMedCity.usd
set USD_FILE=D:\Users\chaverou\Developments\USD\Samples\UsdSkelExamples\HumanFemale\HumanFemale.walk.usd
::set USD_FILE=D:\Users\chaverou\Developments\USD\Samples\UsdSkelExamples\HumanFemale\HumanFemale.keepAlive.usd
::set USD_FILE=D:\Users\chaverou\Developments\USD\Samples\UsdSkelExamples\HumanFemale\HumanFemale.usd
::set USD_FILE=D:\Users\chaverou\Developments\USD\Samples\atomsCacheToUsd\atomscache.usda
::set USD_FILE=D:\Users\chaverou\Developments\USD\usd-win64_py27_release\share\usd\examples\plugin\usdDancingCubesExample\resources\usdDancingCubesExample\dancingCubes.usda
::set USD_FILE=D:\Users\chaverou\Developments\USD\usd-win64_py27_release\share\usd\examples\plugin\usdRecursivePayloadsExample\resources\usdRecursivePayloadsExample\root.usda
::set USD_FILE=D:\Users\chaverou\Developments\VFXEnvironment\usd\HelloWorld.usda
::set USD_FILE=D:\Users\chaverou\Developments\VFXEnvironment\usd\Crowds.usda


::/***************************************************************************
:: ENV
::***************************************************************************/

::set USD_EXAMPLES=D:\Users\chaverou\Developments\USD\usd-win64_py27_release\share\usd\examples\plugin
::set PATH=%USD_EXAMPLES%;%PATH%

::/***************************************************************************
:: USD VIEWER
::***************************************************************************/

set USD_LOCATION=D:\Users\chaverou\Developments\USD\usd-win64_py27_release
set USD_VIEWER=bin\usdview.cmd
"%USD_LOCATION%\%USD_VIEWER%" "%USD_FILE%"

pause
