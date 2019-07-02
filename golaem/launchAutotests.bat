::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: ENVIRONMENT
::***************************************************************************/


:: MTOA_VERSION
set MAYA_VERSION=2018
set MTOA_MODULE_PATH=C:\solidangle\mtoadeploy\%MAYA_VERSION%\mod
set MAYA_MODULE_PATH=%MTOA_MODULE_PATH%;%MAYA_MODULE_PATH%

set golaem_LICENSE=D:\golaemFull.lic
set GLM_AUTOTESTS=D:\Users\chaverou\Developments\GolaemUtils\glmMayaAutotest\glmTestsCompare.py

set PYTHONINTERPRETER="C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python36_64\python.exe"

:: Launch
%PYTHONINTERPRETER% %GLM_AUTOTESTS%

pause