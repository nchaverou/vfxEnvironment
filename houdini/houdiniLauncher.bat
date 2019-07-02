::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. & Mikros Image - All Rights Reserved.         *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: GLOBAL VARS
::***************************************************************************/

set GLM_MODE=Debug
set GLM_OFFICIAL_VERSION=6.4.2
set HOUDINI_VERSION=17.5.258


::/***************************************************************************
:: HOUDINI PROJECT
::***************************************************************************/

:: Houdini environment 
set HIP=N:/tests/nicolas

::/***************************************************************************
:: ENVIRONMENT
::***************************************************************************/

:: Golaem For Houdini
set GLM_FOR_HOUDINI=D:\Users\chaverou\Developments\GolaemForHoudini-Method\build17.5\Release

:: Golaem Official Package
set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-%GLM_OFFICIAL_VERSION%-Maya2018

:: Globals
set PATH=%GLM_INSTALL_PREFIX%\bin;%PATH%;%SystemRoot%;%SystemRoot%\system;

:: Houdini Custom plugins
::set HOUDINI_DSO_PATH=D:\Users\chaverou\Developments\GolaemForHoudini-Method\build17.5\Release


::/***************************************************************************
:: Launch Houdini with the right configuration
::***************************************************************************/

set HOUDINI_LOCATION=C:\Program Files\Side Effects Software\Houdini %HOUDINI_VERSION%
set HOUDINI_EXE=bin\houdinifx.exe
"%HOUDINI_LOCATION%\%HOUDINI_EXE%"
