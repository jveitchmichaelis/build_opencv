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

:: create install folder
set install_folder=%cd%\install
rmdir /Q /S "%install_folder%"
:: create build folder
mkdir %install_folder%

:: clean build folder
set build_folder=%cd%\opencv\build
rmdir /Q /S "%build_folder%"
:: create build folder
mkdir %build_folder%

:: define build_examples as on/off
if "%with_examples%" == "true" (
    set cmake_build_examples=ON
) else (
    set cmake_build_examples=OFF
)

:: define build_world as on/off
if "%build_world%" == "true" (
    set cmake_build_world=ON
) else (
    set cmake_build_world=OFF
)

:: define contrib only options
if "%with_contrib%" == "true" (
    set cmake_extra_modules_path=%cd%/opencv_contrib/modules
) else (
    set cmake_extra_modules_path=""
)

:: define cuda only options
if "%with_cuda%" == "true" (
    set cmake_with_cuda=ON
    set cmake_enable_fast_math=0
    set cmake_cuda_fast_math=1
    set cmake_with_cublas=1
) else (
    set cmake_with_cuda=OFF
    set cmake_enable_fast_math=0
    set cmake_cuda_fast_math=0
    set cmake_with_cublas=0
)

:: build opencv
cd %build_folder%
cmake -G "%visual_studio_version%" ^
    -D CMAKE_BUILD_TYPE=RELEASE ^
    -D CMAKE_INSTALL_PREFIX=%install_folder% ^
    -D BUILD_opencv_world=%cmake_build_world% ^
    -D WITH_CUDA=%cmake_with_cuda% ^
    -D ENABLE_FAST_MATH=%cmake_enable_fast_math% ^
    -D CUDA_FAST_MATH=%cmake_cuda_fast_math% ^
    -D WITH_CUBLAS=%cmake_with_cublas% ^
    -D INSTALL_PYTHON_EXAMPLES=%cmake_with_cuda% ^
    -D OPENCV_EXTRA_MODULES_PATH=%cmake_extra_modules_path% ^
    -D BUILD_EXAMPLES=%cmake_with_cuda% ..

:: install opencv
cmake --build . --config Release --target install

:: reset working directory
cd %initcwd%

endlocal