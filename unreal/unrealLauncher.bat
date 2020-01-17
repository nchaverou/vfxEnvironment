::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: UNREAL VARS
::***************************************************************************/

set GLM_MAIN_VERSION=7
set UNREAL_VERSION=4.22

::/***************************************************************************
:: GOLAEM
::***************************************************************************/

::set GLMCROWD_NO_PLE=1
::set GLMCROWD_NO_LICENSE=1
set golaem_LICENSE=D:\golaemLayout.lic
::set golaem_LICENSE=2375@gitem

::set GLM_INSTALL_PREFIX=D:\Users\chaverou\Developments\GolaemForUnreal%GLM_MAIN_VERSION%
::set GLM_PROJECT=GolaemForUnreal.uproject
set GLM_INSTALL_PREFIX=D:\Users\chaverou\Documents\UnrealProjects\GolaemPluginTest
set GLM_PROJECT=GolaemPluginTest.uproject
::set GLMCROWD_UNIT=4

::/***************************************************************************
:: LAUNCH UNREAL
::***************************************************************************/

set UNREAL_LOCATION=C:\Program Files\Epic Games\UE_%UNREAL_VERSION%\
set UNREAL_EXE=Engine\Binaries\Win64\UE4Editor-Cmd.exe
"%UNREAL_LOCATION%\%UNREAL_EXE%" "%GLM_INSTALL_PREFIX%\%GLM_PROJECT%"

::pause