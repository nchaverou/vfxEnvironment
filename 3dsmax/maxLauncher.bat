::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: GOLAEM VARIABLES
::***************************************************************************/

set GLM_MODE=Official
set GLM_MAIN_VERSION=7
set GLM_OFFICIAL_VERSION=7.3.7-2020.12.01-#2244
set MAX_VERSION=2018
set GLMCROWD_UNIT=4


::/***************************************************************************
:: ENVIRONMENT
::***************************************************************************/

:: Golaem
set GLM_INSTALL_PREFIX=D:\Users\chaverou\Developments\GolaemForMax%GLM_MAIN_VERSION%\install%MAX_VERSION%\GolaemCrowd
IF %GLM_MODE% == Debug (
	set GLM_INSTALL_PREFIX=D:\Users\chaverou\Developments\GolaemForMax%GLM_MAIN_VERSION%\install%MAX_VERSION%\GolaemCrowdDBG
)
IF %GLM_MODE% == Official (
	set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-%GLM_OFFICIAL_VERSION%-Max%MAX_VERSION%
)
set GLM_CROWD_BIN=%GLM_INSTALL_PREFIX%\bin
set GLM_VRAY_PLUGINS_PATH=%GLM_INSTALL_PREFIX%\procedurals\vray

:: Globals
set PATH=%GLM_CROWD_BIN%;%PATH%;%SystemRoot%;%SystemRoot%\system;

:: VRay
set VRAY30_RT_FOR_3DSMAX2018_PLUGINS_x64=%GLM_VRAY_PLUGINS_PATH%;%VRAY30_RT_FOR_3DSMAX2018_PLUGINS_x64%;
set VRAY4_FOR_3DSMAX2018_PLUGINS=%GLM_VRAY_PLUGINS_PATH%;%VRAY4_FOR_3DSMAX2018_PLUGINS%;


::/***************************************************************************
:: Launch Max with the right configuration
::***************************************************************************/

set MAX_LOCATION=C:\Program Files\Autodesk\3ds Max %MAX_VERSION%\
set MAX_EXE=3dsmax.exe
"%MAX_LOCATION%\%MAX_EXE%"


:: Set Visual Studio
::PATH=C:\Users\chaverou\My Developments\Golaem Crowd v4\install2014\Debug\bin;%PATH%
::VRAY30_RT_FOR_3DSMAX2017_PLUGINS_x64=C:\Users\chaverou\My Developments\Golaem Crowd v4\install2014\Debug\procedurals;%VRAY30_RT_FOR_3DSMAX2017_PLUGINS_x64%
::C:\Program Files\Autodesk\3ds Max 2017\3dsmax.exe
