::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: UNREAL VARS
::***************************************************************************/

set UNREAL_VERSION=4.20
set GLM_VERSION=6.3.5


::/***************************************************************************
:: GOLAEM
::***************************************************************************/

set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\Golaem For Unreal
set GLM_PROJECT=GolaemForUnreal.uproject

::/***************************************************************************
:: LAUNCH UNREAL
::***************************************************************************/

set UNREAL_LOCATION=C:\Program Files\Epic Games\UE_%UNREAL_VERSION%\
set UNREAL_EXE=Engine\Binaries\Win64\UE4Editor-Cmd.exe
"%UNREAL_LOCATION%\%UNREAL_EXE%" "%GLM_INSTALL_PREFIX%\%GLM_PROJECT%"

::pause