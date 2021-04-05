--  Crear base de datos llamada películas
CREATE DATABASE peliculas;

-- Revisar los archivos peliculas.csv y reparto.csv para crear las tablas correspondientes,determinando la relación entre ambas tablas. 

CREATE TABLE peliculas(id SMALLINT,pelicula VARCHAR,a_estreno SMALLINT,director VARCHAR);
CREATE TABLE reparto(movie SMALLINT, actor VARCHAR);


-- Cargar ambos archivos a su tabla correspondiente
\copy peliculas FROM 'peliculas.csv' csv header;
\copy reparto FROM 'reparto.csv' csv;

-- Generación llave foranea y llave primaria para poder interactuar entre ambas tablas
ALTER TABLE peliculas ADD PRIMARY KEY (id);
ALTER TABLE reparto ADD FOREIGN KEY (movie) REFERENCES peliculas(id);


-- Listar todos los actores que aparecen en la película "Titanic", indicando el título de la película,año de estreno, director y todo el reparto. 
SELECT actor, a_estreno, director FROM peliculas FULL JOIN reparto on peliculas.id=reparto.movie WHERE pelicula='Titanic';


-- Listar los titulos de las películas donde actúe Harrison Ford.
SELECT pelicula FROM peliculas FULL JOIN reparto on peliculas.id=reparto.movie WHERE actor='Harrison Ford';


-- Listar los 10 directores mas populares, indicando su nombre y cuántas películas aparecen en el top 100.
SELECT todo.director, todo.total FROM (SELECT director, COUNT(*) AS total FROM peliculas GROUP BY director) AS todo ORDER BY total DESC LIMIT 10;


--Indicar cuantos actores distintos hay
SELECT COUNT(todo) AS total_de_actores FROM (SELECT actor, COUNT(actor) FROM reparto GROUP BY actor) AS todo;


--Indicar las películas estrenadas entre los años 1990 y 1999 (ambos incluidos) ordenadas portítulo de manera ascendente.
SELECT pelicula, a_estreno FROM peliculas WHERE a_estreno <= 1999 AND a_estreno >= 1990 ORDER BY pelicula ASC;


-- Listar el reparto de las películas lanzadas el año 2001
SELECT pelicula, a_estreno, actor FROM peliculas INNER JOIN reparto ON peliculas.id = reparto.movie WHERE a_estreno = 2001:
-- Eliminado las peliculas animadas
SELECT pelicula, a_estreno, actor FROM peliculas INNER JOIN reparto ON peliculas.id = reparto.movie WHERE a_estreno = 2001 AND actor <> 'Animada';



-- Listar los actores de la película más nueva
SELECT pelicula, a_estreno, actor FROM peliculas INNER JOIN reparto ON peliculas.id = reparto.movie WHERE a_estreno IN (SELECT MAX(a_estreno) AS maximo FROM peliculas);
-- Eliminado las peliculas animadas
SELECT pelicula, a_estreno, actor FROM peliculas INNER JOIN reparto ON peliculas.id = reparto.movie WHERE a_estreno IN (SELECT MAX(a_estreno) AS maximo FROM peliculas) AND actor <> 'Animada';;
