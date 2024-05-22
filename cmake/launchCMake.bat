::/***************************************************************************
::*                                                                          *
::*  Copyright (C) Golaem S.A. - All Rights Reserved.                        *
::*                                                                          *
::***************************************************************************/

::/***************************************************************************
:: GLOBAL VARS
::***************************************************************************/

set CMAKE_PROJECT=Golaem9-Maya2024
::set CMAKE_PROJECT=Golaem9-Houdini20
::set CMAKE_PROJECT=Golaem8-Katana6-Py3
::set CMAKE_PROJECT=Golaem8-Max24
::set CMAKE_PROJECT=Golaem9-USD2308

set GLM_GEO_ENGINE_VERSION=1409101264
set GLM_SOURCE_HOME=C:\Users\chaverou\Developments
set GLM_EXTERNALS_HOME=C:\Users\chaverou\Developments\GolaemExternals


::/***************************************************************************
:: Projects
::***************************************************************************/

:: Default
set GOLAEM_VERSION=8
set PYTHON_VERSION=2
set BUILD_CROWD=OFF
set BUILD_HOUDINI=OFF
set BUILD_MAX=OFF
set BUILD_SAMPLES=OFF
set BUILD_TESTS=OFF
set COMPILER=Visual Studio 15 2017

:: Golaem8 Maya2020
IF %CMAKE_PROJECT% == Golaem8-Maya2020 (
	set DCC_VERSION=2020
	set DIR_NAME=Golaem
	set BUILD_CROWD=ON
)

:: Golaem8 Maya2022
IF %CMAKE_PROJECT% == Golaem8-Maya2022 (
	set DCC_VERSION=2022
	set DIR_NAME=Golaem
	set BUILD_CROWD=ON
	set COMPILER=Visual Studio 16 2019
)

:: Golaem9 Maya2020
IF %CMAKE_PROJECT% == Golaem9-Maya2020 (
	set GOLAEM_VERSION=9
	set DCC_VERSION=2020
	set DIR_NAME=Golaem
	set BUILD_CROWD=ON
)

:: Golaem9 Maya2020
IF %CMAKE_PROJECT% == Golaem9-Maya2022 (
	set GOLAEM_VERSION=9
	set DCC_VERSION=2022
	set DIR_NAME=Golaem
	set BUILD_CROWD=ON
)

:: Golaem9 Maya2020
IF %CMAKE_PROJECT% == Golaem9-Maya2024 (
	set GOLAEM_VERSION=9
	set DCC_VERSION=2024
	set DIR_NAME=Golaem
	set BUILD_CROWD=ON
	set COMPILER=Visual Studio 17 2022
)

:: Golaem8 Houdini19 Py39
IF %CMAKE_PROJECT% == Golaem8-Houdini195 (
	set DCC_VERSION=195
	set PYTHON_VERSION=3
	set HOUDINI_VERSION=19.5
	set DIR_NAME=GolaemForHoudini
	set BUILD_HOUDINI=ON
	set COMPILER=Visual Studio 16 2019
)

:: Golaem8 Houdini20 Py310
IF %CMAKE_PROJECT% == Golaem9-Houdini20 (
	set GOLAEM_VERSION=9
	set DCC_VERSION=20
	set PYTHON_VERSION=3
	set PYTHON_SUBVERSION=9
	set HOUDINI_VERSION=20.0
	set DIR_NAME=GolaemForHoudini
	set BUILD_HOUDINI=ON
	set COMPILER=Visual Studio 17 2022
)

:: Golaem8 Katana 3 (Python2)
IF %CMAKE_PROJECT% == Golaem8-Katana3-Py2 (
	set DCC_VERSION=3
	set PYTHON_VERSION=2
	set KATANA_VERSION=3.0
	set DIR_NAME=GolaemForKatana
	set BUILD_KATANA=ON
)

:: Golaem8 Katana 6 (Python3)
IF %CMAKE_PROJECT% == Golaem8-Katana6-Py3 (
	set DCC_VERSION=6
	set PYTHON_VERSION=3
	set KATANA_VERSION=6.0
	set DIR_NAME=GolaemForKatana
	set BUILD_KATANA=ON
	set COMPILER=Visual Studio 16 2019
)

