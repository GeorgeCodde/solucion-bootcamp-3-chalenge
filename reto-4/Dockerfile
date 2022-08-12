#Imagen que voy a utilizar como base
FROM httpd:alpine

#Etiquetado
LABEL maintainer="jorgels120878@gmail.com"
LABEL project="DevOps"

#Como metadato, indicamos que el contenedor utiliza el puerto 80
EXPOSE 80

#Ruta de archivos de Apache
COPY content/ /usr/local/apache2/htdocs/