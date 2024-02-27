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
set GLM_OFFICIAL_VERSION=9.0.1-2024.02.20-#2957
::set GLM_OFFICIAL_VERSION=8.2.7-2024.02.05-#2946

set USD_VERS=0.23.11.py310
set CONDA_ENV=usd_py310

::set USD_VERS=0.20.02
::set CONDA_ENV=usd_py27

::/***************************************************************************
:: FILE
::***************************************************************************/

::set USD_FILE=N:/tests/nicolas/export/quickStart826/usdProc/quickStart826.renderProxyShape1.usda
set USD_FILE=N:/tests/nicolas/export/quickStart826/usdSkel/quickStart826.crowdField1_renderProxyShape1.usda
::set USD_FILE=N:/tests/nicolas/export/quickstart90/usdProc/quickstart90.renderProxyShape1.usda
set USD_FILE=N:/tests/nicolas/export/usdTD/usdProc/usdTD.renderProxyShape1.usda

::/***************************************************************************
:: ENV
::***************************************************************************/

set GLMCROWD_ANL_ENABLE=0
set GLM_INSTALL_DIR=C:\Users\chaverou\Developments\GolaemForUSD9\install2308\GolaemCrowd
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
call conda activate %CONDA_ENV%
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