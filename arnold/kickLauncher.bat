
:: Parameters
set MAYA_VERSION=2016
::set GLM_INSTALL_PREFIX=C:\Users\chaverou\Developments\Golaem 5\install%MAYA_VERSION%\GolaemCrowdDBG
set GLM_INSTALL_PREFIX=C:\Program Files\Golaem\Golaem-5.3.2.1-Maya2016

:: File to render
set ASS_FILE=C:\renderScene\scenes\bboxRenderScene.ass

:: Configure
set PATH=%GLM_INSTALL_PREFIX%\bin;%PATH%
set ARNOLD_PROCEDURAL_PATH=%GLM_INSTALL_PREFIX%\procedurals;%ARNOLD_PROCEDURAL_PATH%

:: Launch Kick
::set ARNOLD_LOCATION=C:\solidangle\mtoadeploy\%MAYA_VERSION%
set ARNOLD_LOCATION=C:\Users\chaverou\Downloads\Arnold-4.2.15.1.wip_golaem-windows
set KICK_EXE=bin\kick.exe
"%ARNOLD_LOCATION%\%KICK_EXE%" -i "%ASS_FILE%"

pause