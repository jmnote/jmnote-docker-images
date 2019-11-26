FROM debian:10.0-slim
RUN apt-get update && apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
&& mkdir /octant \
&& cd /octant \
&& curl -o octant.deb -L https://github.com/vmware/octant/releases/download/v0.5.0/octant_0.5.0_Linux-64bit.deb \
&& dpkg -i octant.deb \
&& rm -rf /octant
ENTRYPOINT ["octant"]
