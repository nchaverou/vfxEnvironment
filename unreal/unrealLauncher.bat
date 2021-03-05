::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: UNREAL VARS
::***************************************************************************/

set GLM_MAIN_VERSION=8
set UNREAL_VERSION=4.25

::/***************************************************************************
:: GOLAEM
::***************************************************************************/

::set GLMCROWD_NO_PLE=1
::set GLMCROWD_NO_LICENSE=1
set golaem_LICENSE=C:\Licenses\golaemMixed.lic
::set golaem_LICENSE=2375@gitem
::set GLMCROWD_ANL_ENABLE=1

set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\GolaemForUnreal%GLM_MAIN_VERSION%
set GLM_PROJECT=GolaemForUnreal.uproject
::set GLM_INSTALL_PREFIX=C:\Users\chaverou\Documents\UnrealProjects\GolaemReleaseTest

set GLMCROWD_UNIT=3

::/***************************************************************************
:: LAUNCH UNREAL
::***************************************************************************/

set UNREAL_LOCATION=C:\Program Files\Epic Games\UE_%UNREAL_VERSION%\
set UNREAL_EXE=Engine\Binaries\Win64\UE4Editor-Cmd.exe
"%UNREAL_LOCATION%\%UNREAL_EXE%" "%GLM_INSTALL_PREFIX%\%GLM_PROJECT%"

::pause