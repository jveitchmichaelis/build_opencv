#!/bin/bash
# Seems to work!

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd $SCRIPTPATH/../..

if [ $1 -eq 0 ]; then
    options_filepath=options/options.txt
else
    options_filepath=$1
fi

# # read all lines in options file into array
IFS=$'\n' read -d '' -r -a lines < $options_filepath

echo "================"
echo "Build Options"
echo "================"
# get opencv version from options (1st line)
IFS='=' read -ra options_line <<< "${lines[0]}"
opencv_version=${options_line[1]}
echo "opencv_version:$opencv_version"

# get visual_studio_version option from options file (2nd line)
IFS='=' read -ra options_line <<< "${lines[1]}"
visual_studio_version=${options_line[1]}
echo "visual_studio_version:$visual_studio_version"

# get clean_on_build option from options file (3rd line)
IFS='=' read -ra options_line <<< "${lines[2]}"
clean_on_build=${options_line[1]}
echo "clean_on_build:$clean_on_build"

# get with_contrib option from options file (4th line)
IFS='=' read -ra options_line <<< "${lines[3]}"
with_contrib=${options_line[1]}
echo "with_contrib:$with_contrib"

# get with_cuda option from options file (5th line)
IFS='=' read -ra options_line <<< "${lines[4]}"
with_cuda=${options_line[1]}
echo "with_cuda:$with_cuda"

# get with_examples option from options file (6th line)
IFS='=' read -ra options_line <<< "${lines[5]}"
with_examples=${options_line[1]}
echo "with_examples:$with_examples"

# get build_world option from options file (7th line)
IFS='=' read -ra options_line <<< "${lines[6]}"
build_world=${options_line[1]}
echo "build_world:$build_world"

# get with_debug option from options file (8th line)
IFS='=' read -ra options_line <<< "${lines[7]}"
with_debug=${options_line[1]}
echo "with_debug:$with_debug"

# get with_python_release option from options file (9th line)
IFS='=' read -ra options_line <<< "${lines[8]}"
with_python_release=${options_line[1]}
echo "with_python_release:$with_python_release"

# get with_python_release option from options file (10th line)
IFS='=' read -ra options_line <<< "${lines[9]}"
with_python_release=${options_line[1]}
echo "with_python_release:$with_python_release"

# get additional_build_options option from options file (11th line)
IFS='=' read -ra options_line <<< "${lines[10]}"
additional_build_options=""
i=0
for val in "${options_line[@]}";
do
    if [ "$i" -gt "0" ]; then
        if [ "$i" -eq "1" ]; then
            additional_build_options="$val"
        else
            additional_build_options="$additional_build_options=$val"
        fi
    fi
    i=$(($i + 1))
done
echo "additional_build_options:$additional_build_options"

# get custom_build_options option from options file (12th line)
IFS='=' read -ra options_line <<< "${lines[11]}"
custom_build_options=""
i=0
for val in "${options_line[@]}";
do
    if [ "$i" -gt "0" ]; then
        if [ "$i" -eq "1" ]; then
            custom_build_options="$val"
        else
            custom_build_options="$custom_build_options=$val"
        fi
    fi
    i=$(($i + 1))
done
echo "custom_build_options:$custom_build_options"

echo "================"

#TODO check valid options set (e.g. with_contib required if with_cuda is true)

# clean build folder
build_folder=$PWD/opencv/build
if [ "$clean_on_build" = "true" ]; then
  rm -rf $build_folder
fi
# create build folder
mkdir -p $build_folder

