# Solucion a reto 7

## 1.- Arrancar un contenedor que ejecute la imagen php:7.4-apache, llamado web, por el puerto 8000.

- Observando en el dockerhub corespondiente a la imagen y tag indicado obsevamos que la imagen expone el puerto 80, entonces queda el comando de la siguiente forma.

```
docker run -d --name web -p 8000:80 php:7.4-apache
```

![ejecucion de docker](../assets/screenshotReto7-1.png)
![acceso a la paguina](../assets/screenshotReto7-2.png)

## 2.- Colocar en el directorio raíz del contenedor un archivo index.html que contenga 'HOLA SOY XXXXX' (nombre y apellidos).

- Ejecute los siguientes comandos para instalar el editor nano y crear el archivo index.html

```
docker exec -it web bash
apt update
apt-get install nano
nano index.html
```

![acceso a la paguina](../assets/screenshotReto7-3.png)

- Dentro de este archivo escribo la siguiente linea

> Hola soy JORGE LOPEZ SANCHEZ

![acceso a la paguina](../assets/screenshotReto7-4.png)

- Compruebo el contenido del archivo

```
tail index.html
```

![acceso a la paguina](../assets/screenshotReto7-5.png)

## 2.- Colocar en el mismo directorio otro archivo llamado llamado mes.php que muestre el mes actual, y ver la salida del script en el navegador.

- Creo el archivo 'mes.php'

- COn el siguiente contenido

```php
<?php
$DateAndTime = date('m-d-Y h:i:s a', time());
echo "La fecha y hora actual es:  $DateAndTime.";
?>
```

![comandos](../assets/screenshotReto7-6.png)
![evidencia](../assets/screenshotReto7-7.png)

## Borrar el contenedor.

```
docker stop web
docker rm web
```

![evidencia](../assets/screenshotReto7-8.png)
