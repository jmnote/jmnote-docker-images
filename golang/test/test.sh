docker run -d --name go -p8080:8080 -v`pwd`/main.go:/go/main.go jmnote/golang:1.14.4-alpine-git-curl-dcron-openssh-supervisor sh -c 'cd /go; go run main.go'
sleep 2
curl localhost:8080/ping
docker rm -f go

