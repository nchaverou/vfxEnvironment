set MAYA_VERSION=2016
set MTOA_VERSION=1.4.0

rmdir C:\solidangle\mtoadeploy\%MAYA_VERSION%
mklink /D C:\solidangle\mtoadeploy\%MAYA_VERSION% C:\solidangle\mtoadeploy\%MAYA_VERSION%-%MTOA_VERSION%
