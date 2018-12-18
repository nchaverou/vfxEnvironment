::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: KATANA VARS
::***************************************************************************/

set RMAN_VERSION=22.1
set GLM_VERSION=6.4.1-2018.12.11-PR1610
::set KATANA_VERSION=2.6v4
set KATANA_VERSION=3.0v4
set KATANA_TOOLS=C:\Users\chaverou\Developments\vfxEnvironment\katana\tools
set "KATANA_TAGLINE=With KtoA %KATANA_VERSION% and Arnold 5.0.1.4 and Renderman %RMAN_VERSION%"
set DEFAULT_RENDERER=prman
::set DEFAULT_RENDERER=arnold
set GLMKATANA_MODE=Release
set foundry_LICENSE=C:\foundry.lic

::/***************************************************************************
:: GOLAEM
::***************************************************************************/


IF %GLMKATANA_MODE% == Release (
	set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\Golaem 5\install2018\GolaemCrowd
)
IF %GLMKATANA_MODE% == Debug (
	set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\Golaem 5\install2018\GolaemCrowdDBG
)
IF %GLMKATANA_MODE% == Official (
	set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-%GLM_VERSION%-Maya2018
)

::set KTOG_PATH=%GLM_INSTALL_PREFIX%\procedurals\katana\
set KTOG_PATH=C:\Users\chaverou\Developments\Golaem For Katana\install\GolaemKatana\

set GLM_PROCEDURAL_PATH=%GLM_INSTALL_PREFIX%\procedurals
set GLM_SHADER_PATH=%GLM_INSTALL_PREFIX%\shaders
set GLM_CROWD_BIN=%GLM_INSTALL_PREFIX%\bin

::/***************************************************************************
:: RENDERMAN
::***************************************************************************/

set RMANTREE=C:\Program Files\Pixar\RenderManProServer-%RMAN_VERSION%
set KTOR_PATH=C:\Program Files\Pixar\RenderManForKatana-%RMAN_VERSION%-katana2.6\plugins\Resources\PRMan22
::set RFK_REDIRECT_OUTPUT="C:/katanaLog.txt"
set RMAN_DSOPATH=%GLM_PROCEDURAL_PATH%
set RMAN_RIXPLUGINPATH=%GLM_SHADER_PATH%;%RMANTREE%\lib\plugins
::C:\\Program Files\\Pixar\\RenderManProServer-21.6\\lib\\plugins


::/***************************************************************************
:: ARNOLD
::***************************************************************************/

::set KTOA_PATH=C:\solidangle\ktoadeploy\KtoA-1.1.3.1-kat2.5-windows
::set KTOA_PATH=C:\solidangle\ktoadeploy\KtoA-2.0.4.0-kat2.5-windows
set KTOA_PATH=C:\solidangle\ktoadeploy\KtoA-2.2.0.2-kat3.0-windows
set ARNOLD_PLUGIN_PATH=%GLM_PROCEDURAL_PATH%;%GLM_SHADER_PATH%


::/***************************************************************************
:: LAUNCH KATANA
::***************************************************************************/

set KATANA_POST_PYTHONPATH=%KTOG_PATH%/Python
set KATANA_RESOURCES=%KTOA_PATH%;%KTOR_PATH%;%KTOG_PATH%;%KATANA_TOOLS%
set PATH=%KTOA_PATH%\bin;%GLM_CROWD_BIN%;%PATH%

set KATANA_LOCATION=C:\Program Files\Katana%KATANA_VERSION%
set KATANA_EXE=bin\katanaBin.exe
"%KATANA_LOCATION%\%KATANA_EXE%"

::C:\Users\chaverou\Software\System\DependencyWalker64\depends.exe

::pause