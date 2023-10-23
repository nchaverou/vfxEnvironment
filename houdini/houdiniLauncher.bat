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
::set GLM_OFFICIAL_VERSION=8.2.1
set GLM_OFFICIAL_VERSION=8.2.5-2023.09.25-#2846
set HOUDINI_VERSION=19.5.435
set HOUDINI_BVERSION=19
set HOUDINI_IVERSION=19.5
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
::set golaem_LICENSE=.lic
set solidangle_LICENSE=C:\Licenses\arnold.lic

::/***************************************************************************
:: LICENSE
::***************************************************************************/

set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\GolaemForHoudini%GLM_MAIN_VERSION%\install%HOUDINI_BVERSION%\GolaemCrowd
IF %GLM_MODE% == Debug (
	set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\GolaemForHoudini%GLM_MAIN_VERSION%\install%HOUDINI_BVERSION%\GolaemCrowdDBG
)
IF %GLM_MODE% == Official (
	set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-%GLM_OFFICIAL_VERSION%-Houdini%HOUDINI_IVERSION%-Python37-windows
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

:: Arnold
set PATH=C:\Program Files\Golaem\Golaem-%GLM_OFFICIAL_VERSION%-Maya2020\bin;%PATH%
::set ARNOLD_PLUGIN_PATH=C:\Program Files\Golaem\Golaem-8.2.2-2023.02.03-PR2715-Maya2020\procedurals\arnold\71;%ARNOLD_PLUGIN_PATH%
::set ARNOLD_PLUGIN_PATH=C:\Program Files\Golaem\Golaem-8.2.2-2023.02.03-PR2715-Maya2020\shaders\arnold\71;%ARNOLD_PLUGIN_PATH%

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
