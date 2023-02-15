::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. & Mikros Image - All Rights Reserved.         *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: GOLAEM VARIABLES
::***************************************************************************/

set MAYA_VERSION=2020
set GLM_MAIN_VERSION=8
set GLM_MODE=Official
set GLM_OFFICIAL_VERSION=8.1.2-2022.03.28-PR2556

set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\Golaem%GLM_MAIN_VERSION%\install%MAYA_VERSION%\GolaemCrowd
IF %GLM_MODE% == Debug (
	set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\Golaem%GLM_MAIN_VERSION%\install%MAYA_VERSION%\GolaemCrowdDBG
)
IF %GLM_MODE% == Official (
	set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-%GLM_OFFICIAL_VERSION%-Maya%MAYA_VERSION%
)

set GLM_CROWD_BIN=%GLM_INSTALL_PREFIX%\bin
set GLM_GUERILLA_PLUGIN_PATH=%GLM_INSTALL_PREFIX%\procedurals\guerilla


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
