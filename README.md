# Build OpenCV
Easy build OpenCV on Windows. Scripts are provided in this repository to make downloading and installing opencv simple and pain free. 

## Requirements
 - git
 - cmake
 - visual studio

## Compatiblity
Tested build with
 - Visual Studio 15 2017 Win64

## Options
Choose the options for the build by editing the 'options.txt' text file
### opencv_version
Opencv version to use (MUST be full verson e.g. '3.4.11' NOT '3.4')
### with_contrib
If opencv's additional modules (opencv_contrib) package should be used (MUST be 'true' or 'false')  
*Note: You cannot build opencv_world if you are using contrib modules.*
### with_cuda
If opencv should be built with CUDA (MUST be 'true' or 'false')  
*Note: You cannot build with cuda without enabling 'with_contrib'.*  
### with_examples
If opencv should be build with examples (MUST be 'true' or 'false')
### build_world
If opencv should build opencv_world library or individual libraries (MUST be 'true' or 'false')  
*Note: You cannot build opencv_world if you are using contrib modules.*
### with_debug
If opencv should build debug libraries (MUST be 'true' or 'false')
*Note: This will more than double build times*
### visual_studio_version
Visual Studio version to use (MUST be full description used for cmake build e.g. 'Visual Studio 15 2017 Win64')

## Run
Use the 'run.bat' script to download and build opencv. This will use the options defined in 'options.txt' to define what to download and build.

## Download
Use the 'download.bat' script to download opencv. This will use the options defined in 'options.txt' to define what to download.

## Build
Use the 'build.bat' script to build opencv. This will use the options defined in 'options.txt' to define what to build.