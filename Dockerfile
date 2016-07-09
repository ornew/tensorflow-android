FROM ubuntu:latest
MAINTAINER Arata Furukawa <old.river.new@gmail.com>
CMD /bin/bash
WORKDIR ~/
COPY bin/ .
