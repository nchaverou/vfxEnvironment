::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: GLOBAL VARS
::***************************************************************************/

set GLMCROWD_VERSION=5.0
set GLMCROWD_MODE=Debug
set GLMCROWD_DEV=1
set MAYA_VERSION=2016
set MAYA_BATCH=0


::/***************************************************************************
:: LICENSE
::***************************************************************************/

::set GLMCROWD_NO_LICENSE=1
::set GLMCROWD_LAYOUT_LICENSE=1
set golaem_LICENSE=C:\golaem.lic
::set golaem_LICENSE=2375@golaemdemo1
set solidangle_LICENSE=C:\arnold.lic
::set PIXAR_LICENSE_FILE=9010@GITEM
set peregrinel_LICENSE=3033@gitem
::set redshift_LICENSE=5052@gitem


::/***************************************************************************
:: MAYA PROJECT
::***************************************************************************/

:: Fonctional
set MAYA_PROJECT=N:\tests\functionalTests\crowd%GLMCROWD_VERSION%\
set MAYA_PROJECT=N:\demos\scenesDemos\crowd%GLMCROWD_VERSION%

:: Customers
set MAYA_PROJECT=N:\tests\customers\riotGames\083016_charController
::set MAYA_PROJECT=N:\tests\customers\hydraulx\layout

:: Divers
::set MAYA_PROJECT=N:\tests\nicolas
::set MAYA_PROJECT=C:\rebusScene
::set MAYA_PROJECT=N:\demos\wings
::set MAYA_PROJECT=N:\demos\zScan

::/***************************************************************************
:: CROWD VARIABLES
::***************************************************************************/

:: Golaem Crowd 4
IF %GLMCROWD_VERSION% == 4.0 IF %GLMCROWD_DEV% == 1 (
	set GLM_INSTALL_PREFIX=C:\Users\chaverou\My Developments\Golaem Crowd v4\install%MAYA_VERSION%\%GLMCROWD_MODE%
)
IF %GLMCROWD_VERSION% == 4.0 IF %GLMCROWD_DEV% == 0 (
	set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\GolaemCrowd-4.3.3-Maya%MAYA_VERSION%
)

:: Golaem Crowd 5
IF %GLMCROWD_VERSION% == 5.0 IF %GLMCROWD_DEV% == 1 IF %GLMCROWD_MODE% == Release (
	set GLM_INSTALL_PREFIX=C:\Users\chaverou\My Developments\Golaem v5\install%MAYA_VERSION%\GolaemCrowd
)
IF %GLMCROWD_VERSION% == 5.0 IF %GLMCROWD_DEV% == 1 IF %GLMCROWD_MODE% == Debug (
	set GLM_INSTALL_PREFIX=C:\Users\chaverou\My Developments\Golaem v5\install%MAYA_VERSION%\GolaemCrowdDBG
)
IF %GLMCROWD_VERSION% == 5.0 IF %GLMCROWD_DEV% == 0 (
	set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-5.2.2-Maya%MAYA_VERSION%
)
::set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-5.2-2016.06.22-PR446-Maya%MAYA_VERSION%

set GLMCROWD_ANL_ENABLE=0


echo "*********************************************************\n"
echo %GLM_INSTALL_PREFIX%
echo "*********************************************************\n"

set GLM_CROWD_MODULE_PATH=%GLM_INSTALL_PREFIX%
set GLM_CROWD_BIN=%GLM_INSTALL_PREFIX%\bin
set GLM_CROWD_PROCEDURALS_PATH=%GLM_INSTALL_PREFIX%\procedurals
set GLM_CROWD_SHADERS_PATH=%GLM_INSTALL_PREFIX%\shaders


::/***************************************************************************
:: PLUGINS
::***************************************************************************/

:: My Environment
set MY_ENVIRONMENT=C:\Users\chaverou\My Environment\Maya

:: Arnold
set ARNOLD_PLUGIN_PATH=C:\solidangle\mtoadeploy\%MAYA_VERSION%\shaders
set ARNOLD_MODULE_PATH=C:\solidangle\mtoadeploy\%MAYA_VERSION%
set ARNOLD_RENDER_DESC_PATH=C:\solidangle\mtoadeploy\%MAYA_VERSION%
set ARNOLD_BIN=C:\solidangle\mtoadeploy\%MAYA_VERSION%\bin

