@echo off
setlocal
:: set working directory to script directory
SET initcwd=%cd%
SET scriptpath=%~dp0
cd %scriptpath:~0,-1%
cd %scriptpath%\..\..\

if "%~1"=="" (
  :: options filepath not stated in argument, look for it in options.txt file
  echo Reading options from 'options\options.txt'
  set options_filepath=options\options.txt
) else (
  :: first argument given, read options filepath from argument
  set options_filepath=%~1
)

if exist %options_filepath% (
  echo found options file
) else (
  :: failed to file options.txt file
  echo options file not found
  exit 2
)

echo ================
echo Download Options
echo ================
:: get version from options file (1st line)
set /p opencv_version_text=< %options_filepath%
set "opencv_version=%opencv_version_text:*^==%"
for /f "tokens=2 delims=$" %%a in ("%opencv_version_text%") do ( set opencv_version=%%a )
set opencv_version=%opencv_version:~1,-1%
echo opencv_version:%opencv_version%

:: get visual_studio_version option from options file (2nd line)
set "visual_studio_version_text="
for /F "skip=1 delims=" %%i in (%options_filepath%) do if not defined visual_studio_version_text set "visual_studio_version_text=%%i"
for /f "tokens=2 delims=$" %%a in ("%visual_studio_version_text%") do ( set visual_studio_version=%%a )
set visual_studio_version=%visual_studio_version:~1,-1%
echo visual_studio_version:%visual_studio_version%

:: get clean_on_build option from options file (3rd line)
set "clean_on_build_text="
for /F "skip=2 delims=" %%i in (%options_filepath%) do if not defined clean_on_build_text set "clean_on_build_text=%%i"
for /f "tokens=2 delims=$" %%a in ("%clean_on_build_text%") do ( set clean_on_build=%%a )
set clean_on_build=%clean_on_build:~1,-1%
echo clean_on_build:%clean_on_build%

:: get with_contrib option from options file (4th line)
set "with_contrib_text="
for /F "skip=3 delims=" %%i in (%options_filepath%) do if not defined with_contrib_text set "with_contrib_text=%%i"
for /f "tokens=2 delims=$" %%a in ("%with_contrib_text%") do ( set with_contrib=%%a )
set with_contrib=%with_contrib:~1,-1%
echo with_contrib:%with_contrib%

:: get with_cuda option from options file (5th line)
set "with_cuda_text="
for /F "skip=4 delims=" %%i in (%options_filepath%) do if not defined with_cuda_text set "with_cuda_text=%%i"
for /f "tokens=2 delims=$" %%a in ("%with_cuda_text%") do ( set with_cuda=%%a )
set with_cuda=%with_cuda:~1,-1%
echo with_cuda:%with_cuda%

:: get with_examples option from options file (6th line)
set "with_examples_text="
for /F "skip=5 delims=" %%i in (%options_filepath%) do if not defined with_examples_text set "with_examples_text=%%i"
for /f "tokens=2 delims=$" %%a in ("%with_examples_text%") do ( set with_examples=%%a )
set with_examples=%with_examples:~1,-1%
echo with_examples:%with_examples%

:: get build_world option from options file (7th line)
set "build_world_text="
for /F "skip=6 delims=" %%i in (%options_filepath%) do if not defined build_world_text set "build_world_text=%%i"
for /f "tokens=2 delims=$" %%a in ("%build_world_text%") do ( set build_world=%%a )
set build_world=%build_world:~1,-1%
echo build_world:%build_world%

:: get with_debug option from options file (8th line)
set "with_debug_text="
for /F "skip=7 delims=" %%i in (%options_filepath%) do if not defined with_debug_text set "with_debug_text=%%i"
for /f "tokens=2 delims=$" %%a in ("%with_debug_text%") do ( set with_debug=%%a )
set with_debug=%with_debug:~1,-1%
echo with_debug:%with_debug%

:: get with_python_release option from options file (9th line)
set "with_python_release_text="
for /F "skip=8 delims=" %%i in (%options_filepath%) do if not defined with_python_release_text set "with_python_release_text=%%i"
for /f "tokens=2 delims=$" %%a in ("%with_python_release_text%") do ( set with_python_release=%%a )
set with_python_release=%with_python_release:~1,-1%
echo with_python_release:%with_python_release%

:: get with_python_release option from options file (10th line)
set "with_python_debug_text="
for /F "skip=9 delims=" %%i in (%options_filepath%) do if not defined with_python_debug_text set "with_python_debug_text=%%i"
for /f "tokens=2 delims=$" %%a in ("%with_python_debug_text%") do ( set with_python_debug=%%a )
set with_python_debug=%with_python_debug:~1,-1%
echo with_python_debug:%with_python_debug%

:: get additional_build_options option from options file (11th line)
set "additional_build_options_text="
for /F "skip=10 delims=" %%i in (%options_filepath%) do if not defined additional_build_options_text set "additional_build_options_text=%%i"
for /f "tokens=2 delims=$" %%a in ("%additional_build_options_text%") do ( set additional_build_options=%%a )
set additional_build_options=%additional_build_options:~1,-1%
echo additional_build_options:%additional_build_options%

:: get custom_build_options option from options file (12th line)
set "custom_build_options_text="
for /F "skip=11 delims=" %%i in (%options_filepath%) do if not defined custom_build_options_text set "custom_build_options_text=%%i"
for /f "tokens=2 delims=$" %%a in ("%custom_build_options_text%") do ( set custom_build_options=%%a )
set custom_build_options=%custom_build_options:~1,-1%
echo custom_build_options:%custom_build_options%

echo ================

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