set MAYA_VERSION=2018
::set MTOA_VERSION=2.1.0.1
set MTOA_VERSION=3.0.1.1
::set MTOA_VERSION=2.0.2.3

:: remove Uninstall registry entry
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Uninstall\MtoA%MAYA_VERSION%" /f

:: Remove current simlink
rmdir C:\solidangle\mtoadeploy\%MAYA_VERSION%
:: Create new simlink
mklink /D C:\solidangle\mtoadeploy\%MAYA_VERSION% C:\solidangle\mtoadeploy\%MAYA_VERSION%-%MTOA_VERSION%

pause
