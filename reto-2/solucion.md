# Solucion a reto 2

### Creación del contenedor bbdd con una imagen de mariadb

A continuacion se muestra el comando ejecutado con las variables de entorno establecidas.

```bash
docker run --name bbdd \
--env MARIADB_ROOT_PASSWORD=root \
--env MARIADB_DATABASE=prueba \
--env MARIADB_USER=invitado \
--env MARIADB_PASSWORD=invitado \
mariadb --port 3306
```

Con el comando anteriomente mostrado no se expone el puerto al anfítrion por tanto lo cambie y queda de la siguiente forma.

```bash
docker run --name bbdd -p 3306:3306 \
--env MARIADB_ROOT_PASSWORD=root \
--env MARIADB_DATABASE=prueba \
--env MARIADB_USER=invitado \
--env MARIADB_PASSWORD=invitado \
mariadb
```

![screenshotReto2-1](https://github.com/GeorgeCodde/solucion-bootcamp-3-chalenge/blob/main/assets/screenshotReto2-1.png)

### Conexión a la base de datos con los datos configurados

![screenshotReto2-2](https://github.com/GeorgeCodde/solucion-bootcamp-3-chalenge/blob/main/assets/screenshotReto2-2.png)

### Se comprueba que no se puede borrar la imagen mariadb mientras el contenedor bbdd está creado.

Usando el siguiente comando

```bash
sudo docker rmi mariadb
```

![screenshotReto2-3](https://github.com/GeorgeCodde/solucion-bootcamp-3-chalenge/blob/main/assets/screenshotReto2-3.png)
