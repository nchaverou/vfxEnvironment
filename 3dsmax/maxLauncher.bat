::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: GOLAEM VARIABLES
::***************************************************************************/

set GLM_MODE=Release
set GLM_MAIN_VERSION=8
::set GLM_OFFICIAL_VERSION=7.3.8
::set GLM_OFFICIAL_VERSION=7.3.12-2021.08.17-#2422
set GLM_OFFICIAL_VERSION=9-2023.10.25-#2869
set GLM_OFFICIAL_VERSION=8.2.6-2023.12.12-#2921
set MAX_VERSION=2024
::set GLMCROWD_UNIT=1


::/***************************************************************************
:: ENVIRONMENT
::***************************************************************************/

:: Golaem
set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\GolaemForMax%GLM_MAIN_VERSION%\install%MAX_VERSION%\GolaemCrowd
IF %GLM_MODE% == Debug (
	set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\GolaemForMax%GLM_MAIN_VERSION%\install%MAX_VERSION%\GolaemCrowdDBG
)
IF %GLM_MODE% == Official (
	set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-%GLM_OFFICIAL_VERSION%-Max%MAX_VERSION%
)
set GLM_CROWD_BIN=%GLM_INSTALL_PREFIX%\bin
set GLM_VRAY_PLUGINS_PATH=%GLM_INSTALL_PREFIX%\procedurals\vray\60
::set GLM_RSHT_PLUGINS_PATH=C:\Program Files\Golaem\Golaem-7.3.8-Maya2020\procedurals\redshift
set GLM_RSHT_PLUGINS_PATH=C:\Users\chaverou\Developments\Golaem7\install2018\GolaemCrowd\procedurals\redshift

:: Globals
set PATH=%GLM_CROWD_BIN%;%PATH%;%SystemRoot%;%SystemRoot%\system;

:: VRay
set VRAY_FOR_3DSMAX2020_PLUGINS=%GLM_VRAY_PLUGINS_PATH%;%VRAY_FOR_3DSMAX2020_PLUGINS%;
set VRAY_FOR_3DSMAX2023_PLUGINS=%GLM_VRAY_PLUGINS_PATH%;%VRAY_FOR_3DSMAX2023_PLUGINS%;
set VRAY_FOR_3DSMAX2024_PLUGINS=%GLM_VRAY_PLUGINS_PATH%;%VRAY_FOR_3DSMAX2024_PLUGINS%;

:: Redshift
set REDSHIFT_PROCEDURALSPATH=%GLM_RSHT_PLUGINS_PATH%;%REDSHIFT_PROCEDURALSPATH%


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
