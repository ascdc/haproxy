FROM ubuntu:trusty
MAINTAINER ASCDC <asdc.sinica@gmail.com>

ADD run.sh /run.sh

RUN DEBIAN_FRONTEND=noninteractive && \
	chmod +x /*.sh && \
	apt-get update && \
	apt-get -y install software-properties-common && \
	add-apt-repository ppa:vbernat/haproxy-1.6 && \
	apt-get -y upgrade && \
	apt-get -y install haproxy

ENTRYPOINT ["/run.sh"]
