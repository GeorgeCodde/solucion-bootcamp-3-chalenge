# Solucion a reto 6

## Ejercicio 1 - Crear contenedores de MongoDB y MongoDB Express

### Crea un contenedor con MongoDB, protegido por usuario y contraseña.

### Conectate utilizando Mongo Express. Crea una base de datos llamada Library con una colección llamada Books.

La creación de los dos contenedores de mongo y mongo express se realizo mediante docker compose a continuación el [archivo](https://github.com/GeorgeCodde/solucion-bootcamp-3-chalenge/blob/main/reto-6/mongo/docker-compose.yml)

Este es un fracmento del archivo docker-compose.yml

```yaml
version: "3.8"

services:
  mongo:
    container_name: mongosrv
    image: mongo
    restart: always
    volumes:
      - ./mongo-volume:/data/db
    environment:
      MONGO_INITDB_ROOT_USERNAME: root
      MONGO_INITDB_ROOT_PASSWORD: example
    networks:
      - mongo-net

  mongo-express:
    container_name: mongo-expresssrv
    image: mongo-express
    restart: always
    ports:
      - 8081:8081
    environment:
      ME_CONFIG_OPTIONS_EDITORTHEME: 3024-night
      ME_CONFIG_BASICAUTH_USERNAME: mongoexpress
      ME_CONFIG_BASICAUTH_PASSWORD: mongoexpress
      ME_CONFIG_MONGODB_ADMINUSERNAME: root
      ME_CONFIG_MONGODB_ADMINPASSWORD: example
      ME_CONFIG_MONGODB_URL: mongodb://root:example@mongo:27017/
    networks:
      - mongo-net

  bootcamp-web:
    container_name: bootcamp-web
    image: nginx
    restart: always
    ports:
      - 9999:80
    volumes:
      - ./bootcamp-web:/usr/share/nginx/html:ro

networks:
  mongo-net:
    driver: bridge
```

### Ejecuta un contenedor con la imagen
