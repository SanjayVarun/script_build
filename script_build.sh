#!/bin/bash

# ccache
export USE_CCACHE=1
export CCACHE_DIR=/home/ccache/sanjay
prebuilts/misc/linux-x86/ccache/ccache -M 50G
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export KBUILD_BUILD_USER=SanjayVarun
export KBUILD_BUILD_HOST=SpeedHorn
export CARDINAL_BUILD_TYPE=OFFICIAL

# clean
make clean && make clobber

# build
. build/envsetup.sh
lunch cardinal_$device-userdebug
make cardinal -j8
