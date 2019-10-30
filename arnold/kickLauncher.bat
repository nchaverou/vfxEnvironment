::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: GLOBAL VARS
::***************************************************************************/

set ASS_FILE=C:\Users\chaverou\Desktop\here.ass

::/***************************************************************************
:: GOLAEM
::***************************************************************************/

set MAYA_VERSION=2018
set GLM_INSTALL_PREFIX=D:\Users\chaverou\Developments\Golaem7\install2018\GolaemCrowdDBG

::/***************************************************************************
:: MAYA 
::***************************************************************************/

set MAYA_LOCATION=C:\Program Files\Autodesk\Maya%MAYA_VERSION%
set XGEN_LOCATION=%MAYA_LOCATION%\plug-ins\xgen

::/***************************************************************************
:: LICENSE
::***************************************************************************/

set solidangle_LICENSE=C:\arnold.lic

::/***************************************************************************
:: ARNOLD
::***************************************************************************/

set ARNOLD_LOCATION=C:\solidangle\mtoadeploy\%MAYA_VERSION%
set PATH=%GLM_INSTALL_PREFIX%\bin;%ARNOLD_LOCATION%\bin\;%MAYA_LOCATION%\bin;%XGEN_LOCATION%\bin;%PATH%
set ARNOLD_PROCEDURAL_PATH=%ARNOLD_LOCATION%\procedurals;%GLM_INSTALL_PREFIX%\procedurals;%ARNOLD_PROCEDURAL_PATH%
set ARNOLD_PLUGIN_PATH=%ARNOLD_LOCATION%\procedurals;%ARNOLD_PLUGIN_PATH%

::/***************************************************************************
:: LAUNCH KICK
::***************************************************************************/

set KICK_EXE=bin\kick.exe
"%ARNOLD_LOCATION%\%KICK_EXE%" -i "%ASS_FILE%"

pause