::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: ENVIRONMENT
::***************************************************************************/

:: USD
set USD_DLL=C:\Omniverse\Library\collaboration\nucleus-workstation 2020.3.0\Nucleus\usd_release\lib
set PXR_PLUGINPATH_NAME=C:\Users\chaverou\Developments\GolaemForNvUSD7\install20\GolaemCrowd\procedurals\usd
set PATH=C:\Users\chaverou\Developments\GolaemForNvUSD7\install20\GolaemCrowd\bin;%USD_DLL%;%PATH%


::/***************************************************************************
:: LAUNCH KIT
::***************************************************************************/

set KIT_CONFIG=C:\Omniverse\Library\create 2021.1.0\_build\windows-x86_64\release\apps\omni.create.launcher.kit
set EXT_CONFIG=C:\Omniverse\Library\create 2021.1.0\_build\windows-x86_64\release\
set KIT_LOCATION=C:\Omniverse\Library\kit 100.1.0\_build\windows-x86_64
set KIT_EXE=release\kit.exe

:: Launch
::setlocal
"%KIT_LOCATION%\%KIT_EXE%" "%KIT_CONFIG%" --ext-folder "%EXT_CONFIG%\exts" --ext-folder "%EXT_CONFIG%\apps"

::C:\Users\chaverou\Software\System\DependencyWalkerx64\depends.exe
