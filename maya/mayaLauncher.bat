::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: GLOBAL VARS
::***************************************************************************/

set GLMCROWD_VERSION=5
set GLMCROWD_MODE=Debug
set GLMCROWD_DEV=1
set MAYA_VERSION=2018
set MAYA_BATCH_RENDER=0
set RMAN_VERSION=22.1

::/***************************************************************************
:: LICENSE
::***************************************************************************/

::set GLMCROWD_NO_LICENSE=1
::set GLMCROWD_LAYOUT_LICENSE=1
::set GLMCROWD_NO_PLE=1
set golaem_LICENSE=C:\golaem.lic
::set golaem_LICENSE=""
::set golaem_LICENSE=2375@gitem
set solidangle_LICENSE=C:\arnold.lic
::set solidangle_LICENSE=5053@gitem
::set PIXAR_LICENSE_FILE=9010@GITEM
set peregrinel_LICENSE=3033@gitem
::set redshift_LICENSE=5052@gitem
set RLM_DIAGNOSTICS=C:\Temp\RLMDiag.txt
set GLMCROWD_LAYOUTSAVE_ENABLE=1


::/***************************************************************************
:: MAYA PROJECT
::***************************************************************************/

:: Fonctional
::set MAYA_PROJECT=N:\tests\functionalTests\crowd5.0
::set MAYA_PROJECT=N:\demos\scenesDemos\crowd5.0

:: Customers
::set MAYA_PROJECT=N:\demos\xgen
::set MAYA_PROJECT=N:\tests\customers\circus\20181211_vector
::set MAYA_PROJECT=N:\tests\nicolas
set MAYA_PROJECT=N:\assets\GolaemCharacterPack-6.4.1

:: Divers
::set MAYA_PROJECT=C:\renderScene
::set MAYA_PROJECT=N:\bugs
::set MAYA_PROJECT=P:\


::/***************************************************************************
:: CROWD VARIABLES
::***************************************************************************/

IF %GLMCROWD_DEV% == 1 IF %GLMCROWD_MODE% == Release (
	set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\Golaem %GLMCROWD_VERSION%\install%MAYA_VERSION%\GolaemCrowd
)
IF %GLMCROWD_DEV% == 1 IF %GLMCROWD_MODE% == Debug (
	set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\Golaem %GLMCROWD_VERSION%\install%MAYA_VERSION%\GolaemCrowdDBG
)
IF %GLMCROWD_DEV% == 0 (
	set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-6.4.1-2018.12.11-PR1610-Maya%MAYA_VERSION%
)

set GLMCROWD_ANL_ENABLE=0
set GLMCROWD_UNIT=3
set MAYA_DISABLE_CLIC_IPM=1
::set MAYA_VP2_USE_VP1_SELECTION=1


echo "*********************************************************\n"
echo %GLM_INSTALL_PREFIX%
echo "*********************************************************\n"

set GLM_CROWD_MODULE_PATH=%GLM_INSTALL_PREFIX%


::/***************************************************************************
:: PLUGINS / SCRIPTS
::***************************************************************************/

:: My Environment
set MY_ENVIRONMENT=C:\Users\chaverou\Developments\vfxEnvironment\maya

:: Maya
set MAYA_LOCATION=C:\Program Files\Autodesk\Maya%MAYA_VERSION%

:: MTOA_VERSION
set MTOA_MODULE_PATH=C:\solidangle\mtoadeploy\%MAYA_VERSION%

:: Renderman
::set RFM_SHOW_PATH=%GLM_INSTALL_PREFIX%\shaders\
set RMANTREE=C:\Program Files\Pixar\RenderManProServer-%RMAN_VERSION%\
set RMSTREE=C:\Program Files\Pixar\RenderManForMaya-%RMAN_VERSION%-maya%MAYA_VERSION%\
IF %RMAN_VERSION% == 22.1 (
	set RMSTREE=C:\Program Files\Pixar\RenderManForMaya-%RMAN_VERSION%\
)
set RFMTREE=%RMSTREE%
::set RFM_DO_NOT_CREATE_MODULE_FILE=0

