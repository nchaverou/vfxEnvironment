::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: CROWD VARIABLES
::***************************************************************************/

set MAX_VERSION=2018
set MAYA_VERSION=2018
::set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\Golaem 5\install%MAYA_VERSION%\GolaemCrowd
::set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-6.4.3-2019.02.27-PR1699-Maya%MAYA_VERSION%
set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-7.2-Max2018
set GLM_CROWD_BIN=%GLM_INSTALL_PREFIX%\bin
set GLM_VRAY_PLUGINS_PATH=%GLM_INSTALL_PREFIX%\procedurals

set GLMCROWD_UNIT=4

::/***************************************************************************
:: ENVIRONMENT
::***************************************************************************/

:: Globals
set PATH=%GLM_CROWD_BIN%;%PATH%;%SystemRoot%;%SystemRoot%\system;

:: VRay
set VRAY30_RT_FOR_3DSMAX2016_PLUGINS_x64=%GLM_VRAY_PLUGINS_PATH%;%VRAY30_RT_FOR_3DSMAX2016_PLUGINS_x64%;
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
