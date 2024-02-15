::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: GLOBAL VARS
::***************************************************************************/

set GLM_MODE=Official
set GLM_MAIN_VERSION=8
set GLM_OFFICIAL_VERSION=8.2.7-2024.02.05-PR2946
set MAYA_VERSION=2020
set KATANA_VERSION=3.5v4
::set DCC=Katana
set DCC=Maya
set golaem_LICENSE=C:\Licenses\golaemLite.lic


::/***************************************************************************
:: GOLAEM VARS
::***************************************************************************/

set GLM_INSTALL_DIR=C:\Users\chaverou\Developments\Golaem%GLM_MAIN_VERSION%\install%MAYA_VERSION%\GolaemCrowd
IF %GLM_MODE% == Debug (
	set GLM_INSTALL_DIR=C:\Users\chaverou\Developments\Golaem%GLM_MAIN_VERSION%\install%MAYA_VERSION%\GolaemCrowdDBG
)
IF %GLM_MODE% == Official (
	set GLM_INSTALL_DIR=C:\Program Files\Golaem\Golaem-%GLM_OFFICIAL_VERSION%-Maya%MAYA_VERSION%
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
	set foundry_LICENSE=C:\Licenses\foundry.lic
	set PYTHONINTERPRETER="C:\Program Files\Foundry\Katana%KATANA_VERSION%\bin\katanaPython.exe"
)

:: Script
set LAYOUT_TOOL="%GLM_INSTALL_DIR%\scripts\glm\layout\layoutEditorStandAlone.py"


::/***************************************************************************
:: LAUNCH
::***************************************************************************/

%PYTHONINTERPRETER% %LAYOUT_TOOL%
::%PYTHONINTERPRETER%
pause