@echo off

:: Output computer information in a ~.txt file
del ~.txt /q /f >nul 2>nul
start "" /w dxdiag /t ~

:: Parse the ~.txt file, concatenate the resolutions
setlocal enableextensions enabledelayedexpansion
for /f "tokens=2 delims=:" %%a in ('find "Current Mode:" ~.txt') do call :concat %%a

:: Check if the concatenate contains the laptop resolution (3200 x 1800) and if yes copy the relative configFile
if not x"%myvar:3200=%"==x"%myvar%" (
	copy "..\prefs\MayaInterfaceScalingConfigMax" "..\prefs\MayaInterfaceScalingConfig"
	echo One monitor configuration
) ELSE (
	copy "..\prefs\MayaInterfaceScalingConfigMin" "..\prefs\MayaInterfaceScalingConfig"
	echo Multiple monitors configuration
)
endlocal

:: Remove file ~.txt
del ~.txt /q /f >nul 2>nul
goto :eof

:concat
set myvar=%myvar% %1
goto :eof
