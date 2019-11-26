rm -rf /tmp/jmnote-docker-images; mkdir /tmp/jmnote-docker-images; cd /tmp/jmnote-docker-images 

echo 'FROM centos:7.6.1810
RUN yum install -y https://github.com/vmware/octant/releases/download/v0.6.0/octant_0.6.0_Linux-64bit.rpm && yum clean all
ENTRYPOINT ["octant"]' > Dockerfile
docker build -t jmnote/octant:0.6.0-centos
docker push jmnote/octant:0.6.0-centos

rm -rf /tmp/jmnote-docker-images
