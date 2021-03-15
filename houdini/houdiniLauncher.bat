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
set GLM_OFFICIAL_VERSION=7.3.9-2021.03.08-#2300
set HOUDINI_VERSION=18.5.462
::set HOUDINI_VERSION=18.0.566
set GLMCROWD_ANL_ENABLE=1


::/***************************************************************************
:: HOUDINI PROJECT
::***************************************************************************/

set HIP=N:/tests/nicolas


::/***************************************************************************
:: LICENSE
::***************************************************************************/

set GLMCROWD_NO_PLE=1
::set GLMCROWD_NO_LICENSE=1
set golaem_LICENSE=C:\Licenses\golaemLayout.lic

::/***************************************************************************
:: LICENSE
::***************************************************************************/

set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\GolaemForHoudini%GLM_MAIN_VERSION%\install185\GolaemCrowd
IF %GLM_MODE% == Debug (
	set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\GolaemForHoudini%GLM_MAIN_VERSION%\install185\GolaemCrowdDBG
)
IF %GLM_MODE% == Official (
	set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-%GLM_OFFICIAL_VERSION%-Houdini18.5-windows
)


::/***************************************************************************
:: ENVIRONMENT
::***************************************************************************/

:: USD
set PXR_PLUGINPATH_NAME=%GLM_INSTALL_PREFIX%\procedurals\usd;^&

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
