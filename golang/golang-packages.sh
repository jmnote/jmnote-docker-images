set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/golang:packages

cat <<'EOF' > Dockerfile
FROM golang:alpine

RUN set -x \
&& apk --no-cache add tree \
&& touch packages.txt && rm -f packages.txt \
&& echo google.golang.org/api@v0.13.0 >> packages.txt \
&& while read PACKAGE; do \
  go get $PACKAGE; \
  MOD=$(echo $PACKAGE | awk -F@ '{print $1}'); \
  VER=$(echo $PACKAGE | awk -F@ '{print $2}'); \
  DEST=/packages/$MOD/$VER; \
  mkdir -p $DEST; \
  cp /go/pkg/mod/cache/download/$MOD/@v/$VER.info $DEST/; \
  cp /go/pkg/mod/cache/download/$MOD/@v/$VER.mod  $DEST/go.mod; \
  cp /go/pkg/mod/cache/download/$MOD/@v/$VER.zip  $DEST/source.zip; \
done < packages.txt
EOF

docker build -t $IMAGE . && docker push $IMAGE

