::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: UNREAL VARS
::***************************************************************************/

set GLM_MAIN_VERSION=7
set UNREAL_VERSION=4.20

::/***************************************************************************
:: GOLAEM
::***************************************************************************/

set golaem_LICENSE=D:\golaemFull.lic
set golaem_LICENSE=2375@gitem
set GLM_INSTALL_PREFIX=D:\Users\chaverou\Developments\GolaemForUnreal%GLM_MAIN_VERSION%
::set GLM_INSTALL_PREFIX=D:\Users\chaverou\Documents\UnrealProjects\GolaemPluginTest
set GLM_PROJECT=GolaemForUnreal.uproject
::set GLM_PROJECT=GolaemPluginTest.uproject
set GLMCROWD_UNIT=4

::/***************************************************************************
:: LAUNCH UNREAL
::***************************************************************************/

set UNREAL_LOCATION=C:\Program Files\Epic Games\UE_%UNREAL_VERSION%\
set UNREAL_EXE=Engine\Binaries\Win64\UE4Editor-Cmd.exe
"%UNREAL_LOCATION%\%UNREAL_EXE%" "%GLM_INSTALL_PREFIX%\%GLM_PROJECT%"

::pause