::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: ENVIRONMENT
::***************************************************************************/

set golaem_LICENSE=C:\Licenses\golaemLite.lic

:: USD
set GLM_INSTALL_PATH=C:\Program Files\Golaem\Golaem-8.1.4-EngineUSD0.20.08-omniverse-windows
set PXR_PLUGINPATH_NAME=%GLM_INSTALL_PATH%\procedurals\engineUsd
set PATH=%GLM_INSTALL_PATH%\bin;%PATH%


::/***************************************************************************
:: LAUNCH KIT
::***************************************************************************/

call C:\Omniverse\Library\create-2022.1.3\omni.create.bat

::C:\Users\chaverou\Software\System\DependencyWalkerx64\depends.exe
