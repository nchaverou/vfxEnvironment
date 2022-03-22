::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: GLOBAL VARS
::***************************************************************************/

set GLM_MODE=Official
set GLM_MAIN_VERSION=8
set GLM_OFFICIAL_VERSION=8.1.2-2022.03.16-261d4c310
::set GLM_OFFICIAL_VERSION=7.3.12-2021.08.17-#2422
set HOUDINI_VERSION=19.0.531
set HOUDINI_BVERSION=19
set HOUDINI_IVERSION=19.0
::set HOUDINI_VERSION=18.0.566
set GLMCROWD_ANL_ENABLE=1


::/***************************************************************************
:: HOUDINI PROJECT
::***************************************************************************/

set HIP=N:/tests/nicolas
set HOUDINI_LMINFO_VERBOSE=1


::/***************************************************************************
:: LICENSE
::***************************************************************************/

::set GLMCROWD_NO_PLE=1
::set GLMCROWD_NO_LICENSE=1
set golaem_LICENSE=C:\Licenses\golaemLite.lic

::/***************************************************************************
:: LICENSE
::***************************************************************************/

set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\GolaemForHoudini%GLM_MAIN_VERSION%\install%HOUDINI_BVERSION%\GolaemCrowd
IF %GLM_MODE% == Debug (
	set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\GolaemForHoudini%GLM_MAIN_VERSION%\install%HOUDINI_BVERSION%\GolaemCrowdDBG
)
IF %GLM_MODE% == Official (
	set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-%GLM_OFFICIAL_VERSION%-Houdini%HOUDINI_IVERSION%-windows
)

::set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\DancingCubes\install19\GolaemCrowd


::/***************************************************************************
:: ENVIRONMENT
::***************************************************************************/

:: USD
set PXR_PLUGINPATH_NAME=%GLM_INSTALL_PREFIX%\procedurals\usd;^&
::set TF_DEBUG=PLUG_*

:: Globals
set PATH=%GLM_INSTALL_PREFIX%\bin;%PATH%

:: Houdini Custom plugins
::set HOUDINI_DSO_ERROR=3
set HOUDINI_DSO_PATH=%GLM_INSTALL_PREFIX%\procedurals\houdini;^&
set PYTHONPATH=%GLM_INSTALL_PREFIX%\procedurals\houdini\python;^&
set HOUDINI_TOOLBAR_PATH=%GLM_INSTALL_PREFIX%\procedurals\houdini\shelf;^&
set HOUDINI_UI_ICON_PATH=%GLM_INSTALL_PREFIX%\procedurals\houdini\icons;^&


::/***************************************************************************
:: Launch Houdini with the right configuration
::***************************************************************************/

set HOUDINI_LOCATION=C:\Program Files\Side Effects Software\Houdini %HOUDINI_VERSION%
set HOUDINI_EXE=bin\houdinifx.exe
"%HOUDINI_LOCATION%\%HOUDINI_EXE%"

::pause
::C:\Users\chaverou\Software\System\DependencyWalkerx64\depends.exe
