#!/bin/bash
# DO NOT USE
# WORK IN PROGRESS

# read all lines in options file into array
mapfile -t options_array < options.txt

# get opencv version from options (1st line)
IFS='='
read -a opencv_version_arr <<< "$options_array[0]"
opencv_version=$opencv_version_arr[1]

#git clone https://github.com/opencv/opencv.git
#git clone https://github.com/opencv/opencv_contrib.git