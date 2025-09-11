::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: GLOBAL VARS
::***************************************************************************/

set GLM_MODE=Official
set GLM_MAIN_VERSION=9
set GLM_OFFICIAL_VERSION=9.2.2
::set GLM_OFFICIAL_VERSION=9.2.1-2025.03.17-PR92
set MAYA_VERSION=2024
:: Edit Renderman version(.mod file lives here)
:: C:\Program Files\Common Files\Autodesk Shared\Modules\Maya


::/***************************************************************************
:: LICENSE
::***************************************************************************/

set MAYA_LICENSE_METHOD=network
set MAYA_CM_DISABLE_ERROR_POPUPS=1
set MAYA_COLOR_MGT_NO_LOGGING=1
set ADSKFLEX_LICENSE_FILE=@sussclpdbuvsg001
::set MAYA_APP_DIR=C:/Shared/
::set GLMCROWD_CHARAMAKER_AUTOLAYOUT=0
::set GLMCROWD_CUSTOMBEHAVIOR_DIR=C:/Users/golaem/Music
::set GLMCROWD_CUSTOMTRIGGER_DIR=C:/Users/golaem/Desktop
::set GLM_MOTIONBLUR_MAKEARRAYS=1
::set GLMCROWD_DIRMAP_ENABLE=0
set GLMCROWD_UNIT=3


::/***************************************************************************
:: MAYA PROJECT
::***************************************************************************/

:: Project
set MAYA_PROJECT=N:\tests\nicolas
::set MAYA_PROJECT=N:\demos\lila2\maya


::/***************************************************************************
:: CROWD VARIABLES
::***************************************************************************/

set GLM_MODULE_PATH=D:\Developments\Golaem%GLM_MAIN_VERSION%\install%MAYA_VERSION%\GolaemCrowd
IF %GLM_MODE% == Debug (
	set GLM_MODULE_PATH=D:\Developments\Golaem%GLM_MAIN_VERSION%\install%MAYA_VERSION%\GolaemCrowdDBG
)
IF %GLM_MODE% == Official (
	set GLM_MODULE_PATH=C:\Program Files\Golaem\Golaem-%GLM_OFFICIAL_VERSION%-Maya%MAYA_VERSION%
)


::/***************************************************************************
:: DEEP VARIABLES
::***************************************************************************/

set GLMD_MODULE_PATH=D:\Developments\GolaemDeep\install%MAYA_VERSION%\GolaemDeep
set GLMP_MODULE_PATH=D:\Developments\GolaemProtores\plugins\maya


::/***************************************************************************
:: PLUGINS / SCRIPTS
::***************************************************************************/

:: Maya
set MAYA_LOCATION=C:\Program Files\Autodesk\Maya%MAYA_VERSION%

:: MTOA_VERSION
set MTOA_MODULE_PATH=C:\Program Files\Autodesk\Arnold\maya%MAYA_VERSION%

:: RLM
::set RLM_DIAGNOSTICS=D:\Temp\RLMDiag.txt

:: Renderman
set RFM_DO_NOT_CREATE_MODULE_FILE=1

:: Physx
set PHYSX_MODULE_PATH=C:\Program Files\Golaem\PhysXForMaya%MAYA_VERSION%

:: USD
::set PXR_PLUGINPATH_NAME=C:\Program Files\Golaem\Golaem-7.3.6-USD0.19.11-windows\procedurals\usd
::set PATH=C:\Program Files\Golaem\Golaem-7.3.6-USD0.19.11-windows\bin;%PATH%
::set PXR_PLUGINPATH_NAME=D:\Users\chaverou\Developments\GolaemForNvUSD7\install19\GolaemCrowd\procedurals\usd
::set PATH=D:\Users\chaverou\Developments\GolaemForNvUSD7\install19\GolaemCrowd\bin;D:\Users\chaverou\Developments\GolaemMisc\golaemExternals\USD\0.19.11nv\windows\lib;%PATH%
::set TF_DEBUG=PLUG*
::set MAYA_USD_MODULE=D:\Users\chaverou\Developments\VFXEnvironment\maya\plugins\2018\MayaUSD

:: Tools
set SKINW_PATH=D:\Developments\
set DPKBC_PATH=D:\Developments\VFXEnvironment\maya\plugins\DPK_bcs-1.4.8

::/***************************************************************************
:: ENVIRONMENT
::***************************************************************************/

:: My Environment
set MY_ENVIRONMENT=D:\Developments\VFXEnvironment\maya
set GLM_ENVIRONMENT=N:\scripts\GolaemUtils\maya

:: Maya
::set PATH=%GLM_MODULE_PATH%\bin;%PATH%
set MAYA_MODULE_PATH=%GLM_MODULE_PATH%;%PHYSX_MODULE_PATH%;%MTOA_MODULE_PATH%;%DPKBC_PATH%;%MAYA_USD_MODULE%;%MAYA_MODULE_PATH%
set MAYA_PLUG_IN_PATH=%MY_ENVIRONMENT%\plugins\%MAYA_VERSION%;%FDDA_PLUGINS%;
set MAYA_SCRIPT_PATH=%GLM_ENVIRONMENT%\scripts\MEL;%MY_ENVIRONMENT%\scripts;%MAYA_SCRIPT_PATH%
set PYTHONPATH=%MY_ENVIRONMENT%\scripts;%SKINW_PATH%;%PYTHONPATH%
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

::C:\Users\chaverou\Software\System\DependencyWalkerx64\depends.exe