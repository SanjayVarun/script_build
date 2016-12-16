#!/bin/bash

# check for number of parameters
if [ $# -ne 1 ]
then
	echo "Enter the device name"
	exit
fi

# get device name from arguement
device=$1

# ccache
export USE_CCACHE=1
export CCACHE_DIR=/home/ccache/sanjay
prebuilts/misc/linux-x86/ccache/ccache -M 50G
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export KBUILD_BUILD_USER=SanjayVarun
export KBUILD_BUILD_HOST=SpeedHorn

# clean
make clean && make clobber

# build
. build/envsetup.sh
lunch cm_$device-userdebug
make bacon -j8
