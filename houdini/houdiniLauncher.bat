::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. & Mikros Image - All Rights Reserved.         *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: CROWD VARIABLES
::***************************************************************************/

set HOUDINI_VERSION=16.0.671
set GLMCROWD_MODE=Release
::set HOUDINI_DSO_PATH=C:\Users\chaverou\My Developments\golaemMantra\install


::/***************************************************************************
:: ENVIRONMENT
::***************************************************************************/

:: Houdini environment 
set HIP=N:/tests/nicolas

:: Globals
set PATH=%GLM_CROWD_BIN%;%PATH%;%SystemRoot%;%SystemRoot%\system;


::/***************************************************************************
:: Launch Houdini with the right configuration
::***************************************************************************/

set HOUDINI_LOCATION=C:\Program Files\Side Effects Software\Houdini %HOUDINI_VERSION%
set HOUDINI_EXE=bin\houdinifx.exe
"%HOUDINI_LOCATION%\%HOUDINI_EXE%"
