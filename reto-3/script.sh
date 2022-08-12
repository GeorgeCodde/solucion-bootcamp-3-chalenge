#!/bin/bash

#creamos el dockerfile primero
docker volume create static_content

docker build -t bootcamp_nginx .

docker run -d --name bootcamp_container -v static_content:/usr/share/nginx/html -p 8080:80 bootcamp_nginx

docker login -u "myusername" -p "mypassword" docker.io

docker tag bootcamp_nginx roxsross12/bootcamp_nginx:v1.0.0

docker push roxsross12/bootcamp_nginx:v1.0.0