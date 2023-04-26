-- Active: 1680928443591@@127.0.0.1@3306@conflictos_belicos

-- PRUEBA PARCIAL 2 - Instituto AIEP
-- Conflicos Belicos
-- Database conflictos_belicos
--
-- @author Daniel Gómez <dgomez.informatica@gmail.com>

CREATE DATABASE IF NOT EXISTS conflictos_belicos;
-- USE conflictos_belicos;

CREATE TABLE IF NOT EXISTS organizacion_mediadora(
    codigo VARCHAR(5) PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    tipo VARCHAR(45) NOT NULL,
    organizacion_depende VARCHAR(45) NOT NULL,
    numero_personas INTEGER NOT NULL,
    tipo_ayuda VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS guerra(
    codigo VARCHAR(5) PRIMARY KEY,
    paises VARCHAR(45) NOT NULL,
    numero_muertos INTEGER NOT NULL,
    numero_heridos INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS grupo_armado(
    codigo VARCHAR(5) PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    fecha_entrada DATE NOT NULL,
    fecha_salida DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS traficante(
    traficante_id VARCHAR(5) PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    cantidad_armas INT NOT NULL,
    cantidad_armas_tipo INT NOT NULL,
    numero_total_armas_entregada INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS territoriales(
    territoriales_id VARCHAR(5) PRIMARY KEY,
    regiones_afectadas VARCHAR(45) NOT NULL,
    gue_codigo VARCHAR(5),
    CONSTRAINT fk1_gue_codigo FOREIGN KEY(gue_codigo) REFERENCES guerra(codigo)
);

CREATE TABLE IF NOT EXISTS religiosos(
    religiosos_id VARCHAR(5) PRIMARY KEY,
    religiosos_afectadas VARCHAR(30) NOT NULL,
    gue_codigo VARCHAR(5),
    CONSTRAINT fk2_gue_codigo FOREIGN KEY(gue_codigo) REFERENCES guerra(codigo)
);

CREATE TABLE IF NOT EXISTS economicos(
    economicos_id VARCHAR(5) PRIMARY KEY,
    materias_primas VARCHAR(45) NOT NULL,
    gue_codigo VARCHAR(5),
    CONSTRAINT fk3_gue_codigo FOREIGN KEY(gue_codigo) REFERENCES guerra(codigo)
);

CREATE TABLE IF NOT EXISTS raciales(
    raciales_id VARCHAR(5) PRIMARY KEY,
    etnias_afectadas VARCHAR(45) NOT NULL,
    gue_codigo VARCHAR(5),
    CONSTRAINT fk4_gue_codigo FOREIGN KEY(gue_codigo) REFERENCES guerra(codigo)
);

CREATE TABLE IF NOT EXISTS divisiones(
    divisiones_id INT PRIMARY KEY,
    numero_barcos INT NOT NULL,
    numero_tanques INT NOT NULL,
    numero_aviones INT NOT NULL,
    hombre_disponible INT NOT NULL,
    numero_bajas_hombres INT NOT NULL,
    gru_arm_codigo VARCHAR(5),
    CONSTRAINT fk5_gru_arm_codigo FOREIGN KEY(gru_arm_codigo) REFERENCES grupo_armado(codigo)
);

CREATE TABLE IF NOT EXISTS jefe_militar(
    codigo VARCHAR(5) PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    rango VARCHAR(45) NOT NULL,
    divisiones_id INT,
    CONSTRAINT fk6_divisiones_id FOREIGN KEY(divisiones_id) REFERENCES divisiones(divisiones_id)
);

CREATE TABLE IF NOT EXISTS lider_politico(
    liderpolitico_id VARCHAR(5) PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    apoyos VARCHAR(45) NOT NULL,
    gru_arm_codigo VARCHAR(5),
    CONSTRAINT fk7_gru_arm_codigo FOREIGN KEY(gru_arm_codigo) REFERENCES grupo_armado(codigo)
);

CREATE TABLE IF NOT EXISTS tipo_arma(
    tipoarma_id VARCHAR(5) PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    indicador_destructivo INT NOT NULL,
    traficante_id VARCHAR(5),
    CONSTRAINT fk8_traficante_id FOREIGN KEY(traficante_id) REFERENCES traficante(traficante_id)
);

CREATE TABLE IF NOT EXISTS organizacion_mediadora_has_guerra(
    id INT AUTO_INCREMENT,
    org_med_cod VARCHAR(5),
    gue_codigo VARCHAR(5),
    CONSTRAINT fk9_org_med_cod FOREIGN KEY(org_med_cod) REFERENCES organizacion_mediadora(codigo),
    CONSTRAINT fk10_gue_codigo FOREIGN KEY(gue_codigo) REFERENCES guerra(codigo),
    CONSTRAINT pk1_id PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS guerra_has_grupo_armado(
    id INT AUTO_INCREMENT,
    gue_codigo VARCHAR(5),
    gru_arm_codigo VARCHAR(5),
    CONSTRAINT fk11_gue_codigo FOREIGN KEY(gue_codigo) REFERENCES guerra(codigo),
    CONSTRAINT fk12_gru_arm_codigo FOREIGN KEY(gru_arm_codigo) REFERENCES grupo_armado(codigo),
    CONSTRAINT pk2_id PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS traficante_has_grupo_armado(
    id INT AUTO_INCREMENT,
    traficante_id VARCHAR(5),
    gru_arm_codigo VARCHAR(5),
    CONSTRAINT fk13_traficante_id FOREIGN KEY(traficante_id) REFERENCES traficante(traficante_id),
    CONSTRAINT fk14_gru_arm_codigo FOREIGN KEY(gru_arm_codigo) REFERENCES grupo_armado(codigo),
    CONSTRAINT pk3_id PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS jefe_militar_has_lider_politico(
    id INT AUTO_INCREMENT,
    liderpolitico_id VARCHAR(5),
    jef_mil_codigo VARCHAR(5),
    CONSTRAINT fk15_liderpolitico_id FOREIGN KEY(liderpolitico_id) REFERENCES lider_politico(liderpolitico_id),
    CONSTRAINT fk16_jef_mil_codigo FOREIGN KEY(jef_mil_codigo) REFERENCES jefe_militar(codigo),
    CONSTRAINT pk4_id PRIMARY KEY(id)
);


# VOCADO DE DATOS
INSERT INTO organizacion_mediadora VALUES ('t6nge', 'claes', 'ecogia social', 'organizacion independiente', 1400, 'humanitaria');
INSERT INTO organizacion_mediadora VALUES ('p9xqw', 'ican', 'armas nucleares','organizacion independiente', 35000, 'politica');


INSERT INTO guerra VALUES ('ucqo6', 'irak', 30, 5);
INSERT INTO guerra VALUES ('qshq9', 'siria', 100, 32);


INSERT INTO grupo_armado VALUES ('i9z0q', 'g421 artilleria', '2020-02-16', '2020-07-08');
INSERT INTO grupo_armado VALUES ('gb9q0', 'g25 Infanteria', '2020-03-07', '2020-03-22');


INSERT INTO traficante VALUES ('7lq8t', 'andres muñoz', 5, 3, 8);
INSERT INTO traficante VALUES ('gxpop', 'felipe montenegro', 9, 3, 10);


INSERT INTO territoriales VALUES ('n7m1z', 'mesopotamia superior', 'ucqo6');
INSERT INTO territoriales VALUES ('r6xbc', 'el libano', 'qshq9');


INSERT INTO religiosos VALUES ('e8ime', 'islam', 'ucqo6');
INSERT INTO religiosos VALUES ('qt2rp', 'islam', 'qshq9');


INSERT INTO economicos VALUES ('2m81b', 'petroleo', 'ucqo6');
INSERT INTO economicos VALUES ('bghzn', 'minerales', 'qshq9');


INSERT INTO raciales VALUES ('9vc5a', 'los arabes', 'ucqo6');
INSERT INTO raciales VALUES ('d4u4g', 'los shabiha', 'qshq9');


INSERT INTO divisiones VALUES (1, 30, 50, 20, 100, 10, 'i9z0q');
INSERT INTO divisiones VALUES (2, 10, 25, 50, 100, 5, 'gb9q0');


INSERT INTO jefe_militar VALUES ('ul2cs', 'victor saavedra', 'coronel', 1);
INSERT INTO jefe_militar VALUES ('8lb4n', 'daniel gomez', 'teniente coronel', 2);


INSERT INTO lider_politico VALUES ('6st41', 'nelson mandela', 'organizacion paramilitar', 'i9z0q');
INSERT INTO lider_politico VALUES ('vsc84', 'mao zending', 'organizacion terrorista', 'gb9q0');


INSERT INTO tipo_arma VALUES ('qswc0', 'rifles', 20, '7lq8t');
INSERT INTO tipo_arma VALUES ('hfwus', 'escopetas', 50, 'gxpop');


INSERT INTO organizacion_mediadora_has_guerra(org_med_cod, gue_codigo) VALUES ('t6nge', 'ucqo6');
INSERT INTO organizacion_mediadora_has_guerra(org_med_cod, gue_codigo) VALUES ('p9xqw', 'qshq9');


INSERT INTO guerra_has_grupo_armado(gue_codigo, gru_arm_codigo) VALUES ('ucqo6', 'i9z0q');
INSERT INTO guerra_has_grupo_armado(gue_codigo, gru_arm_codigo) VALUES ('qshq9', 'gb9q0');


INSERT INTO traficante_has_grupo_armado(traficante_id, gru_arm_codigo) VALUES ('7lq8t', 'i9z0q');
INSERT INTO traficante_has_grupo_armado(traficante_id, gru_arm_codigo) VALUES ('gxpop', 'gb9q0');


INSERT INTO jefe_militar_has_lider_politico(liderpolitico_id, jef_mil_codigo) VALUES ('6st41', 'ul2cs');
INSERT INTO jefe_militar_has_lider_politico(liderpolitico_id, jef_mil_codigo) VALUES ('vsc84', '8lb4n');




# CONSULTAS
SELECT nombre, paises, numero_muertos, numero_heridos
FROM guerra, grupo_armado, guerra_has_grupo_armado
WHERE guerra.codigo = guerra_has_grupo_armado.gue_codigo 
    AND grupo_armado.codigo = guerra_has_grupo_armado.gru_arm_codigo;

SELECT gu.codigo, gu.paises, te.regiones_afectadas, gu.numero_muertos
FROM guerra gu, territoriales te
WHERE gu.codigo = te.gue_codigo;

SELECT jm.nombre, jm.rango, di.numero_barcos, di.numero_tanques, di.numero_aviones, gr.nombre "GRUPO ARMADO"
FROM jefe_militar jm, divisiones di, grupo_armado gr
WHERE di.divisiones_id = jm.divisiones_id 
    AND gr.codigo = di.gru_arm_codigo AND rango='coronel';

SELECT tr.traficante_id, tr.nombre, gr.nombre "GRUPO ARMADO", tr.cantidad_armas, tr.cantidad_armas_tipo, tip.nombre "ARMA", tip.indicador_destructivo
FROM traficante tr, grupo_armado gr, tipo_arma tip, traficante_has_grupo_armado tga
WHERE tr.traficante_id = tga.traficante_id AND gr.codigo = tga.gru_arm_codigo AND tr.traficante_id = tip.traficante_id



