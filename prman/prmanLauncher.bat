::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: GLOBAL VARS
::***************************************************************************/

set RIB_FILE=N:\tests\nicolas\renderman\xgenTestRman\rib\0011\perspShape_Final.0011_n.rib
set OUT_RIB_FILE=C:\xgenScene\capture.rib

::/***************************************************************************
:: GOLAEM
::***************************************************************************/

set MAYA_VERSION=2016
set GLM_INSTALL_PREFIX=C:/Users/chaverou/Developments/Golaem 5/install%MAYA_VERSION%/GolaemCrowdDBG

::/***************************************************************************
:: MAYA 
::***************************************************************************/

set MAYA_LOCATION=C:\Program Files\Autodesk\Maya%MAYA_VERSION%
set XGEN_LOCATION=%MAYA_LOCATION%\plug-ins\xgen

::/***************************************************************************
:: LICENSE
::***************************************************************************/

::set solidangle_LICENSE=C:\arnold.lic

::/***************************************************************************
:: PRMAN
::***************************************************************************/

set RMS_PROCEDURAL_PATH=%GLM_INSTALL_PREFIX%\procedurals
set RMANTREE=C:\Program Files\Pixar\RenderManProServer-21.3\
set RMSTREE=C:\Program Files\Pixar\RenderManForMaya-21.3-maya2016\
set PATH=%GLM_INSTALL_PREFIX%\bin;%RMANTREE%\bin\;%MAYA_LOCATION%\bin;%XGEN_LOCATION%\bin;%PATH%

::/***************************************************************************
:: LAUNCH PRMAN
::***************************************************************************/

set PRMAN_EXE=bin\prman.exe
::"%RMANTREE%\%PRMAN_EXE%" -capture "%OUT_RIB_FILE%" "%RIB_FILE%"
::"%RMANTREE%\%PRMAN_EXE%" "%RIB_FILE%"
"%RMANTREE%\%PRMAN_EXE%" %OUT_RIB_FILE%

pause