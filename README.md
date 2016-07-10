# Tensorflow for Android

Base on https://github.com/tensorflow/tensorflow/

The repository is setup to use a tensorflow model data on Android.

- GitHub: https://github.com/ornew/tensorflow-android
- DockerHub: https://hub.docker.com/r/ornew/tensorflow-android/

## Usage

I recommend that you use Docker. (However, if you clone from this repository
on Ubuntu, you execute `bash install` and copy the `bin` directory anywhere.)

You installed Docker.

Docker: https://www.docker.com/

```sh
$ docker pull ornew/tensorflow-android
$ docker run -it ornew/tensorflow-android
# bash install
# . ~/.bashrc
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
# . ~/.bashrc
# bash demo/build
# cp ~/ornew/tensorflow-android/demo/tensorflow/bazel-bin/tensorflow/examples/android/tensorflow_demo.apk /usr/local/tf/
# exit
$ cd /tmp/tf/apk/
$ ls
tensorflow_demo.apk
$ adb install -r -g ./tensorflow_demo.apk
```

## Performance improvement

1. Use `--net=host`
2. Use `-v $(pwd)/bin:/root`

## For Japanese
apt-get参照リポジトリを国内リポジトリに変更すると爆速になるので、`bash install`の前に以下のコマンドを実行してみてください。

```sh
# sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.iij.ad.jp/pub/linux/ubuntu/archive/%g" /etc/apt/sources.list
```

## Author @ornew

> 古川新 (Arata Furukawa)  
> email: old.river.new@gmail.com  
> URL: http://ornew.net/
