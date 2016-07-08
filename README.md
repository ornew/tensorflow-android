# Tensorflow for Android

Base on https://github.com/tensorflow/tensorflow/

The repository is setup to use a tensorflow model data on Android.

Docker Hub: https://hub.docker.com/r/ornew/tensorflow-android/

## Usage

I recommend that you use Docker. (However, if you clone from this repository
on Ubuntu, you execute `setup.sh` and copy the `share` directory anywhere.)

You installed Docker.

Docker: https://www.docker.com/

```sh
$ docker pull ornew/tensorflow-android
$ docker run -it --name tensorflow-android ornew/tensorflow-android bash
~/# setup.sh
```

## Official Demo App Build

You execute `~/demo/build.sh` on shell in docker:

```sh
~/# demo/build.sh
```

### You get .apk

You should mount host volume when new container ran. Use docker run `-v <MOUNT_HOST_PATH>:<MOUNT_CONT_PATH>` option.

Example:

```sh
$ docker pull ornew/tensorflow-android
$ docker run -it --name tensorflow-android -v /tmp/tf/apk/:/usr/local/tf/ ornew/tensorflow-android bash
~/# setup.sh
~/# demo/build.sh
~/# cp demo/tensorflow/bazel-bin/tensorflow/examples/android/tensorflow_demo.apk /usr/local/tf/
$ cd /tmp/tf/apk/
$ ls
tensorflow_demo.apk
$ adb install -r -g ./tensorflow_demo.apk
```
