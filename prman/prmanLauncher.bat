::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: GLOBAL VARS
::***************************************************************************/

set RIB_FILE=C:\Temp\out.rib
set OUT_RIB_FILE=C:\Temp\outExpand.rib

::/***************************************************************************
:: GOLAEM
::***************************************************************************/

set RMAN_VERSION=22.5
set MAYA_VERSION=2018
set GLM_MAIN_VERSION=7
set GLM_INSTALL_PREFIX=D:\Users\chaverou\Developments\Golaem%GLM_MAIN_VERSION%\install%MAYA_VERSION%\GolaemCrowd

::/***************************************************************************
:: MAYA 
::***************************************************************************/

::set MAYA_LOCATION=C:\Program Files\Autodesk\Maya%MAYA_VERSION%
::set XGEN_LOCATION=%MAYA_LOCATION%\plug-ins\xgen

::/***************************************************************************
:: LICENSE
::***************************************************************************/

::set solidangle_LICENSE=C:\arnold.lic

::/***************************************************************************
:: PRMAN
::***************************************************************************/

set RMS_PROCEDURAL_PATH=%GLM_INSTALL_PREFIX%\procedurals
set RMANTREE=C:\Program Files\Pixar\RenderManProServer-%RMAN_VERSION%\
set RMSTREE=C:\Program Files\Pixar\RenderManForMaya-%RMAN_VERSION%-maya%MAYA_VERSION%\
set PATH=%GLM_INSTALL_PREFIX%\bin;%RMANTREE%\bin\;%MAYA_LOCATION%\bin;%XGEN_LOCATION%\bin;%PATH%

::/***************************************************************************
:: LAUNCH PRMAN
::***************************************************************************/

set PRMAN_EXE=bin\prman.exe
"%RMANTREE%\%PRMAN_EXE%" -capture "%OUT_RIB_FILE%" "%RIB_FILE%"
::"%RMANTREE%\%PRMAN_EXE%" "%RIB_FILE%"
::"%RMANTREE%\%PRMAN_EXE%" %OUT_RIB_FILE%

pause