::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: GLOBAL VARS
::***************************************************************************/

:: Maya
set MAYA_VERSION=2016
set MAYA_LOCATION=C:\Program Files\Autodesk\Maya%MAYA_VERSION%
set MAYAPY_EXE=bin\mayapy.exe

:: AutoTests
set AUTOTEST_LOCATION=C:\Users\chaverou\Developments\Golaem Utils\glmMayaAutotest
set AUTOTEST_SCRIPT=glmTestsCompare.py

set golaem_LICENSE=C:\golaem.lic

::/***************************************************************************
:: LAUNCH MAYAPY
::***************************************************************************/

"%MAYA_LOCATION%\%MAYAPY_EXE%" "%AUTOTEST_LOCATION%\%AUTOTEST_SCRIPT%"
