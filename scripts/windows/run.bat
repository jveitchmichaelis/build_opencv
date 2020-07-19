@echo off
setlocal
:: set working directory to script directory
SET initcwd=%cd%
SET scriptpath=%~dp0
cd %scriptpath:~0,-1%

call download.bat
call build.bat

:: reset working directory
cd %initcwd%

endlocal