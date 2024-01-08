::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: USD VARS
::***************************************************************************/

set GLM_MODE=Official
set GLM_MAIN_VERSION=8
set GLM_OFFICIAL_VERSION=9-2023.10.27-#2873
set GLM_OFFICIAL_VERSION=8.2.6-2023.12.12-#2921
set USD_VERS=0.23.08
::set USD_VERS=0.20.02

::/***************************************************************************
:: FILE
::***************************************************************************/

set USD_FILE=N:/tests/nicolas/export/quickStart826/usdProc/quickStart826.renderProxyShape1.usda
::set USD_FILE=N:/tests/nicolas/export/quickStart826/usdSkel/quickStart826.crowdField1_renderProxyShape1.usda
::set USD_FILE=N:/tests/nicolas/export/quickstart90/usdProc/quickstart90.renderProxyShape1.usda
::set USD_FILE=N:/tests/nicolas/export/primVarTD/usd/primVarTD.crowdField1_renderProxyShape1.usda
::set USD_FILE=N:/tests/nicolas/export/quickstart90/usdSkel/quickstart90.crowdField1_renderProxyShape1.usda
set USD_FILE=N:/tests/nicolas/export/usdAttr/usd/usdAttr.crowdField1_renderProxyShape1.usda
::set USD_FILE=N:/tests/nicolas/export/usdSkelExport-forPaul/usd/usdSkelExport-forPaul.crowdField1_renderProxyShape2.usda

::/***************************************************************************
:: ENV
::***************************************************************************/

set GLMCROWD_ANL_ENABLE=0
set GLM_INSTALL_DIR=C:\Users\chaverou\Developments\GolaemForUSD7\install19\GolaemCrowd
IF %GLM_MODE% == Official (
	set GLM_INSTALL_DIR=C:\Program Files\Golaem\Golaem-%GLM_OFFICIAL_VERSION%-USD%USD_VERS%-windows
)

set USD_INSTALL_DIR=C:\Users\chaverou\Developments\GolaemExternals\USD\%USD_VERS%\windows
set PYTHONPATH=%USD_INSTALL_DIR%\lib\python
set PATH=%GLM_INSTALL_DIR%/bin;%USD_INSTALL_DIR%/bin;%USD_INSTALL_DIR%/lib;%PATH%
set PXR_PLUGINPATH_NAME=%GLM_INSTALL_DIR%/procedurals/usd


::/***************************************************************************
:: PYTHON
::***************************************************************************/

:: Launch Conda environment Python 2.7
:: env also avail usd_py310 / usd_py38 / usd_py27
echo off
call C:\ProgramData\Miniconda3\Scripts\activate.bat
call conda activate usd_py38
echo on

:: Conda environment creation
:: conda create --name usd_py27
:: conda activate usd_py27
:: conda install python=2.7
:: pip install PySide2
:: pip install PyOpenGL
:: conda remove --name usd_py27 --all


::/***************************************************************************
:: LAUNCH
::***************************************************************************/

set USD_VIEWER=bin\usdview
"%USD_INSTALL_DIR%\%USD_VIEWER%" "%USD_FILE%"

pause