                                                    --- Parte 1  -----


-- Crear base da datos posts
CREATE DATABASE posts;

-- Crear tabla post, con los atributos id, nombre de usuario, fecha de creación, contenido,descripción
CREATE TABLE post(id SERIAL, nombre_de_usuario VARCHAR(25), fecha_de_creacion DATE, contenido VARCHAR);

--  Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos"
INSERT INTO post (nombre_de_usuario, fecha_de_creacion, contenido) VALUES ('Pamela', '2021-03-29', 'lorem ipsum dolor sit amet consectetur adipiscing elit');
--  Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos"
INSERT INTO post (nombre_de_usuario, fecha_de_creacion, contenido) VALUES ('Pamela', '2021-03-30', 'lorem ipsum dolor sit amet consectetur adipiscing elit');
--  Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos"
INSERT INTO post (nombre_de_usuario, fecha_de_creacion, contenido) VALUES ('Carlos', '2021-03-29', 'lorem ipsum dolor sit amet consectetur adipiscing elit');


-- Modificar la tabla post, agregando la columna título 
ALTER TABLE post ADD titulo VARCHAR(30);


-- Agregar título a las publicaciones ya ingresadas 
UPDATE post SET titulo = 'Los gatos' WHERE id = 1;
-- Agregar título a las publicaciones ya ingresadas 
UPDATE post SET titulo = 'Los perros' WHERE id = 2;
-- Agregar título a las publicaciones ya ingresadas 
UPDATE post SET titulo = 'La informatica' WHERE id = 3;


--  Insertar 2 post para el usuario "Pedro"
INSERT INTO post (nombre_de_usuario, fecha_de_creacion, contenido, titulo) VALUES ('Pedro', '2021-03-25', 'lorem ipsum dolor sit amet consectetur adipiscing elit', 'Planeta Tierra');
--  Insertar 2 post para el usuario "Pedro"
INSERT INTO post (nombre_de_usuario, fecha_de_creacion, contenido, titulo) VALUES ('Pedro', '2021-03-27', 'lorem ipsum dolor sit amet consectetur adipiscing elit', 'Planeta Marte');


/*   id | nombre_de_usuario | fecha_de_creacion |                       contenido                        |     titulo     
----+-------------------+-------------------+--------------------------------------------------------+----------------
    1 | Pamela            | 2021-03-29        | lorem ipsum dolor sit amet consectetur adipiscing elit | Los gatos
    2 | Pamela            | 2021-03-30        | lorem ipsum dolor sit amet consectetur adipiscing elit | Los perros
    3 | Carlos            | 2021-03-29        | lorem ipsum dolor sit amet consectetur adipiscing elit | La informatica
    4 | Pedro             | 2021-03-25        | lorem ipsum dolor sit amet consectetur adipiscing elit | Planeta Tierra
    5 | Pedro             | 2021-03-27        | lorem ipsum dolor sit amet consectetur adipiscing elit | Planeta Marte
 */


--Eliminar el post de Carlos
DELETE FROM post WHERE nombre_de_usuario='Carlos';

/*  id | nombre_de_usuario | fecha_de_creacion |                       contenido                        |     titulo     
----+-------------------+-------------------+--------------------------------------------------------+----------------
    1 | Pamela            | 2021-03-29        | lorem ipsum dolor sit amet consectetur adipiscing elit | Los gatos
    2 | Pamela            | 2021-03-30        | lorem ipsum dolor sit amet consectetur adipiscing elit | Los perros
    4 | Pedro             | 2021-03-25        | lorem ipsum dolor sit amet consectetur adipiscing elit | Planeta Tierra
    5 | Pedro             | 2021-03-27        | lorem ipsum dolor sit amet consectetur adipiscing elit | Planeta Marte
*/

--  Ingresar un nuevo post para el usuario "Carlos"
INSERT INTO post (nombre_de_usuario, fecha_de_creacion, contenido, titulo) VALUES ('Carlos', '2021-03-31', 'lorem ipsum dolor sit amet consectetur adipiscing elit', 'La informatica 2.0');

/*  id | nombre_de_usuario | fecha_de_creacion |                       contenido                        |       titulo       
----+-------------------+-------------------+--------------------------------------------------------+--------------------
    1 | Pamela            | 2021-03-29        | lorem ipsum dolor sit amet consectetur adipiscing elit | Los gatos
    2 | Pamela            | 2021-03-30        | lorem ipsum dolor sit amet consectetur adipiscing elit | Los perros
    4 | Pedro             | 2021-03-25        | lorem ipsum dolor sit amet consectetur adipiscing elit | Planeta Tierra
    5 | Pedro             | 2021-03-27        | lorem ipsum dolor sit amet consectetur adipiscing elit | Planeta Marte
    6 | Carlos            | 2021-03-31        | lorem ipsum dolor sit amet consectetur adipiscing elit | La informatica 2.0
*/


-- Se agrega columan id_usuario para poder relacionarlo con tabla comentarios
ALTER TABLE post ADD id_usuario INT;


-- Se les asigna un id por cada nombre de usario
UPDATE post SET id_usuario= 1 WHERE id = 1;
UPDATE post SET id_usuario= 2 WHERE id = 4;
UPDATE post SET id_usuario= 3 WHERE id = 6;

