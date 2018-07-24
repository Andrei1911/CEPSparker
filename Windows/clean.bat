REM
REM Remove locally created, compiled or derived data and attempt to 
REM bring the project back to a 'clean slate'.
REM

set scriptDir=%~dp0
cd %scriptDir%\..
set projectHomeDir=%cd%

call %scriptDir%\clearPlayerDebugMode.bat

if exist %projectHomeDir%\BuildSettings\ExtensionDirName.txt (
	set /p EXTENSION_DIRNAME=< BuildSettings/ExtensionDirName.txt
	if not "%EXTENSION_DIRNAME%" == "" (
		set EXTENSION_HOMEDIR=%APPDATA%\ADobe\CEP\extensions\%EXTENSION_DIRNAME%
		rd /s /q %EXTENSION_HOMEDIR%
	)
)

rd /s /q LocalLinks
rd /s /q build