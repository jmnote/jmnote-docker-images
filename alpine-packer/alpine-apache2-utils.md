Build

```
root@localhost:~/jmnote-docker-images/alpine-packer# ./alpine-packer.sh 3.10.3 apache2-utils
+ TAG=3.10.3
+ PACKAGE=apache2-utils
+ TEMPDIR=/tmp/dockerdir-alpine-apache2-utils
+ REPO=jmnote/alpine-apache2-utils
+ mkdir -p /tmp/dockerdir-alpine-apache2-utils
+ pushd /tmp/dockerdir-alpine-apache2-utils
/tmp/dockerdir-alpine-apache2-utils ~/jmnote-docker-images/alpine-packer
+ echo 'FROM alpine:3.10.3
RUN apk add --no-cache apache2-utils'
+ docker build -t jmnote/alpine-apache2-utils:3.10.3 .
Sending build context to Docker daemon  2.048kB
Step 1/2 : FROM alpine:3.10.3
3.10.3: Pulling from library/alpine
89d9c30c1d48: Pull complete
Digest: sha256:c19173c5ada610a5989151111163d28a67368362762534d8a8121ce95cf2bd5a
Status: Downloaded newer image for alpine:3.10.3
 ---> 965ea09ff2eb
Step 2/2 : RUN apk add --no-cache apache2-utils
 ---> Running in bf40696e68a0
fetch http://dl-cdn.alpinelinux.org/alpine/v3.10/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.10/community/x86_64/APKINDEX.tar.gz
(1/5) Installing libuuid (2.33.2-r0)
(2/5) Installing apr (1.6.5-r0)
(3/5) Installing expat (2.2.8-r0)
(4/5) Installing apr-util (1.6.1-r6)
(5/5) Installing apache2-utils (2.4.41-r0)
Executing busybox-1.30.1-r2.trigger
OK: 6 MiB in 19 packages
Removing intermediate container bf40696e68a0
 ---> e9f95e01f9df
Successfully built e9f95e01f9df
Successfully tagged jmnote/alpine-apache2-utils:3.10.3
+ docker push jmnote/alpine-apache2-utils:3.10.3
The push refers to repository [docker.io/jmnote/alpine-apache2-utils]
ed2b0d4c3abe: Pushed
77cae8ab23bf: Mounted from library/alpine
3.10.3: digest: sha256:8f5113bb90b2309da08b2083b981d8e975c2ede2a0acee3ce0174f8bddbf049f size: 738
+ popd
~/jmnote-docker-images/alpine-packer
+ rm -rf /tmp/dockerdir-alpine-apache2-utils
```

Image
* https://hub.docker.com/repository/docker/jmnote/alpine-apache2-utils