/*   id | nombre_de_usuario | fecha_de_creacion |                       contenido                        |       titulo       | id_usuario 
----+-------------------+-------------------+--------------------------------------------------------+--------------------+------------
    1 | Pamela            | 2021-03-29        | lorem ipsum dolor sit amet consectetur adipiscing elit | Los gatos            |          1
    2 | Pamela            | 2021-03-30        | lorem ipsum dolor sit amet consectetur adipiscing elit | Los perros           |          
    4 | Pedro             | 2021-03-25        | lorem ipsum dolor sit amet consectetur adipiscing elit | Planeta Tierra       |          2
    5 | Pedro             | 2021-03-27        | lorem ipsum dolor sit amet consectetur adipiscing elit | Planeta Marte        |          
    6 | Carlos            | 2021-03-31        | lorem ipsum dolor sit amet consectetur adipiscing elit | La informatica 2.0   |          3
 */


-- Se genera una restriccion de unica para la columna id_usuario
ALTER TABLE post ADD constraint NOMBRERESTRICCION UNIQUE(id_usuario);


-- Se agrega una llave primaria
ALTER TABLE post ADD PRIMARY KEY (id);



                                                    --- Parte 2  -----


-- Crear una nueva tabla, llamada comentarios, con los atributos id, fecha y hora de creación,contenido, que se relacione con la tabla posts. Se le agrega la columna id_usuario para poder relacionarla con la tabla post y se genera la llave foranea
CREATE TABLE comentarios(id SERIAL, fecha_de_creacion DATE, hora TIME, contenido VARCHAR, id_usuario INT, FOREIGN KEY (id_usuario) REFERENCES post (id_usuario));


-- Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos" 
INSERT INTO comentarios(fecha_de_creacion,hora,contenido,id_usuario) VALUES ('2021-03-29', '17:05:00','Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat.', 1);
INSERT INTO comentarios(fecha_de_creacion,hora,contenido,id_usuario) VALUES ('2021-03-29', '22:13:57','Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat.', 1);

INSERT INTO comentarios(fecha_de_creacion,hora,contenido,id_usuario) VALUES ('2021-03-30', '19:23:42','Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat.', 3);
INSERT INTO comentarios(fecha_de_creacion,hora,contenido,id_usuario) VALUES ('2021-04-01', '10:05:02','Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat.', 3);
INSERT INTO comentarios(fecha_de_creacion,hora,contenido,id_usuario) VALUES ('2021-04-01', '15:05:02','Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat.', 3);
INSERT INTO comentarios(fecha_de_creacion,hora,contenido,id_usuario) VALUES ('2021-04-01', '19:05:02','Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat.', 3);


-- Crear un nuevo post para "Margarita"
INSERT INTO post (nombre_de_usuario, fecha_de_creacion, contenido, titulo, id_usuario) VALUES ('Margarita', '2021-04-01', 'lorem ipsum dolor sit amet consectetur adipiscing elit', 'PrimeraPost Margarita', 4);


-- Ingresar 5 comentarios para el post de Margarita.
INSERT INTO comentarios(fecha_de_creacion,hora,contenido,id_usuario) VALUES ('2021-04-01', '09:05:02','Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat.', 4);
INSERT INTO comentarios(fecha_de_creacion,hora,contenido,id_usuario) VALUES ('2021-04-01', '19:18:36','Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat.', 4);
INSERT INTO comentarios(fecha_de_creacion,hora,contenido,id_usuario) VALUES ('2021-04-01', '20:05:25','Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat.', 4);
INSERT INTO comentarios(fecha_de_creacion,hora,contenido,id_usuario) VALUES ('2021-04-01', '20:37:13','Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat.', 4);
INSERT INTO comentarios(fecha_de_creacion,hora,contenido,id_usuario) VALUES ('2021-04-01', '23:49:46','Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat.', 4);


/*  posts=# SELECT * FROM comentarios;
  id | fecha_de_creacion |   hora   |                                                  contenido                                                  | id_usuario 
----+-------------------+----------+-------------------------------------------------------------------------------------------------------------+------------
  1 | 2021-03-29        | 17:05:00 | Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. |          1
  2 | 2021-03-29        | 22:13:57 | Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. |          1
  3 | 2021-03-30        | 19:23:42 | Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. |          3
  4 | 2021-04-01        | 09:05:02 | Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. |          4
  5 | 2021-04-01        | 19:18:36 | Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. |          4
  6 | 2021-04-01        | 20:05:25 | Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. |          4
  7 | 2021-04-01        | 20:37:13 | Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. |          4
  8 | 2021-04-01        | 23:49:46 | Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. |          4
  9 | 2021-04-01        | 09:05:02 | Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. |          3
  10 | 2021-04-01        | 09:05:02 | Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. |         3
  11 | 2021-04-01        | 09:05:02 | Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. |         3
(11 filas)

posts=# SELECT * FROM post;
  id | nombre_de_usuario | fecha_de_creacion |                       contenido                        |        titulo         | id_usuario 
----+-------------------+-------------------+--------------------------------------------------------+-----------------------+------------
  2 | Pamela            | 2021-03-30        | lorem ipsum dolor sit amet consectetur adipiscing elit | Los perros            |           
  5 | Pedro             | 2021-03-27        | lorem ipsum dolor sit amet consectetur adipiscing elit | Planeta Marte         |           
  1 | Pamela            | 2021-03-29        | lorem ipsum dolor sit amet consectetur adipiscing elit | Los gatos             |          1
  4 | Pedro             | 2021-03-25        | lorem ipsum dolor sit amet consectetur adipiscing elit | Planeta Tierra        |          2
  6 | Carlos            | 2021-03-31        | lorem ipsum dolor sit amet consectetur adipiscing elit | La informatica 2.0    |          3
  7 | Margarita         | 2021-04-01        | lorem ipsum dolor sit amet consectetur adipiscing elit | PrimeraPost Margarita |          4
(6 filas)

*/ 