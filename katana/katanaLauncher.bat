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
set GLM_OFFICIAL_VERSION=8-2021.04.28-#2333
::set GLMCROWD_ANL_ENABLE=1

set KATANA_VERSION=3.5v4
set RMAN_VERSION=23.3
set DEFAULT_RENDERER=Arnold


::/***************************************************************************
:: LICENSE
::***************************************************************************/

::set GLMCROWD_NO_PLE=1
::set GLMCROWD_NO_LICENSE=1
set foundry_LICENSE=C:\Licenses\foundry.lic
set golaem_LICENSE=C:\Licenses\golaemLayout.lic


::/***************************************************************************
:: GOLAEM
::***************************************************************************/

set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\GolaemForKatana%GLM_MAIN_VERSION%\install3\GolaemCrowd
IF %GLM_MODE% == Debug (
	set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\GolaemForKatana%GLM_MAIN_VERSION%\install3\GolaemCrowdDBG
)
IF %GLM_MODE% == Official (
	set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-%GLM_OFFICIAL_VERSION%-Katana3.5-windows
)

set KTOG_PATH=%GLM_INSTALL_PREFIX%\procedurals\katana
set GLM_CROWD_BIN=%GLM_INSTALL_PREFIX%\bin


::/***************************************************************************
:: RENDERMAN
::***************************************************************************/

set RMANTREE=C:\Program Files\Pixar\RenderManProServer-%RMAN_VERSION%
set KTOR_PATH=C:\Program Files\Pixar\RenderManForKatana-%RMAN_VERSION%-katana3.5\plugins\Resources\PRMan23
::set RFK_REDIRECT_OUTPUT="C:/katanaLog.txt"
set RMAN_DSOPATH=%GLM_INSTALL_PREFIX%\procedurals\renderman\23
set RMAN_RIXPLUGINPATH=%GLM_INSTALL_PREFIX%\shaders\renderman\23;%RMANTREE%\lib\plugins


::/***************************************************************************
:: ARNOLD
::***************************************************************************/

pushd C:
set KTOA_PATH=C:\solidangle\ktoadeploy\3.5-3.1.1.2
set ARNOLD_PLUGIN_PATH=%GLM_INSTALL_PREFIX%\procedurals\arnold\60;%GLM_INSTALL_PREFIX%\shaders\arnold\60

::/***************************************************************************
:: REDSHIFT
::***************************************************************************/

set KTORS_PATH=C:\ProgramData\Redshift\Plugins\Katana\3.0v1
set REDSHIFT_BIN=C:\ProgramData\Redshift\bin
set REDSHIFT_PROCEDURALSPATH=%GLM_INSTALL_PREFIX%\procedurals\redshift\3036;%REDSHIFT_PROCEDURALSPATH%

::/***************************************************************************
:: 3DELIGHT
::***************************************************************************/

set KTO3DL_PATH=C:\Program Files\3Delight\3DelightForKatana
set _3DL_BIN=C:\Program Files\3Delight\bin


::/***************************************************************************
:: USD
::***************************************************************************/

set FNPXR_PLUGINPATH=C:\Program Files\Golaem\Golaem-%GLM_OFFICIAL_VERSION%-Katana3.5USD-windows\procedurals\usd
::set FNPXR_PLUGINPATH=%GLM_INSTALL_PREFIX%\procedurals\usd
::set USD_KATANA_ALLOW_CUSTOM_MATERIAL_SCOPES=1


::/***************************************************************************
:: ENVIRONMENT
::***************************************************************************/

:: My Environment
set MY_ENVIRONMENT=C:\Users\chaverou\Developments\VFXEnvironment
set KATANA_TOOLS=%MY_ENVIRONMENT%\katana\tools


::/***************************************************************************
:: LAUNCH KATANA
::***************************************************************************/

set KATANA_LOCATION=C:\Program Files\Foundry\Katana%KATANA_VERSION%
set "KATANA_TAGLINE=With Katana %KATANA_VERSION% - kToA 2.3.1.1 and Renderman %RMAN_VERSION%"
set KATANA_POST_PYTHONPATH=%KTOG_PATH%\Python;
set KATANA_RESOURCES=%KTOA_PATH%;%KTOR_PATH%;%KTORS_PATH%;%KTO3DL_PATH%;%KTOG_PATH%;%KATANA_TOOLS%;%KATANA_LOCATION%\plugins\Resources\Usd\plugin
set PATH=%KTOA_PATH%\bin;%REDSHIFT_BIN%;%_3DL_BIN%;%GLM_CROWD_BIN%;%KATANA_LOCATION%\plugins\Resources\Usd\lib;%PATH%

set KATANA_EXE=bin\katanaBin.exe
"%KATANA_LOCATION%\%KATANA_EXE%"

::C:\Users\chaverou\Software\System\DependencyWalker64\depends.exe
::pause
