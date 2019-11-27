::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: ENVIRONMENT
::***************************************************************************/

set MAYA_VERSION=2018
::set DCC=Maya
set DCC=Katana

:: Python
set golaem_LICENSE=D:\golaemLayout.lic
set GLM_INSTALL_DIR=D:\Users\chaverou\Developments\Golaem7\install%MAYA_VERSION%\GolaemCrowdDBG
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

:: Launch
%PYTHONINTERPRETER% %LAYOUT_TOOL%
::%PYTHONINTERPRETER%

