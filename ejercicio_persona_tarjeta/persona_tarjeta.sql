-- Active: 1680928443591@@127.0.0.1@3306@persona_tarjeta
create database if not exists persona_tarjeta;
-- use persona_tarjeta;

create table if not exists persona(
    rut varchar(10) primary key,
    nombre varchar(50),
    direccion varchar(100),
    telefono integer,
    email varchar(40)
);

create table if not exists tarjeta_debito(
    numero integer primary key,
    titular varchar(50),
    fecha_vencimiento date,
    tipo varchar(12),
    rut varchar(10),
    constraint fk_1 foreign key(rut) references persona(rut)
);