if [ "$custom_build_options" == "NA" ]; then
    # empty addition build options if NA
    if [ "$additional_build_options" == "NA" ]; then
        cmake_addition_build_options=""
    else
        cmake_addition_build_options=$additional_build_options
    fi

    # define build folders
    build_release_folder=$build_folder
    
    if [ "$with_debug" == "true" ]; then
        build_release_folder=$build_folder/release
    fi
    build_debug_folder=$build_folder/debug

    if [ "$with_debug" == "true" ]; then
        # create release and debug folders
        mkdir -p $build_release_folder
        mkdir -p $build_debug_folder
    fi

    # define install folders
    install_folder=$PWD/install
    install_release_folder=$install_folder
    if [ "$with_debug" == "true" ]; then
        install_release_folder=$install_folder/release
    fi
    install_debug_folder=$install_folder/debug

    # clean install folder
    if [ "$clean_on_build" == "true" ]; then
        rm -rf $install_folder
    fi
    # create install folders
    mkdir -p $install_folder
    if [ "$with_debug" == "true" ]; then
        mkdir -p $install_release_folder
        mkdir -p $install_debug_folder
    fi

    # define python_release as on/off
    if [ "$with_python_release" == "true" ]; then
        cmake_python_release=ON
    else
        cmake_python_release=OFF
    fi

    #: define python_debug as on/off
    if [ "$with_python_debug" == "true" ]; then
        cmake_python_debug=ON
    else
        cmake_python_debug=OFF
    fi

    # define build_examples as on/off
    cmake_build_python_release_examples=OFF
    cmake_build_python_debug_examples=OFF
    if "$with_examples" == "true" ]; then
        cmake_build_examples=ON
        if "$with_python_release" == "true" ]; then
            cmake_build_python_release_examples=ON
        fi
        if "$with_python_debug" == "true" ]; then
            cmake_build_python_debug_examples=ON
        fi
    else
        cmake_build_examples=OFF
    fi

    # define build_world as on/off
    if "$build_world" == "true" ]; then
        cmake_build_world=ON
    else
        cmake_build_world=OFF
    fi

    # define contrib only options
    if "$with_contrib" == "true" ]; then
        cmake_extra_modules_path=$PWD/opencv_contrib/modules
    else
        cmake_extra_modules_path=""
    fi

    # define cuda only options
    if "$with_cuda" == "true" ]; then
        cmake_with_cuda=ON
        cmake_enable_fast_math=0
        cmake_cuda_fast_math=1
        cmake_with_cublas=1
    else
        cmake_with_cuda=OFF
        cmake_enable_fast_math=0
        cmake_cuda_fast_math=0
        cmake_with_cublas=0
    fi

    # install deps
    export DEBIAN_FRONTEND=noninteractive
    sudo apt-get install -y --no-install-recommends libjpeg-dev libtiff-dev libpng-dev
    sudo apt-get install -y --no-install-recommends libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
    sudo apt-get install -y --no-install-recommends libxvidcore-dev libx264-dev
    sudo apt-get install -y --no-install-recommends libgtk-3-dev
    sudo apt-get install -y --no-install-recommends build-essential cmake pkg-config
    sudo apt-get install -y --no-install-recommends libatlas-base-dev gfortran

    # build opencv release
    cd $build_release_folder

    cmake \
      -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=$install_release_folder \
      -D BUILD_opencv_world=$cmake_build_world \
      -D WITH_CUDA=$cmake_with_cuda \
      -D ENABLE_FAST_MATH=$cmake_enable_fast_math \
      -D CUDA_FAST_MATH=$cmake_cuda_fast_math \
      -D WITH_CUBLAS=$cmake_with_cublas \
      -D WITH_FFMPEG=1 \
      -D INSTALL_PYTHON_EXAMPLES=$cmake_build_python_release_examples \
      -D OPENCV_EXTRA_MODULES_PATH=$cmake_extra_modules_path \
      -D BUILD_opencv_python=$cmake_python_release \
      -D BUILD_opencv_python3=$cmake_python_release \
      -D BUILD_opencv_python2=$cmake_python_release \
      -D BUILD_EXAMPLES=$cmake_build_examples \
      $cmake_addition_build_options ../..

    if [ "$with_debug" == "true" ]; then
        # build opencv debug
        cd $build_debug_folder
        cmake \
            -D CMAKE_BUILD_TYPE=DEBUG \
            -D CMAKE_INSTALL_PREFIX=$install_debug_folder \
            -D BUILD_opencv_world=$cmake_build_world \
            -D WITH_CUDA=$cmake_with_cuda \
            -D ENABLE_FAST_MATH=$cmake_enable_fast_math \
            -D CUDA_FAST_MATH=$cmake_cuda_fast_math \
            -D WITH_CUBLAS=$cmake_with_cublas \
            -D WITH_FFMPEG=1 \
            -D INSTALL_PYTHON_EXAMPLES=$cmake_build_python_debug_examples \
            -D OPENCV_EXTRA_MODULES_PATH=$cmake_extra_modules_path \
            -D BUILD_opencv_python=$cmake_python_debug \
            -D BUILD_opencv_python3=$cmake_python_debug \
            -D BUILD_opencv_python2=$cmake_python_debug \
            -D BUILD_EXAMPLES=$cmake_build_examples \
            $cmake_addition_build_options ../..
    fi

    if "$with_cuda" == "true" ]; then
        export CUDNN_LIBRARY=/usr/local/cuda-12/lib64
    fi

    # install opencv release
    cd $build_release_folder
    make -j$((`nproc`+1)) 
    make install

    if [ "$with_debug" == "true" ]; then
        # install opencv debug
        cd $build_debug_folder
        make -j$((`nproc`+1))
        make install
    fi
else
    # build opencv with custom build options
    cmake $custom_build_options% ../..
    # install opencv
    make -j$((`nproc`+1))
    make install
fi
