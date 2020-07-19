@echo off
setlocal
:: set working directory to script directory
SET initcwd=%cd%
SET scriptpath=%~dp0
cd %scriptpath:~0,-1%
cd ..\..\

echo ================
echo Build Options
echo ================
:: get version from options file (1st line)
set /p opencv_version_text=< options.txt
set "opencv_version=%opencv_version_text:*^==%"
echo opencv_version:%opencv_version%

:: get visual_studio_version option from options file (2nd line)
set "visual_studio_version_text="
for /F "skip=1 delims=" %%i in (options.txt) do if not defined visual_studio_version_text set "visual_studio_version_text=%%i"
set "visual_studio_version=%visual_studio_version_text:*^==%"
echo visual_studio_version:%visual_studio_version%

:: get clean_on_build option from options file (3rd line)
set "clean_on_build_text="
for /F "skip=2 delims=" %%i in (options.txt) do if not defined clean_on_build_text set "clean_on_build_text=%%i"
set "clean_on_build=%clean_on_build_text:*^==%"
echo clean_on_build:%clean_on_build%

:: get with_contrib option from options file (4th line)
set "with_contrib_text="
for /F "skip=3 delims=" %%i in (options.txt) do if not defined with_contrib_text set "with_contrib_text=%%i"
set "with_contrib=%with_contrib_text:*^==%"
echo with_contrib:%with_contrib%

:: get with_cuda option from options file (5th line)
set "with_cuda_text="
for /F "skip=4 delims=" %%i in (options.txt) do if not defined with_cuda_text set "with_cuda_text=%%i"
set "with_cuda=%with_cuda_text:*^==%"
echo with_cuda:%with_cuda%

:: get with_examples option from options file (6th line)
set "with_examples_text="
for /F "skip=5 delims=" %%i in (options.txt) do if not defined with_examples_text set "with_examples_text=%%i"
set "with_examples=%with_examples_text:*^==%"
echo with_examples:%with_examples%

:: get build_world option from options file (7th line)
set "build_world_text="
for /F "skip=6 delims=" %%i in (options.txt) do if not defined build_world_text set "build_world_text=%%i"
set "build_world=%build_world_text:*^==%"
echo build_world:%build_world%

:: get with_debug option from options file (8th line)
set "with_debug_text="
for /F "skip=7 delims=" %%i in (options.txt) do if not defined with_debug_text set "with_debug_text=%%i"
set "with_debug=%with_debug_text:*^==%"
echo with_debug:%with_debug%

:: get with_python_release option from options file (9th line)
set "with_python_release_text="
for /F "skip=8 delims=" %%i in (options.txt) do if not defined with_python_release_text set "with_python_release_text=%%i"
set "with_python_release=%with_python_release_text:*^==%"
echo with_python_release:%with_python_release%

:: get with_python_release option from options file (10th line)
set "with_python_debug_text="
for /F "skip=9 delims=" %%i in (options.txt) do if not defined with_python_debug_text set "with_python_debug_text=%%i"
set "with_python_debug=%with_python_debug_text:*^==%"
echo with_python_debug:%with_python_debug%

:: get additional_build_options option from options file (11th line)
set "additional_build_options_text="
for /F "skip=10 delims=" %%i in (options.txt) do if not defined additional_build_options_text set "additional_build_options_text=%%i"
set "additional_build_options=%additional_build_options_text:*^==%"
echo additional_build_options:%additional_build_options%

:: get custom_build_options option from options file (12th line)
set "custom_build_options_text="
for /F "skip=11 delims=" %%i in (options.txt) do if not defined custom_build_options_text set "custom_build_options_text=%%i"
set "custom_build_options=%custom_build_options_text:*^==%"
echo custom_build_options:%custom_build_options%

echo ================

::TODO check valid options set (e.g. with_contib required if with_cuda is true)

:: clean build folder
set build_folder=%cd%\opencv\build
if "%clean_on_build%" == "true" (
  rmdir /Q /S "%build_folder%"
)
:: create build folder
mkdir %build_folder%

