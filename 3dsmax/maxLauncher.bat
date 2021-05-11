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
::set GLM_OFFICIAL_VERSION=7.3.8
set GLM_OFFICIAL_VERSION=7.3.10-2021.04.21-#2329
set GLM_OFFICIAL_VERSION=8-2021.04.28-#2333
set MAX_VERSION=2020
::set GLMCROWD_UNIT=3


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
set GLM_VRAY_PLUGINS_PATH=%GLM_INSTALL_PREFIX%\procedurals\vray\50
::set GLM_RSHT_PLUGINS_PATH=C:\Program Files\Golaem\Golaem-7.3.8-Maya2020\procedurals\redshift
set GLM_RSHT_PLUGINS_PATH=C:\Users\chaverou\Developments\Golaem7\install2018\GolaemCrowd\procedurals\redshift

:: Globals
set PATH=%GLM_CROWD_BIN%;%PATH%;%SystemRoot%;%SystemRoot%\system;

:: VRay
set VRAY4_FOR_3DSMAX2018_PLUGINS=%GLM_VRAY_PLUGINS_PATH%;%VRAY4_FOR_3DSMAX2018_PLUGINS%;
set VRAY5_FOR_3DSMAX2018_PLUGINS=%GLM_VRAY_PLUGINS_PATH%;%VRAY5_FOR_3DSMAX2018_PLUGINS%;
set VRAY4_FOR_3DSMAX2020_PLUGINS=%GLM_VRAY_PLUGINS_PATH%;%VRAY4_FOR_3DSMAX2020_PLUGINS%;
set VRAY5_FOR_3DSMAX2020_PLUGINS=%GLM_VRAY_PLUGINS_PATH%;%VRAY5_FOR_3DSMAX2020_PLUGINS%;

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
