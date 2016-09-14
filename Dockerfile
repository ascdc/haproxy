FROM ubuntu:trusty
MAINTAINER ASCDC <asdc.sinica@gmail.com>

ADD run.sh /run.sh

RUN DEBIAN_FRONTEND=noninteractive && \
	chmod +x /*.sh && \
	apt-get update && \
	apt-get -y install apt-get install software-properties-common && \
	add-apt-repository ppa:vbernat/haproxy-1.6 && \
	locale-gen en_US.UTF-8 && \
	export LANG=en_US.UTF-8
RUN DEBIAN_FRONTEND=noninteractive && apt-get update && \
	apt-get -y upgrade && \
	apt-get -y install haproxy vim 

ENTRYPOINT ["/run.sh"]
