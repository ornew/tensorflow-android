#!/bin/bash

cat /etc/lsb-release
apt-get update && apt-get install -y curl git software-properties-common
echo | add-apt-repository ppa:webupd8team/java
echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
apt-get update && apt-get install -y oracle-java8-installer
echo "deb http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
curl https://storage.googleapis.com/bazel-apt/doc/apt-key.pub.gpg | apt-key add -
apt-get update && apt-get install -y bazel
cd /opt/
curl https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz | tar zx
export ANDROID_HOME=/opt/android-sdk-linux
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
echo y | android update sdk -u -t "android-23"
echo y | android update sdk -u -t "build-tools-24.0.0"
wget http://dl.google.com/android/repository/android-ndk-r12b-linux-x86_64.zip -O /tmp/ndk.zip
unzip /tmp/ndk.zip -d /opt/
export ANDROID_NDK_HOME=/opt/android-ndk-r12b
export PATH=${PATH}:$ANDROID_NDK_HOME
cd /home/
mkdir work/
cd work/
git clone https://github.com/tensorflow/tensorflow.git
cd tensorflow
patch -u WORKSPACE < ~/WORKSPACE.20160705.diff
wget https://storage.googleapis.com/download.tensorflow.org/models/inception5h.zip -O /tmp/inception5h.zip
unzip /tmp/inception5h.zip -d tensorflow/examples/android/assets/
