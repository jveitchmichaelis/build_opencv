@echo off
setlocal
:: set working directory to script directory
SET initcwd=%cd%
SET scriptpath=%~dp0
cd %scriptpath:~0,-1%

echo ================
echo Options
echo ================
:: get version from options file (first line)
set /p opencv_version_text=< options.txt
for /f "tokens=2 delims==" %%a in ("%opencv_version_text%") do (
  set opencv_version=%%a
)
echo opencv_version:%opencv_version%

:: get with_contrib option from options file (second line)
set "with_contrib_text="
for /F "skip=1 delims=" %%i in (options.txt) do if not defined with_contrib_text set "with_contrib_text=%%i"
for /f "tokens=2 delims==" %%a in ("%with_contrib_text%") do (
  set with_contrib=%%a
)
echo with_contrib:%with_contrib%

:: get with_cuda option from options file (third line)
set "with_cuda_text="
for /F "skip=2 delims=" %%i in (options.txt) do if not defined with_cuda_text set "with_cuda_text=%%i"
for /f "tokens=2 delims==" %%a in ("%with_cuda_text%") do (
  set with_cuda=%%a
)
echo with_cuda:%with_cuda%

:: get with_examples option from options file (4th line)
set "with_examples_text="
for /F "skip=3 delims=" %%i in (options.txt) do if not defined with_examples_text set "with_examples_text=%%i"
for /f "tokens=2 delims==" %%a in ("%with_examples_text%") do (
  set with_examples=%%a
)
echo with_examples:%with_examples%

:: get build_world option from options file (5th line)
set "build_world_text="
for /F "skip=4 delims=" %%i in (options.txt) do if not defined build_world_text set "build_world_text=%%i"
for /f "tokens=2 delims==" %%a in ("%build_world_text%") do (
  set build_world=%%a
)
echo build_world:%build_world%

:: get visual_studio_version option from options file (6th line)
set "visual_studio_version_text="
for /F "skip=5 delims=" %%i in (options.txt) do if not defined visual_studio_version_text set "visual_studio_version_text=%%i"
for /f "tokens=2 delims==" %%a in ("%visual_studio_version_text%") do (
  set visual_studio_version=%%a
)
echo visual_studio_version:%visual_studio_version%

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
cd %initcwd%

if "%with_contrib%" == "true" (
  :: checkout specific opencv_contrib version
  cd opencv_contrib
  git checkout tags/%opencv_version%
  :: reset working directory
  cd %initcwd%
)

:: reset working directory
cd %initcwd%

endlocal