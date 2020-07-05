set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/golang:1.14.4-alpine-git-curl-dcron-openssh-supervisor

cat <<EOF > main.go
package main

import "github.com/gin-gonic/gin"

func main() {
	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})
	r.Run()
}
EOF

docker run -d --name test -p8080:8080 -v`pwd`/main.go:/go/main.go $IMAGE sh -c 'cd /go; go run main.go'
sleep 2
curl localhost:8080/ping
docker rm -f test

