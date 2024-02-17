# Build OpenCV
[![Build Ubuntu/CUDA](https://github.com/jveitchmichaelis/build_opencv/actions/workflows/build-cuda-options.yml/badge.svg?branch=auto_release)](https://github.com/jveitchmichaelis/build_opencv/actions/workflows/build-cuda-options.yml)
[![Build Ubuntu](https://github.com/jveitchmichaelis/build_opencv/actions/workflows/build-options.yml/badge.svg?branch=auto_release)](https://github.com/jveitchmichaelis/build_opencv/actions/workflows/build-options.yml)

Easy build OpenCV.

## Releases
To save you some time checkout if the pre-built opencv binaries in releases of this repo for the configuration you are looking for first! [Releases](https://github.com/i3drobotics/build_opencv/releases)

## About
Scripts are provided in this repository to make building opencv from source simple and pain free.
While a lot of the options provided here are the same as running cmake this approach helps to avoid missing to tick an important box or getting a path wrong by providing options in an easy to read text file. Also each option is documented in this readme along with some notes on possible issues associated with it.

## Requirements
 - git
 - cmake
 - visual studio

## Run
Use the 'run.bat' script to download and build opencv. One script does everything!. This will use the options defined in 'options.txt' to define what to download and build. Once complete a folder named 'install' will have the full opencv install. 

## Download
Use the 'download.bat' script to download opencv. This will use the options defined in 'options.txt' to define what to download. Once complete opencv (and opencv_contrib if required) will be downloaded and ready to build.

## Build
Use the 'build.bat' script to build opencv. This will use the options defined in 'options.txt' to define what to build. Once complete a folder named 'install' will have the full opencv install. 

## Options
Choose the options for the build by editing the 'options.txt' text file.  
The order of the options in the text file is important so make sure not to move them around. A more advanced text file reading system will be added in future to prevent this. 
### opencv_version [version]
Opencv version to use (MUST be full verson e.g. '3.4.11' NOT '3.4')
### visual_studio_version [cmake generator]
Visual Studio version to use. (MUST be full cmake generator description used for cmake build e.g. 'Visual Studio 15 2017 Win64' see [here](https://cmake.org/cmake/help/v2.8.8/cmake.html#section_Generators) for details).
### clean_on_build [true/false]
If build and install folders will be wiped before building. Most of the time it's best to set this to true. However, if a build is interrupted it can be useful to be able to disable this to resume a build. (MUST be 'true' or 'false')
### with_contrib [true/false]
If opencv's additional modules (opencv_contrib) package should be used (MUST be 'true' or 'false')  
*Note: You cannot build opencv_world if you are using contrib modules.*
### with_cuda [true/false]
If opencv should be built with CUDA (MUST be 'true' or 'false')  
*Note: This will dramatically increase build time. NVCC builds take a long time.*
*Note: You cannot build with cuda without enabling 'with_contrib'.*
### with_examples [true/false]
If opencv should be built with examples (MUST be 'true' or 'false')
### build_world [true/false]
If opencv should build opencv_world library or individual libraries (MUST be 'true' or 'false')  
*Note: You cannot build opencv_world if you are using contrib modules.*
### with_debug [true/false]
If opencv should build debug libraries. If 'with_debug' is set 'true' then two folders will be present in the install and build results. One for release and one for debug.
*Note: This will more than double build times*  
*Note: Python is usually turned off for debug build as python doesn't ship with debug dll by default. (Change with_python_debug to 'true' to enable.)*
### with_python_release [true/false]
If opencv release build should be built with python. (MUST be 'true' or 'false')  
*Note: The python version will automatically be selected from whatever is installed. This is handelled internally by the opencv cmake.
### with_python_debug [true/false]
If opencv release build should be built with python. (MUST be 'true' or 'false')  
*Note: Python is usually turned off for debug build as python doesn't ship with debug dll by default.*  
*Note: The python version will automatically be selected from whatever is installed. This is handelled internally by the opencv cmake.
### additional_build_options [cmake build options]
Should you require additional build options you can specify them here.
Check section on 'OpenCV options used' to make sure your build options do not collide with options already being used. Options will be added to both release and debug if debug is enabled. Build options can contain multiple options but should be a single line and should be standard cmake format:
```
...
custom_build_options$=-D BUILD_opencv_dnn=OFF
...
```
When this options not used, this should be 'NA'. 
### custom_build [cmake build options] (COMING SOON)
Should you require a completely custom build and want to override all options you can use this option. This will ignore all previously defined options (other than the 'opencv_version' and 'visual_studio_version'). Build options can contain multiple options but should be a single line and should be standard cmake format:
```
custom_build_options$=-D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX="C:/Program Files (x86)/opencv" -D WITH_CUDA=ON -D WITH_CUBLAS=OFF
```

## FAQ
### Why is python not included in debug build by default
As python does not include debug dlls by default when installed a debug build of opencv cannot include python by default. For this reason, this script has the 'with_python_debug' set to 'false' by default.
### What version of python is used in opencv builds
The python version will automatically be selected from whatever is installed. This is handelled internally by the opencv cmake. 
### What version of CUDA is used in opencv builds
CUDA version is selected automically based on whatever is installed. This is handelled insternally by the opencv cmake.
### Can this be used with other OS
All the scripts in the repository are currently Windows batch files. This will be extended to other languages soon. Work has been started on linux scripts however they are not currently ready to use. (Checkout scripts/linux to see the current progress)
### Where is java
I currently have no need to include java and don't have time to explore this build option. If you would like to develop this and send a push request, feel free! 
### Build is taking a long time
OpenCV can take a few hours to build, especially if building extra modules, CUDA or debug. If a build need to be interrupted and continued later, you can press CTRL+C to cancel the build. To resume the build at a later date make sure you set 'clean_on_build' to 'false'. 

## Future improvements
 - [ ] Custom build options
 - [ ] Check combinations of build options for valid selection (e.g. with_contib required if with_cuda is true)
 - [ ] Replace ugly '$=' with '=' in options file
 - [ ] Add Linux support
 - [ ] Add static library support
 - [ ] Add Mac support
 - [ ] Add Java support

## OpenCV options used
The following list is the cmake options used by this repo. If you want to change options not listed here then use additional_build_options in options file. 
 - [x] CMAKE_BUILD_TYPE
 - [x] CMAKE_INSTALL_PREFIX
 - [x] BUILD_opencv_world
 - [x] OPENCV_EXTRA_MODULES_PATH
 - [x] WITH_CUDA
 - [x] ENABLE_FAST_MATH
 - [x] CUDA_FAST_MATH
 - [x] WITH_CUBLAS
 - [x] BUILD_opencv_python
 - [x] BUILD_opencv_python3
 - [x] BUILD_opencv_python2
 - [x] INSTALL_PYTHON_EXAMPLES
 - [x] BUILD_EXAMPLES