set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/octant:0.10.2-centos

cat <<'EOF' > Dockerfile
FROM centos:7
RUN yum install -y https://github.com/vmware-tanzu/octant/releases/download/v0.10.2/octant_0.10.2_Linux-64bit.rpm \
&& yum clean all
ENTRYPOINT ["octant"]
EOF

docker build -t $IMAGE . && docker push $IMAGE
