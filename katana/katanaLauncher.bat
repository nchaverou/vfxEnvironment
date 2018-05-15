::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: KATANA VARS
::***************************************************************************/

set KATANA_TOOLS=C:\Users\chaverou\Developments\vfxEnvironment\katana\tools
set "KATANA_TAGLINE=With KtoA 2.0.4.0 and Arnold 5.0.1.4 and Renderman 21.4"
::set DEFAULT_RENDERER=prman
set DEFAULT_RENDERER=arnold
set GLMKATANA_MODE=Official
set foundry_LICENSE=C:\foundry.lic

::/***************************************************************************
:: GOLAEM
::***************************************************************************/

::set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\Golaem 5\install2016\GolaemCrowd
set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-6.3-2018.04.26-PR1373-Maya2018

IF %GLMKATANA_MODE% == Release (
	set KTOG_PATH=C:\Users\chaverou\Developments\Golaem For Katana\install\GolaemKatana\
)
IF %GLMKATANA_MODE% == Debug (
	set KTOG_PATH=C:\Users\chaverou\Developments\Golaem For Katana\install\GolaemKatanaDBG\
)
IF %GLMKATANA_MODE% == Official (
	set KTOG_PATH=%GLM_INSTALL_PREFIX%\procedurals\katana\
)

set GLM_PROCEDURAL_PATH=%GLM_INSTALL_PREFIX%\procedurals
set GLM_SHADER_PATH=%GLM_INSTALL_PREFIX%\shaders
set GLM_CROWD_BIN=%GLM_INSTALL_PREFIX%\bin

::/***************************************************************************
:: RENDERMAN
::***************************************************************************/

set RMANTREE=C:\Program Files\Pixar\RenderManProServer-21.6
set KTOR_PATH=C:\Program Files\Pixar\RenderManForKatana-21.6-katana2.5\plugins\Resources\PRMan21
::set RFK_REDIRECT_OUTPUT="C:/katanaLog.txt"
set RMAN_DSOPATH=%GLM_PROCEDURAL_PATH%
set RMAN_RIXPLUGINPATH=%GLM_SHADER_PATH%:%RMANTREE%\lib\plugins
::C:\\Program Files\\Pixar\\RenderManProServer-21.6\\lib\\plugins


::/***************************************************************************
:: ARNOLD
::***************************************************************************/

::set KTOA_PATH=C:\solidangle\ktoadeploy\KtoA-1.1.3.1-kat2.5-windows
set KTOA_PATH=C:\solidangle\ktoadeploy\KtoA-2.0.4.0-kat2.5-windows
set ARNOLD_PLUGIN_PATH=%GLM_PROCEDURAL_PATH%;%GLM_SHADER_PATH%


::/***************************************************************************
:: LAUNCH KATANA
::***************************************************************************/

set KATANA_POST_PYTHONPATH=%KTOG_PATH%/Python
set KATANA_RESOURCES=%KTOA_PATH%;%KTOR_PATH%;%KTOG_PATH%;%KATANA_TOOLS%
set PATH=%KTOA_PATH%\bin;%GLM_CROWD_BIN%;%PATH%

set KATANA_LOCATION=C:\Program Files\Katana2.6v4
set KATANA_EXE=bin\katanaBin.exe
"%KATANA_LOCATION%\%KATANA_EXE%"

::C:\Users\chaverou\Software\System\DependencyWalker64\depends.exe

::pause