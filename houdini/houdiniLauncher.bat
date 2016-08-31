::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. & Mikros Image - All Rights Reserved.         *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: CROWD VARIABLES
::***************************************************************************/

set HOUDINI_VERSION=15.5.480
set GLMCROWD_MODE=Release
::set HOUDINI_DSO_PATH=C:\Users\chaverou\My Developments\golaemMantra\install

set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-5.1.1.1-Maya%MAYA_VERSION%
set GLM_CROWD_BIN=%GLM_INSTALL_PREFIX%\bin
set GLM_VRAY_PLUGINS_PATH=%GLM_INSTALL_PREFIX%\procedurals


::/***************************************************************************
:: ENVIRONMENT
::***************************************************************************/

:: Globals
set PATH=%GLM_CROWD_BIN%;%PATH%;%SystemRoot%;%SystemRoot%\system;


::/***************************************************************************
:: Launch Max with the right configuration
::***************************************************************************/

set HOUDINI_LOCATION=C:\Program Files\Side Effects Software\Houdini %HOUDINI_VERSION%
set HOUDINI_EXE=bin\houdinifx.exe
"%HOUDINI_LOCATION%\%HOUDINI_EXE%"
