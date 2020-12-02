#!/bin/bash
# DO NOT USE
# WORK IN PROGRESS

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd $SCRIPTPATH/../..

# # read all lines in options file into array
IFS=$'\n' read -d '' -r -a lines < options.txt

echo "================"
echo "Download Options"
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

# download opencv repo
git clone https://github.com/opencv/opencv.git
if [ "$with_contrib" = "true" ]; then
    # download opencv_contrib repo
    git clone https://github.com/opencv/opencv_contrib.git
fi

# checkout specific opencv version
cd opencv
git checkout tags/$opencv_version
# reset working directory
cd ..

if [ "$with_contrib" = "true" ]; then
    # checkout specific opencv_contrib version
    cd opencv_contrib
    git checkout tags/$opencv_version
    # reset working directory
    cd ..
fi