:: Golaem8 Max 2022 (Python2)
IF %CMAKE_PROJECT% == Golaem8-Max22 (
	set DCC_VERSION=2022
	set PYTHON_VERSION=2
	set DIR_NAME=GolaemForMax
	set BUILD_MAX=ON
	set COMPILER=Visual Studio 16 2019
)

:: Golaem8 Max 2023
IF %CMAKE_PROJECT% == Golaem8-Max23 (
	set DCC_VERSION=2023
	set DIR_NAME=GolaemForMax
	set BUILD_MAX=ON
	set COMPILER=Visual Studio 16 2019
)

:: Golaem8 Max 2024
IF %CMAKE_PROJECT% == Golaem8-Max24 (
	set DCC_VERSION=2024
	set DIR_NAME=GolaemForMax
	set BUILD_MAX=ON
	set COMPILER=Visual Studio 16 2019
)

:: Golaem9 Max 2023
IF %CMAKE_PROJECT% == Golaem9-Max23 (
	set GOLAEM_VERSION=9
	set DCC_VERSION=2023
	set DIR_NAME=GolaemForMax
	set BUILD_MAX=ON
	set COMPILER=Visual Studio 16 2019
)

:: Golaem9 Max 2023
IF %CMAKE_PROJECT% == Golaem9-USD2308 (
	set GOLAEM_VERSION=9
	set DCC_VERSION=2308
	set DIR_NAME=GolaemForUSD
	set BUILD_USD=ON
	set COMPILER=Visual Studio 15 2017
)



::/***************************************************************************
:: CMAKE OPTIONS
::***************************************************************************/

set SOURCE_DIR=%GLM_SOURCE_HOME%\%DIR_NAME%%GOLAEM_VERSION%
set BUILD_DIR=%SOURCE_DIR%\build%DCC_VERSION%
set BIN_DIR=%SOURCE_DIR%\bin%DCC_VERSION%
set INSTALL_DIR=%SOURCE_DIR%\install%DCC_VERSION%
set SLN_POSTFIX=%GOLAEM_VERSION%
set CMAKE_VARS=%CMAKE_VARS% -DMAYA_VERSION=%DCC_VERSION% -DKATANA_VERSION=%KATANA_VERSION% -DHOUDINI_VERSION=%HOUDINI_VERSION% -D3DSMAX_VERSION=%DCC_VERSION%
set CMAKE_VARS=%CMAKE_VARS% -DBUILD_CROWD=%BUILD_CROWD% -DBUILD_KATANA=%BUILD_KATANA% -DBUILD_HOUDINI=%BUILD_HOUDINI% -DBUILD_3DSMAXVRAY=%BUILD_MAX% -DBUILD_USD=%BUILD_USD% -DBUILD_SAMPLES=%BUILD_SAMPLES% -DBUILD_TESTS=%BUILD_TESTS%
set CMAKE_VARS=%CMAKE_VARS% -DGOLAEM_BINARIES_DIR=%BIN_DIR% -DGOLAEM_INSTALL_DIR=%INSTALL_DIR% -DGOLAEM_SLN_POSTFIX=%SLN_POSTFIX%


::/***************************************************************************
:: LAUNCH CMAKE
::***************************************************************************/

set CMAKE_LOC=C:\Program Files\CMake\bin
set CMAKE_BIN=cmake.exe
set CMAKEGUI_BIN=cmake-gui.exe

:: Force empty
::del %BUILD_DIR%\CMakeCache.txt

:: Configure Solution if cmake cache is empty
if not exist %BUILD_DIR%\CMakeCache.txt (
	"%CMAKE_LOC%\%CMAKE_BIN%" -G "%COMPILER%" -A x64 %CMAKE_VARS% -S %SOURCE_DIR% -B %BUILD_DIR%
)
:: Launch GUI
"%CMAKE_LOC%\%CMAKEGUI_BIN%" -S %SOURCE_DIR% -B %BUILD_DIR%

::pause