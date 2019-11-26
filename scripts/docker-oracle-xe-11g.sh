set -ax
git clone https://github.com/wnameless/docker-oracle-xe-11g.git
cd docker-oracle-xe-11g
docker build -t jmnote/oracle-xe-11g .
docker push jmnote/oracle-xe-11g .