set RENDERMAN_MODULE_PATH=%RMSTREE%\etc
IF %RMAN_VERSION% == 22.1 (
	set RENDERMAN_MODULE_PATH=%RMSTREE%
)

:: Xgen
set PATH=%MAYA_LOCATION%/bin;%MAYA_LOCATION%/lib;%MAYA_LOCATION%/plug-ins/xgen/bin;%MAYA_LOCATION%/plug-ins/xgen/lib;%RMANTREE%/lib;%PATH%

:: YETI
set YETI_MODULE_PATH=C:\Users\chaverou\Developments\vfxEnvironment\maya\plugins\2018\Yeti-v3.1.2_Maya%MAYA_VERSION%-windows
set MTOA_EXTENSIONS_PATH=%YETI_MODULE_PATH%\plug-ins;%MTOA_EXTENSIONS_PATH%
set ARNOLD_PLUGIN_PATH=%YETI_MODULE_PATH%\bin;%ARNOLD_PLUGIN_PATH%

:: Tools
set FXPT_PATH=C:\Users\chaverou\Developments\fxpt
set SKINW_PATH=C:\Users\chaverou\Developments\skinWrangler
set PYTHONBINDINGS=C:\Users\chaverou\Developments\Golaem Binding\install


::/***************************************************************************
:: ENVIRONMENT
::***************************************************************************/

:: Copy and rename the source shelf file
::copy "%MY_ENVIRONMENT%\shelves\shelf_Nicolas.original" "%MY_ENVIRONMENT%\shelves\shelf_Nicolas.mel"

:: Copy Sparx presets
copy "%MY_ENVIRONMENT%\prefs\tools_list_user.yaml" "%APPDATA%\Damage Inc\fxpt\fx_spark\tools_list_user.yaml"

::set VRAY_FOR_MAYA2016_PLUGINS_x64=C:\Users\chaverou\Developments\vrayTestPlugin\vrayTestPlugin\x64\Release;%VRAY_FOR_MAYA2016_PLUGINS_x64%

:: Maya
::set PATH=%SystemRoot%;%SystemRoot%\system;%PATH%
set MAYA_MODULE_PATH=%GLM_CROWD_MODULE_PATH%;%MTOA_MODULE_PATH%;%RENDERMAN_MODULE_PATH%;%YETI_MODULE_PATH%;%MAYA_MODULE_PATH%
set MAYA_PLUG_IN_PATH=%MY_ENVIRONMENT%\plugins\%MAYA_VERSION%
set MAYA_SCRIPT_PATH=%MY_ENVIRONMENT%\scripts;%MAYA_SCRIPT_PATH%
set PYTHONPATH=%MY_ENVIRONMENT%\scripts;%FXPT_PATH%;%SKINW_PATH%;%PYTHONBINDINGS%;%PYTHONPATH%
set XBMLANGPATH=%MY_ENVIRONMENT%\icons;%XBMLANGPATH%


::/***************************************************************************
:: LAUNCH MAYA
::***************************************************************************/

set MAYA_EXE=bin\maya.exe
set RENDER_EXE=bin\Render.exe

if %MAYA_BATCH_RENDER% == 0 (
	"%MAYA_LOCATION%\%MAYA_EXE%"
) 
if %MAYA_BATCH_RENDER% == 1 (
	"%MAYA_LOCATION%\%MAYA_EXE%" -batch -script "N:/tests/functionalTests/crowd5.0/export/26a-batchExport/cache/26a-batchExport.batch.mel" -log "C:/Users/chaverou/mayaBatch.txt"
)
if %MAYA_BATCH_RENDER% == 2 (
	:: http://download.autodesk.com/global/docs/maya2014/en_us/index.html?url=files/Command_line_renderer_Render_from_the_command_line.htm,topicNumber=d30e771764
	"%MAYA_LOCATION%\%RENDER_EXE%" -r file -s 14 -e 14 -b 1 -rd "N:/tests/nicolas/scenes/images" -proj %MAYA_PROJECT% -cam perspShape -im "batchRender" -fnc name.#.ext -log "C:/Users/chaverou/renderBatch.txt" "N:/tests/nicolas/scenes/prmanTest.ma"
) 

::pause
