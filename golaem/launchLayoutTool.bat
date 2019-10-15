::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: ENVIRONMENT
::***************************************************************************/

:: Python
set MAYA_VERSION=2018

set golaem_LICENSE=D:\golaemFull.lic
set GLM_INSTALL_DIR=D:\Users\chaverou\Developments\Golaem7\install%MAYA_VERSION%\GolaemCrowd
set PATH=%GLM_INSTALL_DIR%\bin;%PATH%
set PYTHONPATH=%GLM_INSTALL_DIR%\bin;%GLM_INSTALL_DIR%\scripts;%GLM_INSTALL_DIR%\scripts\glm;%PYTHONPATH%
set PYTHONINTERPRETER="C:\Program Files\Autodesk\Maya%MAYA_VERSION%\bin\mayapy.exe"

:: Script
set LAYOUT_TOOL="%GLM_INSTALL_DIR%\scripts\glm\layout\layoutEditorStandAlone.py"

:: Launch
%PYTHONINTERPRETER% %LAYOUT_TOOL%
::%PYTHONINTERPRETER%

pause
