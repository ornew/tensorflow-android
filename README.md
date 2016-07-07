# Tensorflow for Android

Base on https://github.com/tensorflow/tensorflow/

The repository is setup to use a tensorflow model data on Android.

Docker Hub: https://hub.docker.com/r/ornew/tensorflow-android/

## Usage

Recommend: Use Docker.

You need installed Docker.

Docker: https://www.docker.com/

```sh
$ docker pull ornew/tensorflow-android
$ docker run -it --name tensorflow-android ornew/tensorflow-android bash
# ~setup.sh
```

## Official Demo App Build

If exited, attach container by following command.

```sh
$ docker start tensorflow-android
$ docker attach tensorflow-android
```

You execute `build_demo.sh`:

```sh
# ~/build_demo.sh
```

Or yourself,

```sh
# mkdir ~/demo
# cd ~/demo
# git clone https://github.com/tensorflow/tensorflow.git
# cd tensorflow
# patch -u WORKSPACE < ~/WORKSPACE.20160705.diff
# echo y | android update sdk -u -t "android-23"
# wget https://storage.googleapis.com/download.tensorflow.org/models/inception5h.zip -O /tmp/inception5h.zip
# unzip /tmp/inception5h.zip -d tensorflow/examples/android/assets/
# bazel build //tensorflow/examples/android:tensorflow_demo
```

### You get .apk

You should mount host volume when new container ran. Use docker run `-v <MOUNT_HOST_PATH>:<MOUNT_CONT_PATH>` option.

Example following:

```sh
$ docker pull ornew/tensorflow-android
$ docker run -it --name tensorflow-android -v /tmp/tf/apk:/usr/local/tf/ ornew/tensorflow-android bash
# ~setup.sh
# chmod u+x ~/build_demo.sh
# ~/build_demo.sh
# cp /opt/tensorflow/bazel-bin/tensorflow/examples/android/tensorflow_demo.apk /usr/local/tf/
$ cd /tmp/tf/apk/
$ ls
tensorflow_demo.apk
$ adb install -r -g ./tensorflow_demo.apk
```