:: Delight
::set DELIGHT_MODULE_PATH=C:\Program Files\3Delight\maya\mod
set DELIGHT_BIN=C:\Program Files\3Delight\bin

:: Charcoal
set CHARCOAL_PLUGIN_PATH=%MY_ENVIRONMENT%\plugins\charcoal_editor_win_64bit_v1_52\maya_%MAYA_VERSION%

:: Redshift
set REDSHIFT_COMMON_ROOT=C:\ProgramData\Redshift\Plugins\Maya\Common
set REDSHIFT_PLUG_IN_PATH=C:\ProgramData\Redshift\Plugins\Maya\%MAYA_VERSION%\nt-x86-64
set REDSHIFT_SCRIPT_PATH=%REDSHIFT_COMMON_ROOT%\scripts
set REDSHIFT_XBMLANGPATH=%REDSHIFT_COMMON_ROOT%\icons
set REDSHIFT_RENDER_DESC_PATH=%REDSHIFT_COMMON_ROOT%\rendererDesc

:: Yeti
set YETI_MODULE_PATH=%MY_ENVIRONMENT%\plugins\Yeti-v2.0.19_Maya%MAYA_VERSION%-windows64


::/***************************************************************************
:: Script
::***************************************************************************/

set FXPT_PYTHON=C:\Users\chaverou\My Developments\fxpt


::/***************************************************************************
:: ENVIRONMENT
::***************************************************************************/

:: Copy and rename the source shelf file
copy "%MY_ENVIRONMENT%\shelves\shelf_Nicolas.original" "%MY_ENVIRONMENT%\shelves\shelf_Nicolas.mel"

:: Maya
set PATH=%GLM_CROWD_BIN%;%ARNOLD_BIN%;%DELIGHT_BIN%;%REDSHIFT_PLUG_IN_PATH%;%SystemRoot%;%SystemRoot%\system;%PATH%;
set MAYA_MODULE_PATH=%GLM_CROWD_MODULE_PATH%;%RENDERMANSTUDIO_MODULE_PATH%;%ARNOLD_MODULE_PATH%;%MAYA_MODULE_PATH%;%DELIGHT_MODULE_PATH%;%YETI_MODULE_PATH%
set MAYA_PLUG_IN_PATH=%MY_ENVIRONMENT%\plugins;%CHARCOAL_PLUGIN_PATH%;%REDSHIFT_PLUG_IN_PATH%
set MAYA_SCRIPT_PATH=%MY_ENVIRONMENT%\scripts;%REDSHIFT_SCRIPT_PATH%
set PYTHONPATH=%MY_ENVIRONMENT%\scripts;%FXPT_PYTHON%;%REDSHIFT_SCRIPT_PATH%;%PYTHONPATH%
set MAYA_SHELF_PATH=%MY_ENVIRONMENT%\shelves
set XBMLANGPATH=%MY_ENVIRONMENT%\icons;%REDSHIFT_XBMLANGPATH% 
set MAYA_RENDER_DESC_PATH=%ARNOLD_RENDER_DESC_PATH%;%DELIGHT_RENDER_DESC_PATH%;%REDSHIFT_RENDER_DESC_PATH%;%MAYA_RENDER_DESC_PATH%

:: Yeti
set MTOA_EXTENSIONS_PATH=%YETI_MODULE_PATH%\plug-ins;%MTOA_EXTENSIONS_PATH%


::/***************************************************************************
:: LAUNCH MAYA
::***************************************************************************/

set MAYA_LOCATION=C:\Program Files\Autodesk\Maya%MAYA_VERSION%
set MAYA_EXE=bin\maya.exe

if %MAYA_BATCH% == 0 (
	"%MAYA_LOCATION%\%MAYA_EXE%"
) ELSE (
	::set GLMCROWD_BATCH_ENABLE=1
	"%MAYA_LOCATION%\%MAYA_EXE%" -batch -script "N:/tests/nicolas/export/untitled/cache/untitled.batch.mel" -log "C:/mayabatch.txt"
)

