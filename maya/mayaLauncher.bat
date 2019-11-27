::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: GLOBAL VARS
::***************************************************************************/

set GLM_MODE=Official
set GLM_MAIN_VERSION=7
set GLM_OFFICIAL_VERSION=7.2
set MAYA_VERSION=2018
set RMAN_VERSION=22.5


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


::/***************************************************************************
:: MAYA PROJECT
::***************************************************************************/

:: Customers
::set MAYA_PROJECT=N:\tests\customers\Dwarf\20191029_renderIssue
set MAYA_PROJECT=N:\tests\nicolas
::set MAYA_PROJECT=N:\demos\studiosDemos
::set MAYA_PROJECT=N:\assets\GolaemCharacterPack-7.0.3
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
set RMSTREE=C:\Program Files\Pixar\RenderManForMaya-%RMAN_VERSION%-maya%MAYA_VERSION%\
set RENDERMAN_MODULE_PATH=%RMSTREE%\etc
IF %RMAN_VERSION% == 22.4 (
	set RFMTREE=C:\Program Files\Pixar\RenderManForMaya-%RMAN_VERSION%\
	set RENDERMAN_MODULE_PATH=C:\Program Files\Pixar\RenderManForMaya-%RMAN_VERSION%
)

:: RLM
set RLM_DIAGNOSTICS=D:\Temp\RLMDiag.txt

:: USD
set USD_MODULE_PATH=D:\Users\chaverou\Developments\USD\usd_maya2018

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
set MAYA_MODULE_PATH=%GLM_MODULE_PATH%;%MTOA_MODULE_PATH%;%RENDERMAN_MODULE_PATH%;%USD_MODULE_PATH%;%MAYA_MODULE_PATH%
set MAYA_PLUG_IN_PATH=%MY_ENVIRONMENT%\plugins\%MAYA_VERSION%
set MAYA_SCRIPT_PATH=%MY_ENVIRONMENT%\scripts;%MAYA_SCRIPT_PATH%
set PYTHONPATH=%MY_ENVIRONMENT%\scripts;%FXPT_PATH%;%SKINW_PATH%;%PYTHONPATH%
set XBMLANGPATH=%MY_ENVIRONMENT%\icons;%XBMLANGPATH%


::/***************************************************************************
:: LAUNCH MAYA
::***************************************************************************/

set MAYA_EXE=bin\maya.exe
set RENDER_EXE=bin\Render.exe

:: Regular
"%MAYA_LOCATION%\%MAYA_EXE%"
:: Batch
::"%MAYA_LOCATION%\%MAYA_EXE%" -batch -script "N:/tests/functionalTests/crowd5.0/export/26a-batchExport/cache/26a-batchExport.batch.mel" -log "D:/Users/chaverou/mayaBatch.txt"
:: Batch Render
:: http://download.autodesk.com/global/docs/maya2014/en_us/index.html?url=files/Command_line_renderer_Render_from_the_command_line.htm,topicNumber=d30e771764
::"%MAYA_LOCATION%\%RENDER_EXE%" -r file -s 10 -e 14 -b 1 -rd "N:/tests/nicolas/scenes/images" -proj %MAYA_PROJECT% -cam perspShape -im "batchRender" -fnc name.#.ext -log "D:/Users/chaverou/renderBatch.txt" "N:/tests/functionalTests/crowd5.0/scenes/26a-batchExport-nc.ma" 

::pause
