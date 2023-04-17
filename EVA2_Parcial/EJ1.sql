-- Active: 1680928443591@@127.0.0.1@3306@organizacion_empresa
-- PRUEBA PARCIAL 2 - Instituto AIEP
-- Organizacion de una empresa
-- Database organizacion_empresa
--
-- @author Daniel Gómez <dgomez.informatica@gmail.com>

CREATE DATABASE IF NOT EXISTS organizacion_empresa;
-- USE organizacion_empresa;

CREATE TABLE IF NOT EXISTS centro_trabajo(
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(45),
    direccion VARCHAR(45),
    num_trabajadores INT
);

CREATE TABLE IF NOT EXISTS habilidad(
    codigo VARCHAR(10) PRIMARY KEY,
    descripcion VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS empleado(
    rut varchar(15) PRIMARY KEY,
    nombre VARCHAR(45),
    salario FLOAT,
    telefono INT,
    num_hijos INT,
    fecha_alta DATE DEFAULT now(),
    codigo_centro_trabajo VARCHAR(10),
    CONSTRAINT fk_1 FOREIGN KEY(codigo_centro_trabajo) REFERENCES centro_trabajo(codigo)
);

CREATE TABLE IF NOT EXISTS departamento(
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(45),
    presupuesto_anual VARCHAR(45),
    codigo_centro_trabajo VARCHAR(10),
    CONSTRAINT fk_2 FOREIGN KEY(codigo_centro_trabajo) REFERENCES centro_trabajo(codigo)
);

CREATE TABLE IF NOT EXISTS hijo(
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(45),
    fecha_nac DATE DEFAULT now(),
    rut_empleado VARCHAR(15),
    CONSTRAINT fk_3 FOREIGN KEY(rut_empleado) REFERENCES empleado(rut)
);

CREATE TABLE IF NOT EXISTS empleado_has_habilidad(
    id INT PRIMARY KEY AUTO_INCREMENT,
    rut_empleado VARCHAR(15),
    codigo_habilidad VARCHAR(10),
    CONSTRAINT fk_4 FOREIGN KEY(rut_empleado) REFERENCES empleado(rut),
    CONSTRAINT fk_5 FOREIGN KEY(codigo_habilidad) REFERENCES habilidad(codigo)
);