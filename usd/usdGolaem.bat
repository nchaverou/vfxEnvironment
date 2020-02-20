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
set GLM_OFFICIAL_VERSION=7.2.2-2020.02.05-#2021
set GLM_MODE=Official
set USD_VERS=0.19.11


::/***************************************************************************
:: FILE
::***************************************************************************/

::set USD_FILE=D:\Users\chaverou\Developments\VFXEnvironment\usd\files\Golaem.usda
set USD_FILE=C:\Users\chaverou\Desktop\scenes\golaem722\quickStart722.renderProxyShape1.usda


::/***************************************************************************
:: ENV
::***************************************************************************/

set GLMCROWD_ANL_ENABLE=1

set USD_INSTALL_DIR=D:\Users\chaverou\Developments\GolaemMisc\golaemExternals\USD\%USD_VERS%\windows

set GLM_INSTALL_DIR=D:\Users\chaverou\Developments\GolaemForUSD7\install19\GolaemCrowd
set GLM_INSTALL_DIR=D:\Users\chaverou\Developments\GolaemForUSD-StandAlone\install\GolaemForUSD
IF %GLM_MODE% == Official (
	set GLM_INSTALL_DIR=C:\Program Files\Golaem\Golaem-%GLM_OFFICIAL_VERSION%-USD%USD_VERS%-windows
)

set PYTHONPATH=%USD_INSTALL_DIR%/lib/python;%PYTHONPATH%
set PATH=%GLM_INSTALL_DIR%/bin;%USD_INSTALL_DIR%/bin;%USD_INSTALL_DIR%/lib;%PATH%
set PXR_PLUGINPATH_NAME=%GLM_INSTALL_DIR%/procedurals/usd

::pushd N:\tests\daniel\USDFiles


::/***************************************************************************
:: PYTHON
::***************************************************************************/

set MAYA_LOCATION=C:\Program Files\Autodesk\Maya2018
set MAYA_PYTHON=bin\mayapy.exe

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