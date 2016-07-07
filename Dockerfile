FROM ubuntu:latest
MAINTAINER Arata Furukawa <old.river.new@gmail.com>
CMD /bin/bash
COPY setup.sh /tmp/setup.sh
COPY build_demo.sh /tmp/build_demo.sh
COPY WORKSPACE.20160705.diff /tmp/WORKSPACE.20160705.diff
RUN cp /tmp/setup.sh ~/setup.sh \
&& cp /tmp/WORKSPACE.20160705.diff ~/WORKSPACE.20160705.diff \
&& cp /tmp/build_demo.sh ~/build_demo.sh \
&& chmod +x ~/setup.sh \
&& chmod +x ~/build_demo.sh
