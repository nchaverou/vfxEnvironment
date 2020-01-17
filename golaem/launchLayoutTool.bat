::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: GLOBAL VARS
::***************************************************************************/

set GLM_MODE=Official
set GLM_OFFICIAL_VERSION=7.2.1-2020.01.13-PR1994
set MAYA_VERSION=2018
::set DCC=Katana
set DCC=Maya
set golaem_LICENSE=D:\golaemLayout.lic


::/***************************************************************************
:: GOLAEM VARS
::***************************************************************************/

set GLM_INSTALL_DIR=D:\Users\chaverou\Developments\Golaem7\install%MAYA_VERSION%\GolaemCrowd
IF %GLM_MODE% == Debug (
	set GLM_INSTALL_DIR=D:\Users\chaverou\Developments\Golaem7\install%MAYA_VERSION%\GolaemCrowdDBG
)
IF %GLM_MODE% == Official (
	set GLM_MODULE_PATH=C:\Program Files\Golaem\Golaem-%GLM_OFFICIAL_VERSION%-Maya%MAYA_VERSION%
)


::/***************************************************************************
:: PYTHON
::***************************************************************************/

set PYTHONPATH=%GLM_INSTALL_DIR%\bin;%GLM_INSTALL_DIR%\scripts;%GLM_INSTALL_DIR%\scripts\glm;%PYTHONPATH%
set PATH=%GLM_INSTALL_DIR%\bin;%PATH%

:: Python Interpreter
IF %DCC% == Maya (
	set PYTHONINTERPRETER="C:\Program Files\Autodesk\Maya%MAYA_VERSION%\bin\mayapy.exe"
)
IF %DCC% == Katana (
	set foundry_LICENSE=D:\foundry.lic
	set PYTHONINTERPRETER="C:\Program Files\Foundry\Katana3.1v2\bin\katanaPython.exe"
)

:: Script
set LAYOUT_TOOL="%GLM_INSTALL_DIR%\scripts\glm\layout\layoutEditorStandAlone.py"


::/***************************************************************************
:: LAUNCH
::***************************************************************************/

%PYTHONINTERPRETER% %LAYOUT_TOOL%
::%PYTHONINTERPRETER%
