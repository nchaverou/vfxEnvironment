::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. & Mikros Image - All Rights Reserved.         *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: CROWD VARIABLES
::***************************************************************************/

set MAYA_VERSION=2014
set GLMCROWD_MODE=Release
::set GLM_INSTALL_PREFIX=C:\Users\chaverou\My Developments\Golaem Crowd v4\install%MAYA_VERSION%\%GLMCROWD_MODE%
::set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\GolaemCrowd-4.3-Maya%MAYA_VERSION%
::set GLM_INSTALL_PREFIX=C:\Users\chaverou\My Developments\Golaem v5\install%MAYA_VERSION%\GolaemCrowd
set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-5.0.3-2016.02.26-PR166-Maya%MAYA_VERSION%
set GLM_CROWD_BIN=%GLM_INSTALL_PREFIX%\bin
set GLM_GUERILLA_PLUGIN_PATH=%GLM_INSTALL_PREFIX%\procedurals


::/***************************************************************************
:: ENVIRONMENT
::***************************************************************************/

:: Globals
set PATH=%GLM_CROWD_BIN%;%GLM_GUERILLA_PLUGIN_PATH%;%PATH%

::/***************************************************************************
:: Launch Max with the right configuration
::***************************************************************************/

set GUERILLA_LOCATION=C:\Program Files\Guerilla Render\
set GUERILLA_EXE=guerilla.exe
"%GUERILLA_LOCATION%\%GUERILLA_EXE%"
