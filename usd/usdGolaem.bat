::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: USD VARS
::***************************************************************************/

set GLM_MODE=Official
set USD_VERS=0.19.11


::/***************************************************************************
:: FILE
::***************************************************************************/

::set USD_FILE=D:\Users\chaverou\Developments\VFXEnvironment\usd\files\Golaem.usda
::set USD_FILE=D:\Users\chaverou\Developments\VFXEnvironment\usd\files\GolaemMin.usda
::set USD_FILE=D:\Users\chaverou\Developments\VFXEnvironment\usd\files\golaemUsd100.renderProxyShape1.usda
::set USD_FILE=C:\Users\chaverou\Desktop\scenes\golaem721\quickStart721-TODELETE.renderProxyShape1.usda
set USD_FILE=C:\Users\chaverou\Desktop\scenes\archery\archeryUSD.renderProxyShape1.usda


::/***************************************************************************
:: ENV
::***************************************************************************/

set USD_INSTALL_DIR=D:\Users\chaverou\Developments\GolaemMisc\golaemExternals\USD\%USD_VERS%\windows

set GLM_INSTALL_DIR=D:\Users\chaverou\Developments\GolaemForUSD7\install19\GolaemCrowd
IF %GLM_MODE% == Official (
	set GLM_INSTALL_DIR=C:\Program Files\Golaem\Golaem-7.2.1-2020.01.14-#1995-USD0.19.11-windows
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