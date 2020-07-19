# CMake Options for OpenCV 3.4.11
The following list was taken from OpenCV v3.4.11 by running the command:
```
cmake -LAH
```
## Options
```
// Path to a program.
ANT_EXECUTABLE:FILEPATH=ANT_EXECUTABLE-NOTFOUND

// Path to a library.
BLAS_Accelerate_LIBRARY:FILEPATH=BLAS_Accelerate_LIBRARY-NOTFOUND

// Path to a library.
BLAS_acml_LIBRARY:FILEPATH=BLAS_acml_LIBRARY-NOTFOUND

// Path to a library.
BLAS_acml_mp_LIBRARY:FILEPATH=BLAS_acml_mp_LIBRARY-NOTFOUND

// Path to a library.
BLAS_blas_LIBRARY:FILEPATH=BLAS_blas_LIBRARY-NOTFOUND

// Path to a library.
BLAS_blis_LIBRARY:FILEPATH=BLAS_blis_LIBRARY-NOTFOUND

// Path to a library.
BLAS_complib.sgimath_LIBRARY:FILEPATH=BLAS_complib.sgimath_LIBRARY-NOTFOUND

// Path to a library.
BLAS_cxml_LIBRARY:FILEPATH=BLAS_cxml_LIBRARY-NOTFOUND

// Path to a library.
BLAS_dxml_LIBRARY:FILEPATH=BLAS_dxml_LIBRARY-NOTFOUND

// Path to a library.
BLAS_essl_LIBRARY:FILEPATH=BLAS_essl_LIBRARY-NOTFOUND

// Path to a library.
BLAS_goto2_LIBRARY:FILEPATH=BLAS_goto2_LIBRARY-NOTFOUND

// Path to a library.
BLAS_mkl_intel_c_LIBRARY:FILEPATH=BLAS_mkl_intel_c_LIBRARY-NOTFOUND

// Path to a library.
BLAS_mkl_intel_lp64_LIBRARY:FILEPATH=BLAS_mkl_intel_lp64_LIBRARY-NOTFOUND

// Path to a library.
BLAS_mkl_rt_LIBRARY:FILEPATH=BLAS_mkl_rt_LIBRARY-NOTFOUND

// Path to a library.
BLAS_openblas_LIBRARY:FILEPATH=BLAS_openblas_LIBRARY-NOTFOUND

// Path to a library.
BLAS_scsl_LIBRARY:FILEPATH=BLAS_scsl_LIBRARY-NOTFOUND

// Path to a library.
BLAS_sgemm_LIBRARY:FILEPATH=BLAS_sgemm_LIBRARY-NOTFOUND

// Path to a library.
BLAS_sunperf_LIBRARY:FILEPATH=BLAS_sunperf_LIBRARY-NOTFOUND

// Path to a library.
BLAS_vecLib_LIBRARY:FILEPATH=BLAS_vecLib_LIBRARY-NOTFOUND

// Build CUDA modules stubs when no CUDA SDK
BUILD_CUDA_STUBS:BOOL=OFF

// Create build rules for OpenCV Documentation
BUILD_DOCS:BOOL=OFF

// Build all examples
BUILD_EXAMPLES:BOOL=OFF

// Build IPP IW from source
BUILD_IPP_IW:BOOL=ON

// Build Intel ITT from source
BUILD_ITT:BOOL=ON

// Build libjasper from source
BUILD_JASPER:BOOL=ON

// Enable Java support
BUILD_JAVA:BOOL=ON

// Build libjpeg from source
BUILD_JPEG:BOOL=ON

// Build only listed modules (comma-separated, e.g. 'videoio,dnn,ts')
BUILD_LIST:STRING=

// Build openexr from source
BUILD_OPENEXR:BOOL=ON

// Enables 'make package_source' command
BUILD_PACKAGE:BOOL=ON

// Build performance tests
BUILD_PERF_TESTS:BOOL=ON

// Build libpng from source
BUILD_PNG:BOOL=ON

// Force to build libprotobuf runtime from sources
BUILD_PROTOBUF:BOOL=ON

// Build shared libraries (.dll/.so) instead of static ones (.lib/.a)
BUILD_SHARED_LIBS:BOOL=ON

// Download and build TBB from source
BUILD_TBB:BOOL=OFF

// Build accuracy & regression tests
BUILD_TESTS:BOOL=ON

// Build libtiff from source
BUILD_TIFF:BOOL=ON

// Use symlinks instead of files copying during build (and !!INSTALL!!)
BUILD_USE_SYMLINKS:BOOL=OFF

// Build WebP from source
BUILD_WEBP:BOOL=ON

// Include debug info into release binaries ('OFF' means default settings)
BUILD_WITH_DEBUG_INFO:BOOL=OFF

// Enables dynamic linking of IPP (only for standalone IPP)
BUILD_WITH_DYNAMIC_IPP:BOOL=OFF

// Enables use of statically linked CRT for statically linked OpenCV
BUILD_WITH_STATIC_CRT:BOOL=ON

// Build zlib from source
BUILD_ZLIB:BOOL=ON

// Build utility applications (used for example to train classifiers)
BUILD_opencv_apps:BOOL=ON

// Include opencv_calib3d module into the OpenCV build
BUILD_opencv_calib3d:BOOL=ON

// Include opencv_core module into the OpenCV build
BUILD_opencv_core:BOOL=ON

// Include opencv_dnn module into the OpenCV build
BUILD_opencv_dnn:BOOL=ON

// Include opencv_features2d module into the OpenCV build
BUILD_opencv_features2d:BOOL=ON

// Include opencv_flann module into the OpenCV build
BUILD_opencv_flann:BOOL=ON

// Include opencv_highgui module into the OpenCV build
BUILD_opencv_highgui:BOOL=ON

// Include opencv_imgcodecs module into the OpenCV build
BUILD_opencv_imgcodecs:BOOL=ON

// Include opencv_imgproc module into the OpenCV build
BUILD_opencv_imgproc:BOOL=ON

// Include opencv_java_bindings_generator module into the OpenCV build
BUILD_opencv_java_bindings_generator:BOOL=ON

// Build JavaScript bindings by Emscripten
BUILD_opencv_js:BOOL=OFF

// Include opencv_ml module into the OpenCV build
BUILD_opencv_ml:BOOL=ON

// Include opencv_objdetect module into the OpenCV build
BUILD_opencv_objdetect:BOOL=ON

// Include opencv_photo module into the OpenCV build
BUILD_opencv_photo:BOOL=ON

// Include opencv_python3 module into the OpenCV build
BUILD_opencv_python3:BOOL=ON

// Include opencv_python_bindings_generator module into the OpenCV build
BUILD_opencv_python_bindings_generator:BOOL=ON

// Include opencv_python_tests module into the OpenCV build
BUILD_opencv_python_tests:BOOL=ON

// Include opencv_shape module into the OpenCV build
BUILD_opencv_shape:BOOL=ON

// Include opencv_stitching module into the OpenCV build
BUILD_opencv_stitching:BOOL=ON

// Include opencv_superres module into the OpenCV build
BUILD_opencv_superres:BOOL=ON

// Include opencv_ts module into the OpenCV build
BUILD_opencv_ts:BOOL=ON

// Include opencv_video module into the OpenCV build
BUILD_opencv_video:BOOL=ON

// Include opencv_videoio module into the OpenCV build
BUILD_opencv_videoio:BOOL=ON

// Include opencv_videostab module into the OpenCV build
BUILD_opencv_videostab:BOOL=ON

// Include opencv_world module into the OpenCV build
BUILD_opencv_world:BOOL=OFF

// clAmdFft include directory
CLAMDBLAS_INCLUDE_DIR:PATH=CLAMDBLAS_INCLUDE_DIR-NOTFOUND

// AMD FFT root directory
CLAMDBLAS_ROOT_DIR:PATH=CLAMDBLAS_ROOT_DIR-NOTFOUND

// clAmdFft include directory
CLAMDFFT_INCLUDE_DIR:PATH=CLAMDFFT_INCLUDE_DIR-NOTFOUND

// AMD FFT root directory
CLAMDFFT_ROOT_DIR:PATH=CLAMDFFT_ROOT_DIR-NOTFOUND

// Configs
CMAKE_CONFIGURATION_TYPES:STRING=Debug;Release

// Flags used by the CXX compiler during all build types.
CMAKE_CXX_FLAGS:STRING=/DWIN32 /D_WINDOWS /W3 /GR /EHsc

// Flags used by the CXX compiler during DEBUG builds.
CMAKE_CXX_FLAGS_DEBUG:STRING=/MDd /Zi /Ob0 /Od /RTC1

// Flags used by the CXX compiler during MINSIZEREL builds.
CMAKE_CXX_FLAGS_MINSIZEREL:STRING=/MD /O1 /Ob1 /DNDEBUG

// Flags used by the CXX compiler during RELEASE builds.
CMAKE_CXX_FLAGS_RELEASE:STRING=/MD /O2 /Ob2 /DNDEBUG

// Flags used by the CXX compiler during RELWITHDEBINFO builds.
CMAKE_CXX_FLAGS_RELWITHDEBINFO:STRING=/MD /Zi /O2 /Ob1 /DNDEBUG

// Libraries linked by default with all C++ applications.
CMAKE_CXX_STANDARD_LIBRARIES:STRING=kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib

// Flags used by the C compiler during all build types.
CMAKE_C_FLAGS:STRING=/DWIN32 /D_WINDOWS /W3

// Flags used by the C compiler during DEBUG builds.
CMAKE_C_FLAGS_DEBUG:STRING=/MDd /Zi /Ob0 /Od /RTC1

// Flags used by the C compiler during MINSIZEREL builds.
CMAKE_C_FLAGS_MINSIZEREL:STRING=/MD /O1 /Ob1 /DNDEBUG

// Flags used by the C compiler during RELEASE builds.
CMAKE_C_FLAGS_RELEASE:STRING=/MD /O2 /Ob2 /DNDEBUG

// Flags used by the C compiler during RELWITHDEBINFO builds.
CMAKE_C_FLAGS_RELWITHDEBINFO:STRING=/MD /Zi /O2 /Ob1 /DNDEBUG

// Libraries linked by default with all C applications.
CMAKE_C_STANDARD_LIBRARIES:STRING=kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib

// Flags used by the linker during all build types.
CMAKE_EXE_LINKER_FLAGS:STRING=/machine:x64

// Flags used by the linker during DEBUG builds.
CMAKE_EXE_LINKER_FLAGS_DEBUG:STRING=/debug /INCREMENTAL

// Flags used by the linker during MINSIZEREL builds.
CMAKE_EXE_LINKER_FLAGS_MINSIZEREL:STRING=/INCREMENTAL:NO

// Flags used by the linker during RELEASE builds.
CMAKE_EXE_LINKER_FLAGS_RELEASE:STRING=/INCREMENTAL:NO

// Flags used by the linker during RELWITHDEBINFO builds.
CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO:STRING=/debug /INCREMENTAL

// Installation Directory
CMAKE_INSTALL_PREFIX:PATH=C:/Code/build_opencv/opencv/build/install

// Path to a program.
CMAKE_LINKER:FILEPATH=C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/VC/Tools/MSVC/14.26.28801/bin/Hostx64/x64/link.exe

// Flags used by the linker during the creation of modules during all build types.
CMAKE_MODULE_LINKER_FLAGS:STRING=/machine:x64

// Flags used by the linker during the creation of modules during DEBUG builds.
CMAKE_MODULE_LINKER_FLAGS_DEBUG:STRING=/debug /INCREMENTAL

// Flags used by the linker during the creation of modules during MINSIZEREL builds.
CMAKE_MODULE_LINKER_FLAGS_MINSIZEREL:STRING=/INCREMENTAL:NO

// Flags used by the linker during the creation of modules during RELEASE builds.
CMAKE_MODULE_LINKER_FLAGS_RELEASE:STRING=/INCREMENTAL:NO

// Flags used by the linker during the creation of modules during RELWITHDEBINFO builds.
CMAKE_MODULE_LINKER_FLAGS_RELWITHDEBINFO:STRING=/debug /INCREMENTAL

// Path to a program.
CMAKE_MT:FILEPATH=C:/Program Files (x86)/Windows Kits/10/bin/10.0.17763.0/x64/mt.exe

// RC compiler
CMAKE_RC_COMPILER:FILEPATH=C:/Program Files (x86)/Windows Kits/10/bin/10.0.17763.0/x64/rc.exe

// Flags for Windows Resource Compiler during all build types.
CMAKE_RC_FLAGS:STRING=-DWIN32

// Flags for Windows Resource Compiler during DEBUG builds.
CMAKE_RC_FLAGS_DEBUG:STRING=-D_DEBUG

// Flags for Windows Resource Compiler during MINSIZEREL builds.
CMAKE_RC_FLAGS_MINSIZEREL:STRING=

// Flags for Windows Resource Compiler during RELEASE builds.
CMAKE_RC_FLAGS_RELEASE:STRING=

// Flags for Windows Resource Compiler during RELWITHDEBINFO builds.
CMAKE_RC_FLAGS_RELWITHDEBINFO:STRING=

// Flags used by the linker during the creation of shared libraries during all build types.
CMAKE_SHARED_LINKER_FLAGS:STRING=/machine:x64

// Flags used by the linker during the creation of shared libraries during DEBUG builds.
CMAKE_SHARED_LINKER_FLAGS_DEBUG:STRING=/debug /INCREMENTAL

// Flags used by the linker during the creation of shared libraries during MINSIZEREL builds.
CMAKE_SHARED_LINKER_FLAGS_MINSIZEREL:STRING=/INCREMENTAL:NO

// Flags used by the linker during the creation of shared libraries during RELEASE builds.
CMAKE_SHARED_LINKER_FLAGS_RELEASE:STRING=/INCREMENTAL:NO

// Flags used by the linker during the creation of shared libraries during RELWITHDEBINFO builds.
CMAKE_SHARED_LINKER_FLAGS_RELWITHDEBINFO:STRING=/debug /INCREMENTAL

// If set, runtime paths are not added when installing shared libraries, but are added when building.
CMAKE_SKIP_INSTALL_RPATH:BOOL=NO

// If set, runtime paths are not added when using shared libraries.
CMAKE_SKIP_RPATH:BOOL=NO

// Flags used by the linker during the creation of static libraries during all build types.
CMAKE_STATIC_LINKER_FLAGS:STRING=/machine:x64

// Flags used by the linker during the creation of static libraries during DEBUG builds.
CMAKE_STATIC_LINKER_FLAGS_DEBUG:STRING=

// Flags used by the linker during the creation of static libraries during MINSIZEREL builds.
CMAKE_STATIC_LINKER_FLAGS_MINSIZEREL:STRING=

// Flags used by the linker during the creation of static libraries during RELEASE builds.
CMAKE_STATIC_LINKER_FLAGS_RELEASE:STRING=

// Flags used by the linker during the creation of static libraries during RELWITHDEBINFO builds.
CMAKE_STATIC_LINKER_FLAGS_RELWITHDEBINFO:STRING=

// If this value is on, makefiles will be generated without the .SILENT directive, and all commands will be echoed to the console during the make.  This is useful for debugging only. With Visual Studio IDE projects all commands are done without /nologo.
CMAKE_VERBOSE_MAKEFILE:BOOL=FALSE

// Enable to build 7-Zip packages
CPACK_BINARY_7Z:BOOL=OFF

// Enable to build IFW packages
CPACK_BINARY_IFW:BOOL=OFF

// Enable to build NSIS packages
CPACK_BINARY_NSIS:BOOL=ON

// Enable to build NuGet packages
CPACK_BINARY_NUGET:BOOL=OFF

// Enable to build WiX packages
CPACK_BINARY_WIX:BOOL=OFF

// Enable to build ZIP packages
CPACK_BINARY_ZIP:BOOL=OFF

// Enable to build 7-Zip source packages
CPACK_SOURCE_7Z:BOOL=ON

// Enable to build ZIP source packages
CPACK_SOURCE_ZIP:BOOL=ON

// Specify list of enabled baseline CPU optimizations
CPU_BASELINE:STRING=SSE3

// Specify list of dispatched CPU optimizations
CPU_DISPATCH:STRING=SSE4_1;SSE4_2;AVX;FP16;AVX2;AVX512_SKX

// Disable explicit optimized code (dispatched code/intrinsics/loop unrolling/etc)
CV_DISABLE_OPTIMIZATION:BOOL=OFF

// Use intrinsic-based optimized code
CV_ENABLE_INTRINSICS:BOOL=ON

// Enable OpenCV code trace
CV_TRACE:BOOL=ON

// The path to Eigen3/Eigen2 headers
EIGEN_INCLUDE_PATH:PATH=EIGEN_INCLUDE_PATH-NOTFOUND

// Enable hardening of the resulting binaries (against security attacks, detects memory corruption, etc)
ENABLE_BUILD_HARDENING:BOOL=OFF

// Use ccache
ENABLE_CCACHE:BOOL=OFF

// Fail build if actual configuration doesn't match requested (WITH_XXX != HAVE_XXX)
ENABLE_CONFIG_VERIFICATION:BOOL=OFF

// Enable C++11 compilation mode
ENABLE_CXX11:BOOL=OFF

// Enable compiler options for fast math optimizations on FP computations (not recommended)
ENABLE_FAST_MATH:BOOL=OFF

// Add target with Python flake8 checker
ENABLE_FLAKE8:BOOL=OFF

// Collect implementation data on function call
ENABLE_IMPL_COLLECTION:BOOL=OFF

// Instrument functions to collect calls trace and performance
ENABLE_INSTRUMENTATION:BOOL=OFF

// Enable Link Time Optimization
ENABLE_LTO:BOOL=OFF

// Show all warnings even if they are too noisy
ENABLE_NOISY_WARNINGS:BOOL=OFF

// Generate position independent code (necessary for shared libraries)
ENABLE_PIC:BOOL=ON

// Use precompiled headers
ENABLE_PRECOMPILED_HEADERS:BOOL=ON

// Add target with Pylint checks
ENABLE_PYLINT:BOOL=OFF

// Solution folder in Visual Studio or in other IDEs
ENABLE_SOLUTION_FOLDERS:BOOL=ON

// Output directory for applications
EXECUTABLE_OUTPUT_PATH:PATH=C:/Code/build_opencv/opencv/build/bin

// The directory containing a CMake configuration file for Eigen3.
Eigen3_DIR:PATH=Eigen3_DIR-NOTFOUND

// Git command line client
GIT_EXECUTABLE:FILEPATH=C:/Program Files/Git/cmd/git.exe

// Glib library
GLIB_LIBRARY:FILEPATH=GLIB_LIBRARY-NOTFOUND

// gstcdda library to link with
GLIB_gstcdda_LIBRARY:FILEPATH=GLIB_gstcdda_LIBRARY-NOTFOUND

// Glib library
GOBJECT_LIBRARY:FILEPATH=GOBJECT_LIBRARY-NOTFOUND

// Directory containing glib.h include file
GSTREAMER_glib_INCLUDE_DIR:PATH=GSTREAMER_glib_INCLUDE_DIR-NOTFOUND

// Directory containing glibconfig.h include file
GSTREAMER_glibconfig_INCLUDE_DIR:PATH=GSTREAMER_glibconfig_INCLUDE_DIR-NOTFOUND

// Directory containing gst/gst.h include file
GSTREAMER_gst_INCLUDE_DIR:PATH=GSTREAMER_gst_INCLUDE_DIR-NOTFOUND

// gstapp library to link with
GSTREAMER_gstapp_LIBRARY:FILEPATH=GSTREAMER_gstapp_LIBRARY-NOTFOUND

// gstaudio library to link with
GSTREAMER_gstaudio_LIBRARY:FILEPATH=GSTREAMER_gstaudio_LIBRARY-NOTFOUND

// gstbase library to link with
GSTREAMER_gstbase_LIBRARY:FILEPATH=GSTREAMER_gstbase_LIBRARY-NOTFOUND

// Directory containing gst/gstconfig.h include file
GSTREAMER_gstconfig_INCLUDE_DIR:PATH=GSTREAMER_gstconfig_INCLUDE_DIR-NOTFOUND

// gstcontroller library to link with
GSTREAMER_gstcontroller_LIBRARY:FILEPATH=GSTREAMER_gstcontroller_LIBRARY-NOTFOUND

// gstnet library to link with
GSTREAMER_gstnet_LIBRARY:FILEPATH=GSTREAMER_gstnet_LIBRARY-NOTFOUND

// gstpbutils library to link with
GSTREAMER_gstpbutils_LIBRARY:FILEPATH=GSTREAMER_gstpbutils_LIBRARY-NOTFOUND

// gstreamer library to link with
GSTREAMER_gstreamer_LIBRARY:FILEPATH=GSTREAMER_gstreamer_LIBRARY-NOTFOUND

// gstriff library to link with
GSTREAMER_gstriff_LIBRARY:FILEPATH=GSTREAMER_gstriff_LIBRARY-NOTFOUND

// gstrtp library to link with
GSTREAMER_gstrtp_LIBRARY:FILEPATH=GSTREAMER_gstrtp_LIBRARY-NOTFOUND

// gstrtsp library to link with
GSTREAMER_gstrtsp_LIBRARY:FILEPATH=GSTREAMER_gstrtsp_LIBRARY-NOTFOUND

// gstsdp library to link with
GSTREAMER_gstsdp_LIBRARY:FILEPATH=GSTREAMER_gstsdp_LIBRARY-NOTFOUND

// gsttag library to link with
GSTREAMER_gsttag_LIBRARY:FILEPATH=GSTREAMER_gsttag_LIBRARY-NOTFOUND

// gstvideo library to link with
GSTREAMER_gstvideo_LIBRARY:FILEPATH=GSTREAMER_gstvideo_LIBRARY-NOTFOUND

// IEEE floating point is available
HAVE_IEEEFP:STRING=1

// Native CPU bit order
HOST_BIG_ENDIAN:STRING=OFF

// Native CPU bit order
HOST_FILLORDER:STRING=FILLORDER_LSB2MSB

// Change install rules to build the distribution package
INSTALL_CREATE_DISTRIB:BOOL=OFF

// Install C examples
INSTALL_C_EXAMPLES:BOOL=OFF

// Add install PDB rules
INSTALL_PDB:BOOL=ON

// Don't install PDB files by default
INSTALL_PDB_COMPONENT_EXCLUDE_FROM_ALL:BOOL=ON

// Install Python examples
INSTALL_PYTHON_EXAMPLES:BOOL=OFF

// Install accuracy and performance test binaries and test data
INSTALL_TESTS:BOOL=OFF

// Path to a file.
JAVA_AWT_INCLUDE_PATH:PATH=C:/Program Files/Unity/Hub/Editor/2019.3.12f1/Editor/Data/PlaybackEngines/AndroidPlayer/OpenJDK/include

// Path to a library.
JAVA_AWT_LIBRARY:FILEPATH=C:/Program Files/Unity/Hub/Editor/2019.3.12f1/Editor/Data/PlaybackEngines/AndroidPlayer/OpenJDK/lib/jawt.lib

// Path to a file.
JAVA_INCLUDE_PATH:PATH=C:/Program Files/Unity/Hub/Editor/2019.3.12f1/Editor/Data/PlaybackEngines/AndroidPlayer/OpenJDK/include

// Path to a file.
JAVA_INCLUDE_PATH2:PATH=C:/Program Files/Unity/Hub/Editor/2019.3.12f1/Editor/Data/PlaybackEngines/AndroidPlayer/OpenJDK/include/win32

// Path to a library.
JAVA_JVM_LIBRARY:FILEPATH=C:/Program Files/Unity/Hub/Editor/2019.3.12f1/Editor/Data/PlaybackEngines/AndroidPlayer/OpenJDK/lib/jvm.lib

// Alternative name of cblas.h
LAPACK_CBLAS_H:STRING=

// Lapack implementation id
LAPACK_IMPL:STRING=Unknown

// Path to BLAS include dir
LAPACK_INCLUDE_DIR:PATH=

// Alternative name of lapacke.h
LAPACK_LAPACKE_H:STRING=

// Names of BLAS & LAPACK binaries (.so, .dll, .a, .lib)
LAPACK_LIBRARIES:STRING=

// Path to MKL include directory
MKL_INCLUDE_DIRS:PATH=MKL_ROOT_DIR-NOTFOUND/include

// Path to a file.
MKL_ROOT_DIR:PATH=MKL_ROOT_DIR-NOTFOUND

// Use MKL with OpenMP multithreading
MKL_WITH_OPENMP:BOOL=OFF

// Use MKL with TBB multithreading
MKL_WITH_TBB:BOOL=OFF

// Path to a library.
M_LIBRARY:FILEPATH=M_LIBRARY-NOTFOUND

// OpenCL library is found
OPENCL_FOUND:BOOL=ON

// OpenCL include directory
OPENCL_INCLUDE_DIR:PATH=C:/Code/build_opencv/opencv/3rdparty/include/opencl/1.2

// OpenCL library
OPENCL_LIBRARY:STRING=

// Value of _WIN32_WINNT macro
OPENCV_CMAKE_MACRO_WIN32_WINNT:STRING=0x0601

// Where to create the platform-dependant cvconfig.h
OPENCV_CONFIG_FILE_INCLUDE_DIR:PATH=C:/Code/build_opencv/opencv/build

// Build with OpenCL support
OPENCV_DNN_OPENCL:BOOL=ON

// Download parameters to be passed to file(DOWNLAOD ...)
OPENCV_DOWNLOAD_PARAMS:STRING=INACTIVITY_TIMEOUT;60;TIMEOUT;600

// Cache directory for downloaded files
OPENCV_DOWNLOAD_PATH:PATH=C:/Code/build_opencv/opencv/.cache

// List of download tries
OPENCV_DOWNLOAD_TRIES_LIST:STRING=1

// Dump called OpenCV hooks
OPENCV_DUMP_HOOKS_FLOW:BOOL=OFF

// Enable Allocator metrics
OPENCV_ENABLE_ALLOCATOR_STATS:BOOL=ON

// Enable C++ compiler support for atomic<long long>
OPENCV_ENABLE_ATOMIC_LONG_LONG:BOOL=ON

// Enable posix_memalign or memalign usage
OPENCV_ENABLE_MEMALIGN:BOOL=ON

// Better support for memory/address sanitizers
OPENCV_ENABLE_MEMORY_SANITIZER:BOOL=OFF

// Enable non-free algorithms
OPENCV_ENABLE_NONFREE:BOOL=OFF

// Where to look for additional OpenCV modules (can be ;-separated list of paths)
OPENCV_EXTRA_MODULES_PATH:PATH=

// Force using 3rdparty code from source
OPENCV_FORCE_3RDPARTY_BUILD:BOOL=OFF

//
OPENCV_FORCE_PYTHON_LIBS:BOOL=OFF

// Generate setup_vars* scripts
OPENCV_GENERATE_SETUPVARS:BOOL=ON

// Enable IPP optimizations for GaussianBlur (+8Mb in binary size)
OPENCV_IPP_GAUSSIAN_BLUR:BOOL=OFF

// Java source version (javac Ant target)
OPENCV_JAVA_SOURCE_VERSION:STRING=

// Java target version (javac Ant target)
OPENCV_JAVA_TARGET_VERSION:STRING=

// URI to a MathJax installation
OPENCV_MATHJAX_RELPATH:STRING=https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.0

// Control MSVC /MP flag
OPENCV_MSVC_PARALLEL:STRING=ON

// Python3 version
OPENCV_PYTHON3_VERSION:BOOL=OFF

// Timestamp of OpenCV build configuration
OPENCV_TIMESTAMP:STRING=2020-07-19T00:24:45Z

// Treat warnings as errors
OPENCV_WARNINGS_ARE_ERRORS:BOOL=OFF

// Path to a file.
OpenBLAS_INCLUDE_DIR:PATH=OpenBLAS_INCLUDE_DIR-NOTFOUND

// Path to a library.
OpenBLAS_LIB:FILEPATH=OpenBLAS_LIB-NOTFOUND

// The directory containing a CMake configuration file for OpenCV_HAL.
OpenCV_HAL_DIR:PATH=OpenCV_HAL_DIR-NOTFOUND

// Force rebuilding .proto files (protoc should be available)
PROTOBUF_UPDATE_FILES:BOOL=OFF

// Path to Python interpreter
PYTHON2_EXECUTABLE:FILEPATH=

// Python include dir
PYTHON2_INCLUDE_DIR:PATH=

// Python include dir 2
PYTHON2_INCLUDE_DIR2:PATH=

// Path to Python library
PYTHON2_LIBRARY:FILEPATH=

// Path to Python debug
PYTHON2_LIBRARY_DEBUG:FILEPATH=

// Path to numpy headers
PYTHON2_NUMPY_INCLUDE_DIRS:PATH=

// Where to install the python packages.
PYTHON2_PACKAGES_PATH:PATH=

// Path to Python interpreter
PYTHON3_EXECUTABLE:FILEPATH=C:/Users/monke/AppData/Local/Programs/Python/Python37/python.exe

// Python include dir
PYTHON3_INCLUDE_DIR:PATH=C:/Users/monke/AppData/Local/Programs/Python/Python37/include

// Python include dir 2
PYTHON3_INCLUDE_DIR2:PATH=

// Path to Python library
PYTHON3_LIBRARY:FILEPATH=C:/Users/monke/AppData/Local/Programs/Python/Python37/libs/python37.lib

// Path to Python debug
PYTHON3_LIBRARY_DEBUG:FILEPATH=PYTHON_DEBUG_LIBRARY-NOTFOUND

// Path to numpy headers
PYTHON3_NUMPY_INCLUDE_DIRS:PATH=C:/Users/monke/AppData/Roaming/Python/Python37/site-packages/numpy/core/include

// Where to install the python packages.
PYTHON3_PACKAGES_PATH:PATH=C:/Users/monke/AppData/Local/Programs/Python/Python37/Lib/site-packages

// Use win32 IO system (Microsoft Windows only)
USE_WIN32_FILEIO:BOOL=TRUE

// The directory containing a CMake configuration file for VTK.
VTK_DIR:PATH=VTK_DIR-NOTFOUND

// Include IEEE1394 support
WITH_1394:BOOL=ON

// Include arithmetic decoding support when emulating the libjpeg v6b API/ABI
WITH_ARITH_DEC:BOOL=ON

// Include arithmetic encoding support when emulating the libjpeg v6b API/ABI
WITH_ARITH_ENC:BOOL=ON

// Include Clp support (EPL)
WITH_CLP:BOOL=OFF

// Include C= support
WITH_CSTRIPES:BOOL=OFF

// Include NVidia Cuda Runtime support
WITH_CUDA:BOOL=OFF

// Include DirectX support
WITH_DIRECTX:BOOL=ON

// Build VideoIO with DirectShow support
WITH_DSHOW:BOOL=ON

// Include Eigen2/Eigen3 support
WITH_EIGEN:BOOL=ON

// Include FFMPEG support
WITH_FFMPEG:BOOL=ON

// Include GDAL Support
WITH_GDAL:BOOL=OFF

// Include DICOM support
WITH_GDCM:BOOL=OFF

// Include Smartek GigE support
WITH_GIGEAPI:BOOL=OFF

// Include Gstreamer support
WITH_GSTREAMER:BOOL=ON

// Enable Gstreamer 0.10 support (instead of 1.x)
WITH_GSTREAMER_0_10:BOOL=OFF

// Include Halide support
WITH_HALIDE:BOOL=OFF

// Include HDR support
WITH_IMGCODEC_HDR:BOOL=ON

// Include PNM (PBM,PGM,PPM) and PAM formats support
WITH_IMGCODEC_PXM:BOOL=ON

// Include SUNRASTER support
WITH_IMGCODEC_SUNRASTER:BOOL=ON

// Include Intel Inference Engine support
WITH_INF_ENGINE:BOOL=OFF

// Include Intel Perceptual Computing support
WITH_INTELPERC:BOOL=OFF

// Include Intel IPP support
WITH_IPP:BOOL=ON

// Include Intel ITT support
WITH_ITT:BOOL=ON

// Include JPEG2K support
WITH_JASPER:BOOL=ON

// Include JPEG support
WITH_JPEG:BOOL=ON

// Include Lapack library support
WITH_LAPACK:BOOL=ON

// Include Intel Media SDK support
WITH_MFX:BOOL=OFF

// Build VideoIO with Media Foundation support
WITH_MSMF:BOOL=ON

// Enable hardware acceleration in Media Foundation backend
WITH_MSMF_DXVA:BOOL=ON

// Include nGraph support
WITH_NGRAPH:BOOL=OFF

// Include OpenCL Runtime support
WITH_OPENCL:BOOL=ON

// Include AMD OpenCL BLAS library support
WITH_OPENCLAMDBLAS:BOOL=ON

// Include AMD OpenCL FFT library support
WITH_OPENCLAMDFFT:BOOL=ON

// Include NVIDIA OpenCL D3D11 support
WITH_OPENCL_D3D11_NV:BOOL=ON

// Include OpenCL Shared Virtual Memory support
WITH_OPENCL_SVM:BOOL=OFF

// Include ILM support via OpenEXR
WITH_OPENEXR:BOOL=ON

// Include OpenGL support
WITH_OPENGL:BOOL=OFF

// Include OpenMP support
WITH_OPENMP:BOOL=OFF

// Include OpenNI support
WITH_OPENNI:BOOL=OFF

// Include OpenNI2 support
WITH_OPENNI2:BOOL=OFF

// Include OpenVX support
WITH_OPENVX:BOOL=OFF

// Include PNG support
WITH_PNG:BOOL=ON

// Enable libprotobuf
WITH_PROTOBUF:BOOL=ON

// Include Prosilica GigE support
WITH_PVAPI:BOOL=OFF

// Build with Qt Backend support
WITH_QT:BOOL=OFF

// Include library QR-code decoding
WITH_QUIRC:BOOL=ON

// Include Intel TBB support
WITH_TBB:BOOL=OFF

// Include TIFF support
WITH_TIFF:BOOL=ON

// Include Video for Windows support (deprecated, consider using MSMF)
WITH_VFW:BOOL=OFF

// Include VTK library support (and build opencv_viz module eiher)
WITH_VTK:BOOL=ON

// Include WebP support
WITH_WEBP:BOOL=ON

// Build with Win32 UI Backend support
WITH_WIN32UI:BOOL=ON

// Include XIMEA cameras support
WITH_XIMEA:BOOL=OFF

// support for CCITT Group 3 & 4 algorithms
ccitt:BOOL=ON

// support for LogLuv high dynamic range algorithm
logluv:BOOL=ON

// support for LZW algorithm
lzw:BOOL=ON

// support for Microsoft Document Imaging
mdi:BOOL=ON

// support for NeXT 2-bit RLE algorithm
next:BOOL=ON

// support for Old JPEG compression (read-only)
old-jpeg:BOOL=OFF

// Add performance tests of Caffe framework
opencv_dnn_PERF_CAFFE:BOOL=OFF

// Add performance tests of clCaffe framework
opencv_dnn_PERF_CLCAFFE:BOOL=OFF

// support for Macintosh PackBits algorithm
packbits:BOOL=ON

// support for ThunderScan 4-bit RLE algorithm
thunder:BOOL=ON
```