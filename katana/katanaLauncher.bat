::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: KATANA VARS
::***************************************************************************/

set GLM_MODE=Release
set GLM_MAIN_VERSION=7
set GLM_OFFICIAL_VERSION=6.4.4

set KATANA_VERSION=3.1v2
set RMAN_VERSION=22.3
set DEFAULT_RENDERER=prman
set foundry_LICENSE=C:\foundry.lic

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
set GLM_PROCEDURAL_PATH=%GLM_INSTALL_PREFIX%\procedurals
set GLM_SHADER_PATH=%GLM_INSTALL_PREFIX%\shaders
set GLM_CROWD_BIN=%GLM_INSTALL_PREFIX%\bin


::/***************************************************************************
:: RENDERMAN
::***************************************************************************/

set RMANTREE=C:\Program Files\Pixar\RenderManProServer-%RMAN_VERSION%
set KTOR_PATH=C:\Program Files\Pixar\RenderManForKatana-%RMAN_VERSION%-katana3.0\plugins\Resources\PRMan22
::set RFK_REDIRECT_OUTPUT="C:/katanaLog.txt"
set RMAN_DSOPATH=%GLM_PROCEDURAL_PATH%
set RMAN_RIXPLUGINPATH=%GLM_SHADER_PATH%;%RMANTREE%\lib\plugins


::/***************************************************************************
:: ARNOLD
::***************************************************************************/

::set KTOA_PATH=C:\solidangle\ktoadeploy\KtoA-2.0.4.0-kat2.5-windows
set KTOA_PATH=C:\solidangle\ktoadeploy\KtoA-2.2.2.1-kat3.1-windows
set ARNOLD_PLUGIN_PATH=%GLM_PROCEDURAL_PATH%;%GLM_SHADER_PATH%


::/***************************************************************************
:: ENVIRONMENT
::***************************************************************************/

:: My Environment
set MY_ENVIRONMENT=D:\Users\chaverou\Developments\VFXEnvironment
set KATANA_TOOLS=%MY_ENVIRONMENT%\katana\tools


::/***************************************************************************
:: LAUNCH KATANA
::***************************************************************************/

set "KATANA_TAGLINE=With Katana %KATANA_VERSION% and Arnold 5.0.1.4 and Renderman %RMAN_VERSION%"
set KATANA_POST_PYTHONPATH=%KTOG_PATH%/Python
set KATANA_RESOURCES=%KTOA_PATH%;%KTOR_PATH%;%KTOG_PATH%;%KATANA_TOOLS%
set PATH=%KTOA_PATH%\bin;%GLM_CROWD_BIN%;%PATH%

set KATANA_LOCATION=C:\Program Files\Foundry\Katana%KATANA_VERSION%
set KATANA_EXE=bin\katanaBin.exe
"%KATANA_LOCATION%\%KATANA_EXE%"

::C:\Users\chaverou\Software\System\DependencyWalker64\depends.exe

::pause