if "%custom_build_options%" == "NA" (

  :: empty addition build options if NA
  if "%additional_build_options%" == "NA" (
    set cmake_addition_build_options=""
  )

  :: define build folders
  if "%with_debug%" == "true" (
    set build_release_folder=%build_folder%\release
  ) else (
    set build_release_folder=%build_folder%
  )
  set build_debug_folder=%build_folder%\debug

  if "%with_debug%" == "true" (
    :: create release and debug folders
    mkdir %build_release_folder%
    mkdir %build_debug_folder%
  )

  :: define install folders
  set install_folder=%cd%\install
  if "%with_debug%" == "true" (
    set install_release_folder=%install_folder%\release
  ) else (
    set install_release_folder=%install_folder%
  )
  set install_debug_folder=%install_folder%\debug

  :: clean install folder
  if "%clean_on_build%" == "true" (
    rmdir /Q /S "%install_folder%"
  )
  :: create install folders
  mkdir %install_folder%
  if "%with_debug%" == "true" (
    mkdir %install_release_folder%
    mkdir %install_debug_folder%
  )

  :: define python_release as on/off
  if "%with_python_release%" == "true" (
      set cmake_python_release=ON
  ) else (
      set cmake_python_release=OFF
  )

  :: define python_debug as on/off
  if "%with_python_debug%" == "true" (
      set cmake_python_debug=ON
  ) else (
      set cmake_python_debug=OFF
  )

  :: define build_examples as on/off
  set cmake_build_python_release_examples=OFF
  set cmake_build_python_debug_examples=OFF
  if "%with_examples%" == "true" (
      set cmake_build_examples=ON
      if "%with_python_release%" == "true" (
        set cmake_build_python_release_examples=ON
      )
      if "%with_python_debug%" == "true" (
        set cmake_build_python_debug_examples=ON
      )
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

  :: build opencv release
  cd %build_release_folder%
  cmake -G "%visual_studio_version%" ^
      -D CMAKE_BUILD_TYPE=RELEASE ^
      -D CMAKE_INSTALL_PREFIX=%install_release_folder% ^
      -D BUILD_opencv_world=%cmake_build_world% ^
      -D WITH_CUDA=%cmake_with_cuda% ^
      -D ENABLE_FAST_MATH=%cmake_enable_fast_math% ^
      -D CUDA_FAST_MATH=%cmake_cuda_fast_math% ^
      -D WITH_CUBLAS=%cmake_with_cublas% ^
      -D INSTALL_PYTHON_EXAMPLES=%cmake_build_python_release_examples% ^
      -D OPENCV_EXTRA_MODULES_PATH=%cmake_extra_modules_path% ^
      -D BUILD_opencv_python=%cmake_python_release% ^
      -D BUILD_opencv_python3=%cmake_python_release% ^
      -D BUILD_opencv_python2=%cmake_python_release% ^
      -D BUILD_EXAMPLES=%cmake_build_examples% ^
      %cmake_addition_build_options% ..\..

  if "%with_debug%" == "true" (
    :: build opencv debug
    cd %build_debug_folder%
    cmake -G "%visual_studio_version%" ^
        -D CMAKE_BUILD_TYPE=DEBUG ^
        -D CMAKE_INSTALL_PREFIX=%install_debug_folder% ^
        -D BUILD_opencv_world=%cmake_build_world% ^
        -D WITH_CUDA=%cmake_with_cuda% ^
        -D ENABLE_FAST_MATH=%cmake_enable_fast_math% ^
        -D CUDA_FAST_MATH=%cmake_cuda_fast_math% ^
        -D WITH_CUBLAS=%cmake_with_cublas% ^
        -D INSTALL_PYTHON_EXAMPLES=%cmake_build_python_debug_examples% ^
        -D OPENCV_EXTRA_MODULES_PATH=%cmake_extra_modules_path% ^
        -D BUILD_opencv_python=%cmake_python_debug% ^
        -D BUILD_opencv_python3=%cmake_python_debug% ^
        -D BUILD_opencv_python2=%cmake_python_debug% ^
        -D BUILD_EXAMPLES=%cmake_build_examples% ^
        %cmake_addition_build_options% ..\..
  )

  :: install opencv release
  cd %build_release_folder%
  cmake --build . --config Release --target install

  if "%with_debug%" == "true" (
    :: install opencv debug
    cd %build_debug_folder%
    cmake --build . --config Debug --target install
  )
) else (
  :: build opencv with custom build options
  cmake -G "%visual_studio_version%" %custom_build_options% ..\..
  :: install opencv
  cmake --build . --config Release --target install
)

:: reset working directory
cd %initcwd%

endlocal