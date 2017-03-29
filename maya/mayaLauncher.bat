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
set MAYA_BATCH_RENDER=0

::/***************************************************************************
:: LICENSE
::***************************************************************************/

::set GLMCROWD_NO_LICENSE=1
::set GLMCROWD_LAYOUT_LICENSE=1
set golaem_LICENSE=C:\golaem.lic
::set golaem_LICENSE=2375@gitem
::set solidangle_LICENSE=C:\arnold.lic
set solidangle_LICENSE=5053@gitem
::set PIXAR_LICENSE_FILE=9010@GITEM
set peregrinel_LICENSE=3033@gitem
::set redshift_LICENSE=5052@gitem


::/***************************************************************************
:: MAYA PROJECT
::***************************************************************************/

:: Fonctional
set MAYA_PROJECT=N:\tests\functionalTests\crowd%GLMCROWD_VERSION%\
::set MAYA_PROJECT=N:\demos\scenesDemos\crowd%GLMCROWD_VERSION%

:: Customers
::set MAYA_PROJECT=N:\tests\customers\blackbird
set MAYA_PROJECT=N:\tests\customers\mackevision\20170329_arrows

:: Divers
::set MAYA_PROJECT=N:\tests\nicolas
::set MAYA_PROJECT=N:\bugs


::/***************************************************************************
:: CROWD VARIABLES
::***************************************************************************/

:: Golaem Crowd 4
IF %GLMCROWD_VERSION% == 4.0 IF %GLMCROWD_DEV% == 1 (
	set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\Golaem Crowd v4\install%MAYA_VERSION%\%GLMCROWD_MODE%
)
IF %GLMCROWD_VERSION% == 4.0 IF %GLMCROWD_DEV% == 0 (
	set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\GolaemCrowd-4.3.3-Maya%MAYA_VERSION%
)

:: Golaem Crowd 5
IF %GLMCROWD_VERSION% == 5.0 IF %GLMCROWD_DEV% == 1 IF %GLMCROWD_MODE% == Release (
	set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\Golaem 5\install%MAYA_VERSION%\GolaemCrowd
)
IF %GLMCROWD_VERSION% == 5.0 IF %GLMCROWD_DEV% == 1 IF %GLMCROWD_MODE% == Debug (
	set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\Golaem 5\install%MAYA_VERSION%\GolaemCrowdDBG
)
IF %GLMCROWD_VERSION% == 5.0 IF %GLMCROWD_DEV% == 0 (
	set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-5.3.4.1-Maya%MAYA_VERSION%
)

::GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-6-2017.02.28-e00b5a5967-Maya2016%MAYA_VERSION%
:: set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-6-2017.01.27-db93af0-Maya%MAYA_VERSION%
::GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-5.4-2017.01.06-889baf8-Maya%MAYA_VERSION%
set GLMCROWD_ANL_ENABLE=0
set GLMCROWD_UNIT=3


echo "*********************************************************\n"
echo %GLM_INSTALL_PREFIX%
echo "*********************************************************\n"

set GLM_CROWD_MODULE_PATH=%GLM_INSTALL_PREFIX%


::/***************************************************************************
:: PLUGINS / SCRIPTS
::***************************************************************************/

:: My Environment
set MY_ENVIRONMENT=C:\Users\chaverou\Developments\vfxEnvironment\maya

:: MTOA_VERSION
set MTOA_MODULE_PATH=C:\solidangle\mtoadeploy\%MAYA_VERSION%

:: Tools
set FXPT_PATH=C:\Users\chaverou\Developments\fxpt
set SKINW_PATH=C:\Users\chaverou\Developments\skinWrangler

:: Yeti
::set YETI_MODULE_PATH=%MY_ENVIRONMENT%\plugins\Yeti-v2.0.19_Maya%MAYA_VERSION%-windows64


::/***************************************************************************
:: ENVIRONMENT
::***************************************************************************/

:: Copy and rename the source shelf file
copy "%MY_ENVIRONMENT%\shelves\shelf_Nicolas.original" "%MY_ENVIRONMENT%\shelves\shelf_Nicolas.mel"

:: Copy maya config file
copy "%MY_ENVIRONMENT%\prefs\MayaInterfaceScalingConfig" "%USERPROFILE%\Documents\maya\%MAYA_VERSION%\prefs\MayaInterfaceScalingConfig"

:: Maya
::set PATH=%SystemRoot%;%SystemRoot%\system;%PATH%
set MAYA_MODULE_PATH=%GLM_CROWD_MODULE_PATH%;%MTOA_MODULE_PATH%;%MAYA_MODULE_PATH%
set MAYA_PLUG_IN_PATH=%MY_ENVIRONMENT%\plugins\%MAYA_VERSION%
set MAYA_SCRIPT_PATH=%MY_ENVIRONMENT%\scripts
set PYTHONPATH=%MY_ENVIRONMENT%\scripts;%FXPT_PATH%;%SKINW_PATH%;%PYTHONPATH%
set MAYA_SHELF_PATH=%MY_ENVIRONMENT%\shelves
set XBMLANGPATH=%MY_ENVIRONMENT%\icons;
::set MAYA_RENDER_DESC_PATH=C:\solidangle\mtoadeploy\%MAYA_VERSION%\arnoldRenderer.xml


::/***************************************************************************
:: LAUNCH MAYA
::***************************************************************************/

set MAYA_LOCATION=C:\Program Files\Autodesk\Maya%MAYA_VERSION%
set MAYA_EXE=bin\maya.exe
set RENDER_EXE=bin\Render.exe

if %MAYA_BATCH_RENDER% == 0 (
	"%MAYA_LOCATION%\%MAYA_EXE%"
) 
if %MAYA_BATCH_RENDER% == 1 (
	"%MAYA_LOCATION%\%MAYA_EXE%" -batch -script "N:/tests/nicolas/export/testPLELicenseTODELETE/cache/testPLELicenseTODELETE.batch.mel" -log "C:/Users/chaverou/mayaBatch.txt"
)
if %MAYA_BATCH_RENDER% == 2 (
	:: http://download.autodesk.com/global/docs/maya2014/en_us/index.html?url=files/Command_line_renderer_Render_from_the_command_line.htm,topicNumber=d30e771764
	"%MAYA_LOCATION%\%RENDER_EXE%" -r file -s 14 -e 14 -b 1 -rd "N:/tests/nicolas/scenes/images" -proj %MAYA_PROJECT% -cam perspShape -im "batchRender" -fnc name.#.ext -log "C:/Users/chaverou/renderBatch.txt" "N:/tests/nicolas/scenes/prmanTest.ma"
) 

::pause

