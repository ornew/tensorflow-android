FROM ubuntu:latest
MAINTAINER Arata Furukawa <old.river.new@gmail.com>
CMD /bin/bash
ENV WORKDIR ~/ornew/tensorflow-android
WORKDIR ${WORKDIR}
COPY bin/ .
