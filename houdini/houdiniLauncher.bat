::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: GLOBAL VARS
::***************************************************************************/

set GLM_MODE=Release
set GLM_MAIN_VERSION=7
set GLM_OFFICIAL_VERSION=6.4.2
set HOUDINI_VERSION=17.5.293


::/***************************************************************************
:: GOLAEM
::***************************************************************************/

set golaem_LICENSE=D:\golaemLayout.lic
::set GLM_INSTALL_PREFIX=D:\Users\chaverou\Developments\Golaem%GLM_MAIN_VERSION%\install2018\GolaemCrowd
set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-7.1-2019.09.06-PR1879-Houdini


::/***************************************************************************
:: HOUDINI PROJECT
::***************************************************************************/

:: Houdini environment 
set HIP=N:/tests/nicolas


::/***************************************************************************
:: ENVIRONMENT
::***************************************************************************/

:: Globals
set PATH=%GLM_INSTALL_PREFIX%\bin;%PATH%

:: Houdini Custom plugins
::set HOUDINI_DSO_ERROR=3
set HOUDINI_DSO_PATH=%GLM_INSTALL_PREFIX%\procedurals\houdini;^&
set PYTHONPATH=%GLM_INSTALL_PREFIX%\procedurals\houdini\python;^&
set HOUDINI_TOOLBAR_PATH=%GLM_INSTALL_PREFIX%\procedurals\houdini\shelf;^&
set HOUDINI_UI_ICON_PATH=%GLM_INSTALL_PREFIX%\procedurals\houdini\icons;^&


::/***************************************************************************
:: Launch Houdini with the right configuration
::***************************************************************************/

set HOUDINI_LOCATION=C:\Program Files\Side Effects Software\Houdini %HOUDINI_VERSION%
set HOUDINI_EXE=bin\houdinifx.exe
"%HOUDINI_LOCATION%\%HOUDINI_EXE%"
