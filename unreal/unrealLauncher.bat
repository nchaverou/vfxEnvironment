::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: UNREAL VARS
::***************************************************************************/

set GLM_MODE=Official
set GLM_MAIN_VERSION=8
set UNREAL_VERSION=4.27
set UNREAL_VERSION=5.1
::set GLMCROWD_UNIT=2


::/***************************************************************************
:: LICENSE
::***************************************************************************/

::set GLMCROWD_NO_PLE=1
::set GLMCROWD_NO_LICENSE=1
set golaem_LICENSE=C:\Licenses\golaemLite.lic
::set golaem_LICENSE=2375@gitem
::set GLMCROWD_ANL_ENABLE=1


::/***************************************************************************
:: GOLAEM
::***************************************************************************/

set GLM_PROJECT=GolaemForUnreal.uproject
set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\GolaemForUnreal%GLM_MAIN_VERSION%
IF %GLM_MODE% == Official (
	set GLM_INSTALL_PREFIX=C:\Users\chaverou\Documents\UnrealProjects\GolaemReleaseTest%UNREAL_VERSION%
)
::set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\GolaemForUnreal%GLM_MAIN_VERSION%


::/***************************************************************************
:: LAUNCH UNREAL
::***************************************************************************/

set UNREAL_LOCATION=C:\Program Files\Epic Games\UE_%UNREAL_VERSION%\
set UNREAL_EXE=Engine\Binaries\Win64\UnrealEditor.exe
::set UNREAL_EXE=Engine\Binaries\Win64\UE4Editor.exe
"%UNREAL_LOCATION%\%UNREAL_EXE%" "%GLM_INSTALL_PREFIX%\%GLM_PROJECT%"

::C:\Users\chaverou\Software\System\DependencyWalker64\depends.exe
::pause