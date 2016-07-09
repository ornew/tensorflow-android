#!/bin/bash

ANDROID_BUILD_TOOLS_VERSION=24.0.0
DK_INS_DIR=/usr/bin/local
ANDROID_HOME=${DK_INS_DIR}/android-sdk-linux
ANDROID_NDK_HOME=${DK_INS_DIR}/android-ndk-r12b
PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
PATH=${PATH}:$ANDROID_NDK_HOME
export ANDROID_BUILD_TOOLS_VERSION
export ANDROID_NDK_HOME
export ANDROID_HOME
export PATH

SDK_URL=https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
NDK_URL=http://dl.google.com/android/repository/android-ndk-r12b-linux-x86_64.zip
BAZEL_GPG_URL=https://storage.googleapis.com/bazel-apt/doc/apt-key.pub.gpg

cat /etc/lsb-release
apt-get update && apt-get install -y wget git
apt-get update && apt-get install -y software-properties-common
echo | add-apt-repository ppa:webupd8team/java
echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
apt-get update && apt-get install -y oracle-java8-installer
echo "deb http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
wget -qO - ${BAZEL_GPG_URL} | apt-key add -
apt-get update && apt-get install -y bazel
wget ${SDK_URL} -O - | tar zx -C ${DK_INS_DIR} && echo y | android update sdk -u -t "build-tools-${ANDROID_BUILD_TOOLS_VERSION}"
wget ${NDK_URL} -O /tmp/ndk.zip && unzip /tmp/ndk.zip -d ${DK_INS_DIR}
