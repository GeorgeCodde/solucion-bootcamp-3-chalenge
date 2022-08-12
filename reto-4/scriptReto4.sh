#!/bin/bash

#creamos el dockerfile primero 
 
docker build -t simple-apache:new .
docker images
docker run -dit --name mi_apache -p 5050:80 simple-apache:new

docker inspect -f '{{.RootFS}}' simple-apache:new

docker inspect simple-apache:new | jq 