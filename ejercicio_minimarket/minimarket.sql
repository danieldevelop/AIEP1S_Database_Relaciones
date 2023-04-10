-- Active: 1680928443591@@127.0.0.1@3306@minimarket
CREATE DATABASE IF NOT EXISTS minimarket;
-- USE minimarket;

CREATE TABLE IF NOT EXISTS producto(
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(10) NOT NULL, -- cuidado con la longitud
    descripcion VARCHAR(100) NOT NULL,
    marca VARCHAR(30) NOT NULL,
    grs_cc INTEGER NOT NULL,
    precio INTEGER NOT NULL,
    stock INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS boleta(
    numero INTEGER PRIMARY KEY,
    total INTEGER NOT NULL,
    fecha DATE NOT NULL,
    detalle VARCHAR(100) NOT NULL,
    descripcion VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS venta(
    numero INTEGER PRIMARY KEY,
    total INTEGER NOT NULL,
    detalle VARCHAR(100) NOT NULL,
    fecha DATE NOT NULL,
    hora VARCHAR(5) NOT NULL,
    vendedor VARCHAR(30) NOT NULL,
    descuento VARCHAR(30) NOT NULL,
    numero_boleta INTEGER,
    CONSTRAINT fk_1 FOREIGN KEY(numero_boleta) REFERENCES boleta(numero)
);

CREATE TABLE IF NOT EXISTS producto_venta(
    codigo VARCHAR(10),
    numero INTEGER,
    CONSTRAINT fk_2 FOREIGN KEY(codigo) REFERENCES producto(codigo),
    CONSTRAINT fk_3 FOREIGN KEY(numero) REFERENCES venta(numero),
    CONSTRAINT pk_1 PRIMARY KEY(codigo, numero)
);

-- VOLCADO DE DATOS DE PRUEBA
INSERT INTO producto(codigo, nombre, descripcion, marca, grs_cc, precio, stock) VALUES
    ('AR3467', 'Tallarines N°5', 'Tallarines listos para preparar', 'luchetti', 250, 1300, 200),
    ('TA2345', 'Salsa de tomate', 'Salsa lista para servir', 'El Vergel', 350, 1000, 320);

INSERT INTO boleta(numero, total, fecha, detalle, descripcion) VALUES
    (120, 4500, '2020-05-20', 'Minimarket Susana', 'Venta al por menor'),
    (121, 2200, '2020-05-27', 'Minimarket Susana', 'Venta al por menor');

INSERT INTO venta(numero, total, detalle, fecha, hora, vendedor, descuento, numero_boleta) VALUES
    (47, 4500, 'Venta al detalle', '2020-05-26', '09:15', 'Carlos Pinto', 0, 120),
    (48, 2200, 'Venta al detalle', '2020-05-27', '10:00', 'Carlos Pinto', 5, 121);

INSERT INTO producto_venta(codigo, numero) VALUES
    ('AR3467', 47),
    ('TA2345', 48);
