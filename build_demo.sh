#!/bin/bash

mkdir ~/demo
cd ~/demo
git clone https://github.com/tensorflow/tensorflow.git
cd tensorflow
patch -u WORKSPACE < ~/WORKSPACE.20160705.diff
echo y | android update sdk -u -t "android-23"
wget https://storage.googleapis.com/download.tensorflow.org/models/inception5h.zip -O /tmp/inception5h.zip
unzip /tmp/inception5h.zip -d tensorflow/examples/android/assets/
bazel build //tensorflow/examples/android:tensorflow_demo
