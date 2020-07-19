@echo off
setlocal
:: set working directory to script directory
SET initcwd=%cd%
SET scriptpath=%~dp0
cd %scriptpath:~0,-1%
cd ..\..\

echo ================
echo Download Options
echo ================
:: get version from options file (1st line)
set /p opencv_version_text=< options.txt
set "opencv_version=%opencv_version_text:*^==%"
echo opencv_version:%opencv_version%

echo ================

::TODO check valid options set (e.g. with_contib required if with_cuda is true)

:: download opencv repo
git clone https://github.com/opencv/opencv.git

if "%with_contrib%" == "true" (
  :: download opencv_contrib repo
  git clone https://github.com/opencv/opencv_contrib.git
)

:: checkout specific opencv version
cd opencv
git checkout tags/%opencv_version%
:: reset working directory
cd ..\

if "%with_contrib%" == "true" (
  :: checkout specific opencv_contrib version
  cd opencv_contrib
  git checkout tags/%opencv_version%
  :: reset working directory
  cd ..\
)

:: reset working directory
cd %initcwd%

endlocal