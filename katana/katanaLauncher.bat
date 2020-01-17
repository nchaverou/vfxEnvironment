::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: KATANA VARS
::***************************************************************************/

set GLM_MODE=Official
set GLM_MAIN_VERSION=7
set GLM_OFFICIAL_VERSION=7.2.1-2020.01.13-PR1994

set KATANA_VERSION=3.1v2
set RMAN_VERSION=23.0
set DEFAULT_RENDERER=Redshift
set foundry_LICENSE=D:\foundry.lic


::/***************************************************************************
:: LICENSE
::***************************************************************************/

::set GLMCROWD_NO_PLE=1
::set GLMCROWD_NO_LICENSE=1
set golaem_LICENSE=D:\golaemLayout.lic


::/***************************************************************************
:: GOLAEM
::***************************************************************************/

set GLM_INSTALL_PREFIX=D:\Users\chaverou\Developments\Golaem%GLM_MAIN_VERSION%\install2018\GolaemCrowd
IF %GLM_MODE% == Debug (
	set GLM_INSTALL_PREFIX=D:\Users\chaverou\Developments\Golaem%GLM_MAIN_VERSION%\install2018\GolaemCrowdDBG
)
IF %GLM_MODE% == Official (
	set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-%GLM_OFFICIAL_VERSION%-Maya2018
)

set KTOG_PATH=%GLM_INSTALL_PREFIX%\procedurals\katana
::set KTOG_PATH=D:\Users\chaverou\Developments\GolaemForKatana7\install3\GolaemKatana
set GLM_PROCEDURAL_PATH=%GLM_INSTALL_PREFIX%\procedurals
set GLM_SHADER_PATH=%GLM_INSTALL_PREFIX%\shaders
set GLM_CROWD_BIN=%GLM_INSTALL_PREFIX%\bin


::/***************************************************************************
:: RENDERMAN
::***************************************************************************/

set RMANTREE=C:\Program Files\Pixar\RenderManProServer-%RMAN_VERSION%
set KTOR_PATH=C:\Program Files\Pixar\RenderManForKatana-%RMAN_VERSION%-katana3.1\plugins\Resources\PRMan23
::set RFK_REDIRECT_OUTPUT="C:/katanaLog.txt"
set RMAN_DSOPATH=%GLM_PROCEDURAL_PATH%
set RMAN_RIXPLUGINPATH=%GLM_SHADER_PATH%;%RMANTREE%\lib\plugins


::/***************************************************************************
:: ARNOLD
::***************************************************************************/

::set KTOA_PATH=C:\solidangle\ktoadeploy\KtoA-2.0.4.0-kat2.5-windows
set KTOA_PATH=C:\solidangle\ktoadeploy\KtoA-2.3.1.1-kat3.1-windows
set ARNOLD_PLUGIN_PATH=%GLM_PROCEDURAL_PATH%;%GLM_SHADER_PATH%

::/***************************************************************************
:: REDSHIFT
::***************************************************************************/

set KTORS_PATH=C:\ProgramData\Redshift\Plugins\Katana\3.0v1
set REDSHIFT_BIN=C:\ProgramData\Redshift\bin
set REDSHIFT_PROCEDURALSPATH=%GLM_PROCEDURAL_PATH%;%GLM_SHADER_PATH%;%REDSHIFT_PROCEDURALSPATH%


::/***************************************************************************
:: ENVIRONMENT
::***************************************************************************/

:: My Environment
set MY_ENVIRONMENT=D:\Users\chaverou\Developments\VFXEnvironment
set KATANA_TOOLS=%MY_ENVIRONMENT%\katana\tools
set GLMCROWD_ANL_ENABLE=1

::/***************************************************************************
:: LAUNCH KATANA
::***************************************************************************/

set "KATANA_TAGLINE=With Katana %KATANA_VERSION% and Arnold 5.0.1.4 and Renderman %RMAN_VERSION%"
set KATANA_POST_PYTHONPATH=%KTOG_PATH%/Python;
set KATANA_RESOURCES=%KTOA_PATH%;%KTOR_PATH%;%KTORS_PATH%;%KTOG_PATH%;%KATANA_TOOLS%
set PATH=%KTOA_PATH%\bin;%REDSHIFT_BIN%;%GLM_CROWD_BIN%;%PATH%

set KATANA_LOCATION=C:\Program Files\Foundry\Katana%KATANA_VERSION%
set KATANA_EXE=bin\katanaBin.exe
"%KATANA_LOCATION%\%KATANA_EXE%"

::C:\Users\chaverou\Software\System\DependencyWalker64\depends.exe

::pause