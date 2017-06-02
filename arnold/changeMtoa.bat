set MAYA_VERSION=2016
::set MTOA_VERSION=1.3.1.2
set MTOA_VERSION=1.4.2.2

:: remove Uninstall registry entry
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Uninstall\MtoA2016" /f

:: Remove current simlink
rmdir C:\solidangle\mtoadeploy\%MAYA_VERSION%
:: Create new simlink
mklink /D C:\solidangle\mtoadeploy\%MAYA_VERSION% C:\solidangle\mtoadeploy\%MAYA_VERSION%-%MTOA_VERSION%
