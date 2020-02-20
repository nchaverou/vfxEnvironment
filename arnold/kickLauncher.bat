::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: GLOBAL VARS
::***************************************************************************/

::set ASS_FILE=N:\tests\customers\unionVfx\20200127_crashRender\data\crowd\ttd_02_249_0010_test_v001_cache_glm.1534.ass
set ASS_FILE=C:\Users\chaverou\Downloads\goleam_files\ttd_02_249_0010_test_v001.1531.ass

::/***************************************************************************
:: GOLAEM
::***************************************************************************/

set MAYA_VERSION=2018
set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-7.2-Maya2018
::set GLM_INSTALL_PREFIX=D:\Users\chaverou\Developments\Golaem7\install2018\GolaemCrowd

::/***************************************************************************
:: MAYA 
::***************************************************************************/

set MAYA_LOCATION=C:\Program Files\Autodesk\Maya%MAYA_VERSION%
set XGEN_LOCATION=%MAYA_LOCATION%\plug-ins\xgen

::/***************************************************************************
:: LICENSE
::***************************************************************************/

set solidangle_LICENSE=C:\arnold.lic
set GLMCROWD_ANL_ENABLE=DISABLETHIS

::/***************************************************************************
:: ARNOLD
::***************************************************************************/

set ARNOLD_LOCATION=C:\solidangle\mtoadeploy\%MAYA_VERSION%
set PATH=%GLM_INSTALL_PREFIX%\bin;%ARNOLD_LOCATION%\bin\;%MAYA_LOCATION%\bin;%XGEN_LOCATION%\bin;%PATH%
set ARNOLD_PROCEDURAL_PATH=%ARNOLD_LOCATION%\procedurals;%GLM_INSTALL_PREFIX%\procedurals;%ARNOLD_PROCEDURAL_PATH%
set ARNOLD_PLUGIN_PATH=%GLM_INSTALL_PREFIX%\shaders;%ARNOLD_LOCATION%\procedurals;%ARNOLD_PLUGIN_PATH%

::/***************************************************************************
:: LAUNCH KICK
::***************************************************************************/

set KICK_EXE=bin\kick.exe
"%ARNOLD_LOCATION%\%KICK_EXE%" -i "%ASS_FILE%"

pause