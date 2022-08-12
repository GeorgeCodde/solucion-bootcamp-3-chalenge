# Solucion a reto 5

### Pruébala en local de la aplicacion en node

![screenshotReto5-1](https://github.com/GeorgeCodde/solucion-bootcamp-3-chalenge/blob/main/assets/screenshotReto5-1.png)

![screenshotReto5-2](https://github.com/GeorgeCodde/solucion-bootcamp-3-chalenge/blob/main/assets/screenshotReto5-2.png)

### Ejecuta un contenedor con la imagen

#### Archivo Dockerfile

![screenshotReto5-3](https://github.com/GeorgeCodde/solucion-bootcamp-3-chalenge/blob/main/assets/screenshotReto5-3.png)

### Subir la aplicacion en registry

![screenshotReto5-4](https://github.com/GeorgeCodde/solucion-bootcamp-3-chalenge/blob/main/assets/screenshotReto5-4.png)

### Crear el Script que permita realizar todo lo antes mencionado

```bash
#!/bin/bash

##### Para probar la aplicacion en local
#npm install
#node server.js
#####

### Crear la imagen de docker

echo -e "\033[0;34mEl siguiente script crea una imagen app-node"
echo "Con el nombre app-node en el puerto 4000"
echo -e "\033[0;36m¿Quieres ejecutar el proceso de creacion de la imagen? (y/n)\033[0;37m"
read runProcess
if [[ $runProcess == "y" || $runProcess == "Y" ]]
then
    docker build -t app-node .
    echo -e "\033[0;32m--Imagen creada --\033[0;37m"
    echo -e "\033[0;33mImagenes en el host\033[0;37m"
    docker images
    echo -e "\033[0;36m¿Quieres subir la imagen a Dockerhub? (y/n)\033[0;37m"
    read pushContainer
    if [[ $pushContainer == "y" || $pushContainer == "Y" ]]
    then
        docker tag app-node jorgels120878/app-node:v1.0.0
        docker push jorgels120878/app-node:v1.0.0
        echo -e "\033[0;31m--jorgels120878/App-node:v1.0.0 en Dockerhub --\033[0;37m"
    fi

    echo -e "\033[0;36m¿Quieres crear el contenedor? (y/n)\033[0;37m"
    read createContainer
    if [[ $createContainer == "y" || $createContainer == "Y" ]]
    then
        docker run -d --name app-node-container -p 4000:4000 app-node
        echo -e "\033[0;31m--App-node iniciado--\033[0;37m"
        echo -e "\033[0;33mLista de contenedores en ejecución\033[0;37m"
        docker ps
    fi
    echo -e "\033[0;36m¿Quieres detener el App-Node y eliminar el contenedor? (y/n)\033[0;37m"
    read stopContainer
    if [[ $stopContainer == "y" || $stopContainer == "Y" ]]
    then
        echo -e "\033[0;33mLista de contenedores en ejecución\033[0;37m"
        docker ps
        docker stop app-node-container
        echo -e "\033[0;31m--App-Node detenido--\033[0;37m"
        echo -e "\033[0;33mLista de contenedores en ejecución\033[0;37m"
        docker ps
        docker rm app-node-container
        echo -e "\033[0;31m--Contenedor App-Node eliminado--\033[0;37m"
        echo -e "\033[0;33mLista de contenedores\033[0;37m"
        docker ps -a
    fi
fi

```
