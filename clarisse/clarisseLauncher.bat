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
set GLM_OFFICIAL_VERSION=8.1.2
set GLM_OFFICIAL_VERSION=8.2-2022.09.05-#2628
set HOUDINI_VERSION=19.0.622
set HOUDINI_BVERSION=19
set HOUDINI_IVERSION=19.0
::set HOUDINI_VERSION=18.0.566
set GLMCROWD_ANL_ENABLE=1



::/***************************************************************************
:: ENVIRONMENT
::***************************************************************************/

:: Globals
set PYTHONPATH=C:\Program Files\Autodesk\Maya2022\bin
set PATH=%PYTHONPATH%;%PATH%


::/***************************************************************************
:: Launch Houdini with the right configuration
::***************************************************************************/

set CLARISSE_LOCATION=C:\Program Files\Isotropix\Clarisse 5.0 SP9\Clarisse
set CLARISSE_EXE=clarisse.exe
"%CLARISSE_LOCATION%\%CLARISSE_EXE%" -flavor ifx -ple

::pause
::C:\Users\chaverou\Software\System\DependencyWalkerx64\depends.exe
