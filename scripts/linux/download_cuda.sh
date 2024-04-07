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

export DEBIAN_FRONTEND=noninteractive

# From Lunar onwards, CUDA is present in the main package repo
ubuntu_version=$(echo $distro | sed s/ubuntu//g)
if [ $ubuntu_version -ge 2300 ]; then
    apt-get install -y --no-install-recommends nvidia-cuda-toolkit
else
    # Download the CUDA keyring package
    wget "https://developer.download.nvidia.com/compute/cuda/repos/$distro/$arch/cuda-keyring_1.1-1_all.deb"

    # Install the CUDA keyring package
    dpkg -i cuda-keyring_1.1-1_all.deb

    # Update the package lists
    apt-get update

    # Install CUDA
    apt-get install -y --no-install-recommends cuda-toolkit-12-0
    apt-get install -y --no-install-recommends nvidia-gds

    # Clean up the downloaded package
    rm cuda-keyring_1.1-1_all.deb
fi