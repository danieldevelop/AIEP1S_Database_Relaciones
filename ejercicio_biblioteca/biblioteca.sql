-- Active: 1680928443591@@127.0.0.1@3306@biblioteca
create database if not exists biblioteca;
-- use biblioteca;

create table if not exists usuario(
    codigo varchar(10) primary key,
    nombre varchar(50),
    direccion varchar(100),
    telefono integer
);

create table if not exists libro(
    codigo varchar(10) primary key,
    tipo varchar(50),
    isbn varchar(13),
    editorial varchar(50),
    numero_paginas integer
);

create table if not exists ficha_autor(
    codigo varchar(10) primary key,
    nombre varchar(50)
);

create table if not exists ejemplar(
    codigo varchar(10) primary key,
    localizacion varchar(12),
    codigo_libro varchar(10),
    constraint fk_3 foreign key(codigo_libro) references libro(codigo)
);

create table if not exists libro_autor(
    codigo_libro varchar(10),
    codigo_autor varchar(10),
    constraint fk_1 foreign key(codigo_libro) references libro(codigo),
    constraint fk_2 foreign key(codigo_autor) references ficha_autor(codigo),
    constraint pk_1 primary key(codigo_libro, codigo_autor)
);

create table if not exists ejemplar_usuario(
    fecha_prestamo date,
    fecha_devolucion date,
    codigo_ejemplar varchar(10),
    codigo_usuario varchar(10),
    constraint fk_4 foreign key(codigo_ejemplar) references ejemplar(codigo),
    constraint fk_5 foreign key(codigo_usuario) references usuario(codigo),
    constraint pk_2 primary key(codigo_ejemplar, codigo_usuario)
);


-- Volcado de datos de prueba
insert into usuario values('USU4578', 'Claudio Cardenas', 'Los Olmos #4567 Santiago', 995678234);
insert into usuario values('USU4579', 'Hugo Palacios', 'República #45 Santiago', 992345098);
insert into usuario values('USU4580', 'Diego Andrade', 'Av. Providencia #5678 Providencia', 990987654);

insert into libro values('LI3456', 'Bases de Datos Relacionales', 'RE00099922223', 'Marcombo', 456);
insert into libro values('LI3460', 'Cálculo Diferencial e Integral', 'CA00456789012', 'McGraw-Hill', 780);
insert into libro values('LI3470', 'Física Básica', 'FI12345678901', 'Antártida', 560);

insert into ficha_autor values('ARS2079', 'Luis Gonzalez');
insert into ficha_autor values('LMK3456', 'Juan Perez');
insert into ficha_autor values('OPR6745', 'Raúl Munita');

insert into ejemplar values('EJ3456', 'MUEBLE45', 'LI3456');
insert into ejemplar values('EJ3457', 'MUEBLE46', 'LI3460');
insert into ejemplar values('EJ3458', 'MUEBLE47', 'LI3470');

insert into libro_autor values('LI3470', 'ARS2079');
insert into libro_autor values('LI3460', 'LMK3456');
insert into libro_autor values('LI3456', 'OPR6745');

insert into ejemplar_usuario values('2019-09-12', '2019-12-16', 'EJ3456', 'USU4578');
insert into ejemplar_usuario values('2019-01-24', '2019-01-26', 'EJ3457', 'USU4579');
insert into ejemplar_usuario values('2019-12-05', '2019-09-12', 'EJ3458', 'USU4580');


-- EJERCICIO:
-- Escribir una consulta select que muestre los datos codigo, usuario, nombre de usuario, ejemplar y fecha
-- de prestamo de las tablas ejemplar, usuario, ejemplar_usuario
select us.codigo, us.nombre, ej.codigo, eu.fecha_prestamo
from ejemplar ej, usuario us, ejemplar_usuario eu
where ej.codigo = eu.codigo_ejemplar and eu.codigo_usuario = us.codigo;
