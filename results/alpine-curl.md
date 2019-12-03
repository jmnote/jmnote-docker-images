Build

```
root@localhost:~/jmnote-docker-images/alpine-packer# ./alpine-packer.sh 3.10.3 curl
+ TAG=3.10.3
+ PACKAGE=curl
+ TEMPDIR=/tmp/dockerdir-alpine-curl
+ REPO=jmnote/alpine-curl
+ mkdir -p /tmp/dockerdir-alpine-curl
+ pushd /tmp/dockerdir-alpine-curl
/tmp/dockerdir-alpine-curl ~/jmnote-docker-images/alpine-packer
+ echo 'FROM alpine:3.10.3
RUN apk add --no-cache curl'
+ docker build -t jmnote/alpine-curl:3.10.3 .
Sending build context to Docker daemon  2.048kB
Step 1/2 : FROM alpine:3.10.3
 ---> 965ea09ff2eb
Step 2/2 : RUN apk add --no-cache curl
 ---> Running in f251245d30d0
fetch http://dl-cdn.alpinelinux.org/alpine/v3.10/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.10/community/x86_64/APKINDEX.tar.gz
(1/4) Installing ca-certificates (20190108-r0)
(2/4) Installing nghttp2-libs (1.39.2-r0)
(3/4) Installing libcurl (7.66.0-r0)
(4/4) Installing curl (7.66.0-r0)
Executing busybox-1.30.1-r2.trigger
Executing ca-certificates-20190108-r0.trigger
OK: 7 MiB in 18 packages
Removing intermediate container f251245d30d0
 ---> b4ec4a8981ca
Successfully built b4ec4a8981ca
Successfully tagged jmnote/alpine-curl:3.10.3
+ docker push jmnote/alpine-curl:3.10.3
The push refers to repository [docker.io/jmnote/alpine-curl]
f2685c1cec63: Pushed
77cae8ab23bf: Mounted from jmnote/alpine-apache2-utils
3.10.3: digest: sha256:5c1f03df4fc31e3f94ed16c0397048a7aad8d652ac478552248a50045ae27f23 size: 738
+ popd
~/jmnote-docker-images/alpine-packer
+ rm -rf /tmp/dockerdir-alpine-curl
```

Image
* https://hub.docker.com/r/jmnote/alpine-curl
* https://hub.docker.com/repository/docker/jmnote/alpine-curl
