#!/bin/bash

# Comando para crear los contenedores del ejercicio 1 y 2 al mismo tiempo
docker compose -f ./mongo/docker-compose.yml up -d

# Detiene todos los contenedores
docker compose -f ./mongo/docker-compose.yml down

# Ejecutar el comando desde afuera para verificar que estan los archivos del sitio
docker exec -ti bootcamp-web ls /usr/share/nginx/html    

# Detiene todos los contenedores 
docker stop $(docker ps -a -q)
# Elimina todos los contenedores
docker rm $(docker ps -a -q)

