# Tensorflow for Android

Base on https://github.com/tensorflow/tensorflow/

The repository is base-code to use a tensorflow model data on Android.

Docker Hub: https://hub.docker.com/r/ornew/tensorflow-android/

## Usage

Recommend: Use Docker.

You need installed Docker.

```sh
$ docker pull ornew/tensorflow-android
$ docker run -it --name tensorflow-android ornew/tensorflow-android bash
# ~setup.sh
# exit
```

## Official Demo App Build

```sh
$ docker start tensorflow-android
$ docker attach tensorflow-android
# wget https://storage.googleapis.com/download.tensorflow.org/models/inception5h.zip -O /tmp/inception5h.zip
# unzip /tmp/inception5h.zip -d tensorflow/examples/android/assets/
# bazel build //tensorflow/examples/android:tensorflow_demo
# exit
```

### You get .apk

You should mount host volume. Use docker run `-v <MOUNT_HOST_PATH>:<MOUNT_CONT_PATH>` option.

```sh
$ docker pull ornew/tensorflow-android
$ docker run -it --name tensorflow-android -v /tmp/tf/apk:/usr/local/tf/ ornew/tensorflow-android bash
# ~setup.sh
# wget https://storage.googleapis.com/download.tensorflow.org/models/inception5h.zip -O /tmp/inception5h.zip
# unzip /tmp/inception5h.zip -d tensorflow/examples/android/assets/
# bazel build //tensorflow/examples/android:tensorflow_demo
# cp /opt/tensorflow/bazel-bin/tensorflow/examples/android/tensorflow_demo.apk /usr/local/tf/
# exit
$ cd /tmp/tf/apk/
$ ls
tensorflow_demo.apk
$ adb install -r -g ./tensorflow_demo.apk
```
