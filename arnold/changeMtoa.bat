set MAYA_VERSION=2018
set MTOA_VERSION=4.2.0

:: remove Uninstall registry entry
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Uninstall\MtoA%MAYA_VERSION%" /f

:: Remove current simlink
rmdir C:\solidangle\mtoadeploy\%MAYA_VERSION%
:: Create new simlink
mklink /D C:\solidangle\mtoadeploy\%MAYA_VERSION% C:\solidangle\mtoadeploy\%MAYA_VERSION%-%MTOA_VERSION%
:: Isolate mod file
if not exist "C:\solidangle\mtoadeploy\%MAYA_VERSION%-%MTOA_VERSION%\mod\" mkdir "C:\solidangle\mtoadeploy\%MAYA_VERSION%-%MTOA_VERSION%\mod"
copy "C:\solidangle\mtoadeploy\%MAYA_VERSION%-%MTOA_VERSION%\mtoa.mod" "C:\solidangle\mtoadeploy\%MAYA_VERSION%-%MTOA_VERSION%\mod\mtoa.mod"

pause
