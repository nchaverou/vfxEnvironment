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
set GLM_OFFICIAL_VERSION=7.3.6-2020.10.13-#2215
::set GLM_OFFICIAL_VERSION=7.3.1

set KATANA_VERSION=3.5v2
::set KATANA_VERSION=3.1v2
set RMAN_VERSION=23.3
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

set GLM_INSTALL_PREFIX=D:\Users\chaverou\Developments\GolaemForKatana%GLM_MAIN_VERSION%\install3\GolaemCrowd
IF %GLM_MODE% == Debug (
	set GLM_INSTALL_PREFIX=D:\Users\chaverou\Developments\GolaemForKatana%GLM_MAIN_VERSION%\install3\GolaemCrowdDBG
)
IF %GLM_MODE% == Official (
	set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-%GLM_OFFICIAL_VERSION%-Katana3.5-windows
	set GLMUSD_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-%GLM_OFFICIAL_VERSION%-Katana3.5USD-windows
)

set KTOG_PATH=%GLM_INSTALL_PREFIX%\procedurals\katana
::set KTOG_PATH=D:\Users\chaverou\Developments\GolaemForKatana7\install3\GolaemKatana
set GLM_PROCEDURAL_PATH=%GLM_INSTALL_PREFIX%\procedurals
set GLM_SHADER_PATH=%GLM_INSTALL_PREFIX%\shaders
set GLM_CROWD_BIN=%GLM_INSTALL_PREFIX%\bin


::/***************************************************************************
:: GOLAEM USD 
::***************************************************************************/

set GLMUSD_PLUGIN_PATH=%GLMUSD_INSTALL_PREFIX%\procedurals
set GLMUSD_BIN=%GLMUSD_INSTALL_PREFIX%\bin


::/***************************************************************************
:: RENDERMAN
::***************************************************************************/

set RMANTREE=C:\Program Files\Pixar\RenderManProServer-%RMAN_VERSION%
set KTOR_PATH=C:\Program Files\Pixar\RenderManForKatana-%RMAN_VERSION%-katana3.5\plugins\Resources\PRMan23
::set RFK_REDIRECT_OUTPUT="C:/katanaLog.txt"
set RMAN_DSOPATH=%GLM_PROCEDURAL_PATH%\renderman
set RMAN_RIXPLUGINPATH=%GLM_SHADER_PATH%;%RMANTREE%\lib\plugins


::/***************************************************************************
:: ARNOLD
::***************************************************************************/

::set KTOA_PATH=C:\solidangle\ktoadeploy\KtoA-2.0.4.0-kat2.5-windows
set KTOA_PATH=C:\solidangle\ktoadeploy\KtoA-2.3.1.1-kat3.1-windows
set ARNOLD_PLUGIN_PATH=%GLM_PROCEDURAL_PATH%\arnold;%GLM_SHADER_PATH%\arnold

::/***************************************************************************
:: REDSHIFT
::***************************************************************************/

set KTORS_PATH=C:\ProgramData\Redshift\Plugins\Katana\3.0v1
set REDSHIFT_BIN=C:\ProgramData\Redshift\bin
set REDSHIFT_PROCEDURALSPATH=%GLM_PROCEDURAL_PATH%\redshift;%GLM_SHADER_PATH%\redshift;%REDSHIFT_PROCEDURALSPATH%

::/***************************************************************************
:: USD
::***************************************************************************/

set FNPXR_PLUGINPATH=C:\Program Files\Golaem\Golaem-%GLM_OFFICIAL_VERSION%-Katana3.5USD-windows\procedurals\usd


::/***************************************************************************
:: ENVIRONMENT
::***************************************************************************/

:: My Environment
set MY_ENVIRONMENT=D:\Users\chaverou\Developments\VFXEnvironment
set KATANA_TOOLS=%MY_ENVIRONMENT%\katana\tools
::set GLMCROWD_ANL_ENABLE=1

::/***************************************************************************
:: LAUNCH KATANA
::***************************************************************************/

set KATANA_LOCATION=C:\Program Files\Foundry\Katana%KATANA_VERSION%
set "KATANA_TAGLINE=With Katana %KATANA_VERSION% and Arnold 5.0.1.4 and Renderman %RMAN_VERSION%"
set KATANA_POST_PYTHONPATH=%KTOG_PATH%/Python;
set KATANA_RESOURCES=%KTOA_PATH%;%KTOR_PATH%;%KTORS_PATH%;%KTOG_PATH%;%GLMUSD_PLUGIN_PATH%;%KATANA_TOOLS%;%KATANA_LOCATION%/plugins/Resources/Usd/plugin
set PATH=%KTOA_PATH%\bin;%REDSHIFT_BIN%;%GLM_CROWD_BIN%;%GLMUSD_BIN%;%KATANA_LOCATION%/plugins/Resources/Usd/lib;%PATH%

set KATANA_EXE=bin\katanaBin.exe
"%KATANA_LOCATION%\%KATANA_EXE%"

::C:\Users\chaverou\Software\System\DependencyWalker64\depends.exe

::pause