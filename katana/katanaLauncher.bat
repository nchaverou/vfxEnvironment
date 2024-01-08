::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: KATANA VARS
::***************************************************************************/

set GLM_MODE=Official
set GLM_MAIN_VERSION=8
set GLM_OFFICIAL_VERSION=8.2.6-2023.12.12-#2921
::set GLM_OFFICIAL_VERSION=9-2023.10.25-#2869
::set GLMCROWD_ANL_ENABLE=1

set KATANA_VERSION=4.0v2
set KATANA_BVERSION=4
set KATANA_IVERSION=3.5

::set KATANA_VERSION=6.0v2
::set KATANA_BVERSION=6
::set KATANA_IVERSION=6.0

set RMAN_VERSION=25.0
set DEFAULT_RENDERER=Arnold


::/***************************************************************************
:: LICENSE
::***************************************************************************/

::set GLMCROWD_NO_PLE=1
::set GLMCROWD_NO_LICENSE=1
set foundry_LICENSE=C:\Licenses\foundry.lic
set golaem_LICENSE=C:\Licenses\golaemLite.lic


::/***************************************************************************
:: GOLAEM
::***************************************************************************/

set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\GolaemForKatana%GLM_MAIN_VERSION%\install%KATANA_BVERSION%\GolaemCrowd
IF %GLM_MODE% == Debug (
	set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\GolaemForKatana%GLM_MAIN_VERSION%\install3%KATANA_BVERSION%\GolaemCrowdDBG
)
IF %GLM_MODE% == Official (
	set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-%GLM_OFFICIAL_VERSION%-Katana%KATANA_IVERSION%-windows
)

set KTOG_PATH=%GLM_INSTALL_PREFIX%\procedurals\katana
set GLM_CROWD_BIN=%GLM_INSTALL_PREFIX%\bin


::/***************************************************************************
:: RENDERMAN
::***************************************************************************/

set RMANTREE=C:\Program Files\Pixar\RenderManProServer-%RMAN_VERSION%
::set KTOR_PATH=C:\Program Files\Pixar\RenderManForKatana-%RMAN_VERSION%-katana3.5\plugins\Resources\PRMan23
set KTOR_PATH=C:\Program Files\Pixar\RenderManForKatana-%RMAN_VERSION%\plugins\katana4.0\
::set RFK_REDIRECT_OUTPUT="C:/katanaLog.txt"
set RMAN_DSOPATH=%GLM_INSTALL_PREFIX%\procedurals\renderman\24
set RMAN_RIXPLUGINPATH=%GLM_INSTALL_PREFIX%\shaders\renderman\24;%RMANTREE%\lib\plugins


::/***************************************************************************
:: ARNOLD
::***************************************************************************/

pushd C:
set KTOA_PATH=C:\solidangle\ktoadeploy\4.0-4.2.1.1
set ARNOLD_PLUGIN_PATH=%GLM_INSTALL_PREFIX%\procedurals\arnold\72;%GLM_INSTALL_PREFIX%\shaders\arnold\72

::/***************************************************************************
:: REDSHIFT
::***************************************************************************/

set KTORS_PATH=C:\ProgramData\Redshift\Plugins\Katana\4.0v1
set REDSHIFT_BIN=C:\ProgramData\Redshift\bin
set REDSHIFT_PROCEDURALSPATH=%GLM_INSTALL_PREFIX%\procedurals\redshift\3514;%REDSHIFT_PROCEDURALSPATH%

::/***************************************************************************
:: 3DELIGHT
::***************************************************************************/

set KTO3DL_PATH=C:\Program Files\3Delight\3DelightForKatana
set _3DL_BIN=C:\Program Files\3Delight\bin


::/***************************************************************************
:: USD
::***************************************************************************/

set FNPXR_PLUGINPATH=C:\Program Files\Golaem\Golaem-%GLM_OFFICIAL_VERSION%-Katana3.5-USD-windows\procedurals\usd
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
