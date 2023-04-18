-- Active: 1680928443591@@127.0.0.1@3306@cine_aiep

-- PRUEBA PARCIAL 2 - Instituto AIEP
-- Consultas SQL 
-- Database cine_aiep
--
-- @author Daniel Gómez <dgomez.informatica@gmail.com>

CREATE DATABASE IF NOT EXISTS cine_aiep;
-- USE cine_aiep;


CREATE TABLE IF NOT EXISTS pelicula(
    cod_pelicula VARCHAR(10) PRIMARY KEY,
    titulo VARCHAR(50) NOT NULL,
    anio INTEGER NOT NULL,
    minutos_duracion INTEGER NOT NULL,
    precio_arriendo INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS cliente(
    cod_cliente INTEGER PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    apellidos VARCHAR(45) NOT NULL,
    rut VARCHAR(10) NOT NULL,
    telefono INTEGER NOT NULL,
    direccion INTEGER NOT NULL
);
-- Cambiar el tipo de dato a una columna
--ALTER TABLE cliente CHANGE direccion direccion VARCHAR(45) NOT NULL;

CREATE TABLE IF NOT EXISTS arriendo(
    cod_arriendo INTEGER PRIMARY KEY,
    fecha_arriendo DATE NOT NULL,
    fecha_devolucion DATE NOT NULL,
    cod_cliente INTEGER,
    cod_pelicula VARCHAR(10),
    CONSTRAINT fk_1 FOREIGN KEY (cod_cliente) REFERENCES cliente(cod_cliente),
    CONSTRAINT fk_2 FOREIGN KEY (cod_pelicula) REFERENCES pelicula(cod_pelicula)
);


-- VOLCADOS DE DATOS DE PRUEBA
INSERT INTO pelicula(cod_pelicula, titulo, anio, minutos_duracion, precio_arriendo) VALUES 
    ('A127', 'La momía', 2012, 60, 4500),
    ('A890', 'Avatar 1', 2010, 120, 3652),
    ('C9823', 'El señor de los anillos', 2001, 210, 5500);

INSERT INTO cliente(cod_cliente, nombre, apellidos, rut, telefono, direccion) VALUES
    (1, 'Samuel', 'Zuñiga Londres', '56881249', 3173394, 'Alameda 123'),
    (2, 'Victor', 'Hugo Saavedra', '54585269', 3173394, 'Alameda 123'),
    (3, 'Osvaldo', 'Talamilla Lobe', '175881260', 3173394, 'Alameda 123');

INSERT INTO arriendo(cod_arriendo, fecha_arriendo, fecha_devolucion, cod_cliente, cod_pelicula) VALUES
    (1, '2021-05-12', '2021-05-30', 1, 'A127'),
    (2, '2021-06-20', '2021-06-28', 2, 'A890'),
    (3, '2021-06-20', '2021-06-25', 3, 'C9823');





-- Ejercicioq a.
-- Título de las películas y todos los datos de los cliente que las arrendaron. (10 puntos)
SELECT pel.titulo, cli.nombre, cli.apellidos, cli.rut, cli.telefono, cli.direccion
FROM pelicula pel, cliente cli, arriendo arr
WHERE pel.cod_pelicula = arr.cod_pelicula 
    AND arr.cod_cliente = cli.cod_cliente;
--    AND pel.titulo LIKE 'la mom%';

-- Ejercicio b.
-- Código de arriendo (cod_arriendo) y nombre de los cliente que arrendaron alguna película. (10 puntos)
SELECT arr.cod_arriendo, cli.nombre
FROM arriendo arr, cliente cli
WHERE arr.cod_cliente = cli.cod_cliente;

-- Ejercicio c.
-- Código de arriendo (cod_arriendo) y títulos de la películas arrendadas. (10 puntos)
SELECT arr.cod_arriendo, pel.titulo
FROM arriendo arr, pelicula pel
WHERE arr.cod_pelicula = pel.cod_pelicula;

-- Ejercicio d.
-- Código de arriendo (cod_arriendo), fecha_arriendo, fecha_devolucion, nombre y apellido de los clientes que arrendaron alguna película. (10 puntos)
SELECT arr.cod_arriendo, arr.fecha_arriendo, arr.fecha_devolucion, cli.nombre, cli.apellidos
FROM arriendo arr, cliente cli
WHERE arr.cod_cliente = cli.cod_cliente;
