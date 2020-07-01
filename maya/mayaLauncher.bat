::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: GLOBAL VARS
::***************************************************************************/

set GLM_MODE=Release
set GLM_MAIN_VERSION=7
::set GLM_OFFICIAL_VERSION=7.3.2-2020.04.27-PR2087_ranchComputing
set GLM_OFFICIAL_VERSION=7.3.3
set MAYA_VERSION=2018
set RMAN_VERSION=23.2


::/***************************************************************************
:: LICENSE
::***************************************************************************/

::set GLMCROWD_NO_LICENSE=1
::set GLMCROWD_LAYOUT_LICENSE=1
::set GLMCROWD_NO_PLE=1
set golaem_LICENSE=D:\golaemFull.lic
::set golaem_LICENSE=2375@gitem
set solidangle_LICENSE=D:\arnold.lic
::set solidangle_LICENSE=5053@gitem
::set PIXAR_LICENSE_FILE=9010@GITEM
set MAYA_LICENSE_METHOD=network
set MAYA_ENABLE_LEGACY_VIEWPORT=1


::/***************************************************************************
:: MAYA PROJECT
::***************************************************************************/

:: Customers
::set MAYA_PROJECT=N:\tests\customers\franceTv\covid
::set MAYA_PROJECT=D:\Users\chaverou\Developments\GolaemML\maya
::set MAYA_PROJECT=N:\tests\nicolas
set MAYA_PROJECT=N:\demos\golaem731
::set MAYA_PROJECT=N:\assets\GolaemCharacterPack-7.3.2
::set MAYA_PROJECT=N:\tests\functionalTests\crowd5.0


::/***************************************************************************
:: CROWD VARIABLES
::***************************************************************************/

set GLM_MODULE_PATH=D:\Users\chaverou\Developments\Golaem%GLM_MAIN_VERSION%\install%MAYA_VERSION%\GolaemCrowd
IF %GLM_MODE% == Debug (
	set GLM_MODULE_PATH=D:\Users\chaverou\Developments\Golaem%GLM_MAIN_VERSION%\install%MAYA_VERSION%\GolaemCrowdDBG
)
IF %GLM_MODE% == Official (
	set GLM_MODULE_PATH=C:\Program Files\Golaem\Golaem-%GLM_OFFICIAL_VERSION%-Maya%MAYA_VERSION%
)

::set GLMCROWD_DIRMAP_ENABLE=0
set GLMCROWD_ANL_ENABLE=1
set GLMCROWD_UNIT=3

::/***************************************************************************
:: PLUGINS / SCRIPTS
::***************************************************************************/

:: Maya
set MAYA_LOCATION=C:\Program Files\Autodesk\Maya%MAYA_VERSION%

:: MTOA_VERSION
set MTOA_MODULE_PATH=C:\solidangle\mtoadeploy\%MAYA_VERSION%\mod

:: Renderman
set RFM_DO_NOT_CREATE_MODULE_FILE=1
set RMANTREE=C:\Program Files\Pixar\RenderManProServer-%RMAN_VERSION%\
set RFMTREE=C:\Program Files\Pixar\RenderManForMaya-%RMAN_VERSION%\

:: RLM
set RLM_DIAGNOSTICS=D:\Temp\RLMDiag.txt

:: FDDA
set FDDA_PLUGINS=D:\Users\chaverou\Developments\GolaemML\maya\plugins
set FDDA_SCRIPTS=D:\Users\chaverou\Developments\GolaemML\maya\scripts

:: USD
set PXR_PLUGINPATH_NAME=C:/Program Files/Golaem/Golaem-7.2.2-USD0.19.11-windows/procedurals/usd

:: Xgen
::set PATH=%MAYA_LOCATION%/bin;%MAYA_LOCATION%/lib;%MAYA_LOCATION%/plug-ins/xgen/bin;%MAYA_LOCATION%/plug-ins/xgen/lib;%RMANTREE%/lib;%PATH%

:: Tools
::set FXPT_PATH=C:\Users\chaverou\Developments\fxpt
set SKINW_PATH=D:\Users\chaverou\Developments\skinWrangler


::/***************************************************************************
:: ENVIRONMENT
::***************************************************************************/

:: My Environment
set MY_ENVIRONMENT=D:\Users\chaverou\Developments\VFXEnvironment\maya

::copy "%MY_ENVIRONMENT%\prefs\tools_list_user.yaml" "%APPDATA%\Damage Inc\fxpt\fx_spark\tools_list_user.yaml"

:: Maya
set MAYA_MODULE_PATH=%GLM_MODULE_PATH%;%MTOA_MODULE_PATH%;%MAYA_MODULE_PATH%
set MAYA_PLUG_IN_PATH=%MY_ENVIRONMENT%\plugins\%MAYA_VERSION%;%FDDA_PLUGINS%
set MAYA_SCRIPT_PATH=%MY_ENVIRONMENT%\scripts;%FDDA_SCRIPTS%;%MAYA_SCRIPT_PATH%
set PYTHONPATH=%MY_ENVIRONMENT%\scripts;%FDDA_SCRIPTS%;%FXPT_PATH%;%SKINW_PATH%;%PYTHONPATH%
set XBMLANGPATH=%MY_ENVIRONMENT%\icons;%XBMLANGPATH%


::/***************************************************************************
:: LAUNCH MAYA
::***************************************************************************/

set MAYA_EXE=bin\maya.exe
set RENDER_EXE=bin\Render.exe
set MAYAPY_EXE=bin\mayapy.exe

::set GLMCROWD_DIRMAP_ENABLE=0
:: Regular
"%MAYA_LOCATION%\%MAYA_EXE%"
:: Batch
::"%MAYA_LOCATION%\%MAYA_EXE%" -batch -script "N:/tests/customers/boulder/200602_batchExport/export/SQ0350_SH0200_cleaned2_glm/cache/SQ0350_SH0200_cleaned2_glm.batch.mel" -log "D:/Users/chaverou/mayaBatch.txt"
::"%MAYA_LOCATION%\%MAYA_EXE%" -batch -script "D:/charMaker.mel" -log "D:/Users/chaverou/mayaBatch.txt"
:: Batch Render
:: http://download.autodesk.com/global/docs/maya2014/en_us/index.html?url=files/Command_line_renderer_Render_from_the_command_line.htm,topicNumber=d30e771764
::"%MAYA_LOCATION%\%RENDER_EXE%" -r file -s 10 -e 14 -b 1 -rd "N:/tests/nicolas/scenes/images" -proj %MAYA_PROJECT% -cam perspShape -im "batchRender" -fnc name.#.ext -log "D:/Users/chaverou/renderBatch.txt" "N:/tests/functionalTests/crowd5.0/scenes/26a-batchExport-nc.ma" 
:: MayaPy
::"%MAYA_LOCATION%\%MAYAPY_EXE%"
::pause
:: Ranch
::set MAYA_SCRIPT_PATH=C:\Maya\CurrentJob\scenes;%MAYA_SCRIPT_PATH%
::"%MAYA_LOCATION%\bin\render" -r arnold -x 960 -y 540 -s 2 -e 2 -cam "persp" -rd C:\Maya\Output\1_frames -im mainSim_render002_RC  -proj C:\Maya\CurrentJob C:\Maya\CurrentJob\scenes\mainSim_render002_RC.mb
::"%MAYA_LOCATION%\%MAYA_EXE%" -batch -script "C:\Maya\CurrentJob\scenes\dirMap_golaem.mel" -log "D:/Users/chaverou/mayaBatch.txt"
::pause