# Tensorflow for Android

Base on https://github.com/tensorflow/tensorflow/

The repository is setup to use a tensorflow model data on Android.

Docker Hub: https://hub.docker.com/r/ornew/tensorflow-android/

## Usage

I recommend that you use Docker. (However, if you clone from this repository
on Ubuntu, you execute `bash install` and copy the `bin` directory anywhere.)

You installed Docker.

Docker: https://www.docker.com/

```sh
$ docker pull ornew/tensorflow-android
$ docker run -it ornew/tensorflow-android
# bash install
# source ~/.bashrc
```

## Official Demo App Build

You execute `bash demo/build` on shell in docker:

```sh
# bash demo/build
```

### You get .apk

You should mount host volume when new container ran. Use docker run `-v <MOUNT_HOST_PATH>:<MOUNT_CONT_PATH>` option.

Example:

```sh
$ docker pull ornew/tensorflow-android
$ docker run -it -v /tmp/tf/apk/:/usr/local/tf/ ornew/tensorflow-android
# bash install
# source ~/.bashrc
# bash demo/build
# cp ~/ornew/tensorflow-android/demo/tensorflow/bazel-bin/tensorflow/examples/android/tensorflow_demo.apk /usr/local/tf/
# exit
$ cd /tmp/tf/apk/
$ ls
tensorflow_demo.apk
$ adb install -r -g ./tensorflow_demo.apk
```

### 日本国内で実行する場合(For Japanese)
apt-get参照リポジトリを国内リポジトリに変更すると爆速になるので、`bash install`の前に以下のコマンドを実行してみてください。

```sh
# sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.iij.ad.jp/pub/linux/ubuntu/archive/%g" /etc/apt/sources.list
```
