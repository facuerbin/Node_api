# Proyecto Final NodeJS Backend
## Api NodeJS
web_server@localhost:3000
user 'node'@'localhost' identified by 'NodeJS12$'
Database: 'node_api'
DBMS: MySQL

|	   autores		|
|-------------------| 				
|	id 			PK	|
|	pseudonimo		|				  
|	email			|
|	contrasenia		|

	  1 |
		|
		|
		| N

|	   publicaciones	|
|-----------------------|
|	publicacion_id	PK	|
|	titulo				|
|	contenido			|
|	resumen				|
|	autor_id		FK	|

Dentro de la carpeta /config esta el archivo dump.sql correspondiente para la base de datos.
Desde el directorio del proyecto:
									- npm install (para instalar dependencias)
									- node app.js (para correr el servidor)
# Utilizar curl o Postman para verificar métodos HTTP

# Autor
@ Facundo Erbin