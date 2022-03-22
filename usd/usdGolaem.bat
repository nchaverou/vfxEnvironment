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
set GLM_OFFICIAL_VERSION=8.1.1
set USD_VERS=0.20.02


::/***************************************************************************
:: FILE
::***************************************************************************/

::set USD_FILE=N:/tests/nicolas/usd/quickstart739.renderProxyShape1.usda
set USD_FILE=N:/tests/nicolas/export/quickStart803/usdProc/quickStart803.renderProxyShape1.usda
set USD_FILE=N:/tests/nicolas/export/quickStart803/usdSkel/quickStart803.crowdField1_renderProxyShape1.usda
::set USD_FILE=N:/tests/nicolas/export/usdExport/usd/usdExport.crowdField1_renderProxyShape1.usda
set USD_FILE=N:/tests/nicolas/export/usdExport/usd/usdExport.renderProxyShape1.usda
::set USD_FILE=N:/demos/golaem8PR/export/19-usdDisplay/20-usdDisplay.renderProxyShape.usda
::set USD_FILE=N:/tests/nicolas/export/quickstart80/usdProc/quickstart80.renderProxyShape1.usda
::set USD_FILE=N:/tests/nicolas/export/redshiftMax/usd/redshiftMax.crowdField1_renderProxyShape1.usdc


::/***************************************************************************
:: ENV
::***************************************************************************/

set GLMCROWD_ANL_ENABLE=0
set GLM_INSTALL_DIR=C:\Users\chaverou\Developments\GolaemForUSD7\install19\GolaemCrowd
IF %GLM_MODE% == Official (
	set GLM_INSTALL_DIR=C:\Program Files\Golaem\Golaem-%GLM_OFFICIAL_VERSION%-USD%USD_VERS%-windows
)

set USD_INSTALL_DIR=C:\Users\chaverou\Developments\GolaemMisc\golaemExternals\USD\%USD_VERS%\windows
set PYTHONPATH=%USD_INSTALL_DIR%\lib\python;%PYTHONPATH%
set PATH=%GLM_INSTALL_DIR%/bin;%USD_INSTALL_DIR%/bin;%USD_INSTALL_DIR%/lib;%PATH%
set PXR_PLUGINPATH_NAME=%GLM_INSTALL_DIR%/procedurals/usd


::/***************************************************************************
:: PYTHON
::***************************************************************************/

:: Launch Conda environment Python 2.7
echo off
call C:\ProgramData\Miniconda3\Scripts\activate.bat
call conda activate usd_py27
echo on

:: Conda environment creation
:: conda create --name usd_py27
:: conda activate usd_py27
:: conda install python=2.7
:: pip install PySide
:: pip install PyOpenGL


::/***************************************************************************
:: LAUNCH
::***************************************************************************/

set USD_VIEWER=bin\usdview
"%USD_INSTALL_DIR%\%USD_VIEWER%" "%USD_FILE%"

pause