@echo off

setlocal

set MAYA_VERSION=2018

set CROWD_HOME=D:\Users\chaverou\Developments\Golaem7\install%MAYA_VERSION%\GolaemCrowdDBG

REM set FLAGS_EXE=N:\tests\customers\imageEngine\crashFrameOffsets\frameOffsets\frameOffsets\x64\Debug\frameOffsets.exe

set FLAGS_EXE=C:\Program Files\Autodesk\Maya%MAYA_VERSION%\bin\maya.exe

REM set ENABLE_FLAGS to 1 to enable flags, set it to 1 to disable them

set ENABLE_FLAGS=0

if "%ENABLE_FLAGS%"=="1" (goto enable) ELSE (goto disable)

:enable

echo Enabling gflags for Maya %MAYA_VERSION%

"C:\Program Files (x86)\Windows Kits\10\Debuggers\x64\gflags.exe" /p /full /enable "%FLAGS_EXE%" /dlls "%CROWD_HOME%\plug-ins\glmCrowd_d.mll", "%CROWD_HOME%\bin\glmCore_vc140x64_d.dll", "%CROWD_HOME%\bin\glmCrowdIO_d.dll", "%CROWD_HOME%\procedurals\glmCrowdArnoldPlugin_d.dll"

goto end

:disable

echo Disabling gflags for Maya %MAYA_VERSION%

"C:\Program Files (x86)\Windows Kits\10\Debuggers\x64\gflags.exe" /p /disable "%FLAGS_EXE%"

goto end

:end

echo gflags Status for Maya %MAYA_VERSION%

"C:\Program Files (x86)\Windows Kits\10\Debuggers\x64\gflags.exe" /p 

pause