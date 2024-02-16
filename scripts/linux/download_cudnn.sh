#!/bin/bash

# Ensure the script is run with superuser privileges
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Tested inside Docker with very sparse images, where wget etc may not be installed
apt-get update
apt-get install -y lsb-release wget linux-headers-generic

# Automatically detect the distribution and architecture
distro=$(lsb_release -si | tr '[:upper:]' '[:lower:]')$(lsb_release -sr | tr -d '.')
raw_arch=$(dpkg --print-architecture)
if [ "$raw_arch" == "amd64" ]; then
  arch="x86_64"
else
  arch=$raw_arch
fi

# From Lunar onwards, CUDA is present in the main package repo
ubuntu_version=$(echo $distro | sed s/ubuntu//g)
if [ $ubuntu_version -ge 2200 ]; then
    apt-get -y install nvidia-cudnn
else
    apt-get install -y cudnn9-cuda-12
fi