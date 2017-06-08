::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: GLOBAL VARS
::***************************************************************************/

set KATANA_TOOLS=C:\Users\chaverou\Developments\vfxEnvironment\katana\tools
set KTOA_PATH=C:\solidangle\ktoadeploy\KtoA-1.1.3.1-kat2.5-windows
::set GOLAEM_PATH=C:\Users\chaverou\Developments\katanaGolaem\install
::set KATANA_SAMPLES=C:\Users\chaverou\Developments\katanaGolaem\installOriginal
set GOLAEM_PATH=C:\Users\chaverou\Developments\Golaem For Katana\install

::/***************************************************************************
:: MISC
::***************************************************************************/

set DEFAULT_RENDERER=arnold
set "KATANA_TAGLINE=With KtoA 1.1.3.1 and Arnold 4.2.16.2"

::/***************************************************************************
:: LAUNCH KATANA
::***************************************************************************/

set KATANA_RESOURCES=%KTOA_PATH%;%GOLAEM_PATH%;%KATANA_SAMPLES%;%KATANA_TOOLS%;%KATANA_RESOURCES%
set PATH=%KTOA_PATH%\bin;%PATH%

set KATANA_LOCATION=C:\Program Files\Katana2.5v4
set KATANA_EXE=bin\katanaBin.exe
"%KATANA_LOCATION%\%KATANA_EXE%"

::pause