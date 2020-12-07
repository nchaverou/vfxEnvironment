::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: USD VARS
::***************************************************************************/

set GLM_MODE=Official
set GLM_MAIN_VERSION=7
set GLM_OFFICIAL_VERSION=7.3.7-2020.12.01-#2244
set GLM_MODE=Official
set USD_VERS=0.19.11


::/***************************************************************************
:: FILE
::***************************************************************************/

set USD_FILE=N:/tests/nicolas/export/quickStart737/cache/quickStart737.renderProxyShape1.usda
set USD_FILE=N:/tests/nicolas/export/quickStart737/usd/quickStart737.crowdField1_renderProxyShape1.usda
set USD_FILE=N:/tests/customers/digic/201120_usdCrash/ghoul_base_motions_C1_v001.golaemCrowd_ghoul_basic_C1_000_renderProxyShape1.usda


::/***************************************************************************
:: ENV
::***************************************************************************/

set GLMCROWD_ANL_ENABLE=0

::set GLM_INSTALL_DIR=D:\Users\chaverou\Developments\GolaemForUSD7\install19\GolaemCrowd
set GLM_INSTALL_DIR=D:\Users\chaverou\Developments\GolaemForUSD-StandAlone\install\GolaemForUSD
IF %GLM_MODE% == Official (
	set GLM_INSTALL_DIR=C:\Program Files\Golaem\Golaem-%GLM_OFFICIAL_VERSION%-USD%USD_VERS%-windows
)

set USD_INSTALL_DIR=D:\Users\chaverou\Developments\GolaemMisc\golaemExternals\USD\%USD_VERS%\windows
set PYTHONPATH=%USD_INSTALL_DIR%/lib/python;%PYTHONPATH%
set PATH=%GLM_INSTALL_DIR%/bin;%USD_INSTALL_DIR%/bin;%USD_INSTALL_DIR%/lib;%PATH%
set PXR_PLUGINPATH_NAME=%GLM_INSTALL_DIR%/procedurals/usd


::/***************************************************************************
:: PYTHON
::***************************************************************************/

:: Launch Conda environment Python 2.7
echo off
call C:\Users\chaverou\AppData\Local\Continuum\miniconda3\Scripts\activate.bat
call conda activate usd_py27
echo on

::/***************************************************************************
:: LAUNCH
::***************************************************************************/

set USD_VIEWER=bin\usdview
"%USD_INSTALL_DIR%\%USD_VIEWER%" "%USD_FILE%"


pause