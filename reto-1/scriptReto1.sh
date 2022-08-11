#!/bin/bash
# contenedor a partir de la imagen nginx , el contenedor se llama 
# servidor_web y se accede a él utilizando el puerto 8181 

echo -e "\033[0;34mEl siguiente script crea un contenedor nginx"
echo "Con el nombre servidor_web en el puerto 8181"
echo -e "\033[0;36m¿Quieres ejecutar el proceso? (y/n)\033[0;37m"
read runProcess
if [[ $runProcess == "y" || $runProcess == "Y" ]]
then
    docker run -d --name servidor_web -p 8181:80 nginx
    echo -e "\033[0;33m Contenedores en ejecución \033[0;37m"
    docker ps
    echo -e "\033[0;33mImagenes en el host\033[0;37m"
    docker images
    echo -e "\033[0;32m--Servidor_web en ejecución http://localhost:8181 --\033[0;37m"
    echo -e "\033[0;36m¿Quieres detener el servidor_web y eliminar el contenedor? (y/n)\033[0;37m"
    read stopContainer
    if [[ $stopContainer == "y" || $stopContainer == "Y" ]]
    then
        echo -e "\033[0;33mLista de contenedores en ejecución\033[0;37m"
        docker ps
        docker stop servidor_web
        echo -e "\033[0;31m--Servidor_web detenido--\033[0;37m"
        echo -e "\033[0;33mLista de contenedores en ejecución\033[0;37m"
        docker ps
        docker rm servidor_web
        echo -e "\033[0;31m--Contenedor Servidor_web eliminado--\033[0;37m"
        echo -e "\033[0;33mLista de contenedores\033[0;37m"
        docker ps -a
    fi
fi