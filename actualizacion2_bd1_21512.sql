DROP DATABASE IF EXISTS dbCpsl;
CREATE DATABASE dbCpsl
DEFAULT CHARACTER SET utf8;
USE dbCpsl;

-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-10-12 03:20:23.26

-- tables
-- Table: DATOS_USUARIO
CREATE TABLE DATOS_USUARIO (
    id int  NOT NULL COMMENT 'identificador unico de la tabla DATOS_USUARIOS',
    nombre varchar(80)  NOT NULL COMMENT 'contiene el nombre del usuario',
    apellido varchar(80)  NOT NULL COMMENT 'contiene el apellido del usuario',
    edad int  NOT NULL COMMENT 'contiene la edad del usuario',
    Gmail varchar(90)  NOT NULL COMMENT 'contiene el correo electronico del ususario',
    CONSTRAINT DATOS_USUARIO_pk PRIMARY KEY (id)
) COMMENT 'contiene los datos de los usuarios';

-- Table: DETALLE_MENSAJE
CREATE TABLE DETALLE_MENSAJE (
    id int  NOT NULL COMMENT 'identificador unico de la tabla DETALLE_MENSAJE',
    fecha_hora int  NOT NULL COMMENT 'contiene la hora y fecha especifica en la que se envio el mensaje',
    CONSTRAINT DETALLE_MENSAJE_pk PRIMARY KEY (id)
) COMMENT 'contiene los datos detallados de la tabla mensaje';

-- Table: MENSAJE
CREATE TABLE MENSAJE (
    id int  NOT NULL COMMENT 'identificador unico de la tabla MENSAJE',
    mensaje varchar(250)  NOT NULL COMMENT 'contiene el mensaje que quiera colocar el usuario como alguna opinion o duda.',
    DATOS_USUARIO_id int  NOT NULL,
    DETALLE_MENSAJE_id int  NOT NULL,
    CONSTRAINT MENSAJE_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: MENSAJE_DATOS_USUARIO (table: MENSAJE)
-- foreign keys
-- Reference: MENSAJE_DATOS_USUARIO (table: MENSAJE)
ALTER TABLE MENSAJE ADD CONSTRAINT MENSAJE_DATOS_USUARIO FOREIGN KEY MENSAJE_DATOS_USUARIO (DATOS_USUARIO_id)
    REFERENCES DATOS_USUARIO (id);

-- Reference: MENSAJE_DETALLE_MENSAJE (table: MENSAJE)
ALTER TABLE MENSAJE ADD CONSTRAINT MENSAJE_DETALLE_MENSAJE FOREIGN KEY MENSAJE_DETALLE_MENSAJE (DETALLE_MENSAJE_id)
    REFERENCES DETALLE_MENSAJE (id);

-- End of file.


-- End of file.

-- INSERTAMOS 10 REGISTROS 
INSERT INTO DATOS_USUARIO 
(id ,nombre ,apellido ,edad ,gmail)
VALUE 
(1, 'Juan', 'Pérez', 25, 'juanperez@gmail.com'),
(2, 'María', 'González', 30, 'mariagonzalez@gmail.com'),
(3, 'Pedro', 'Ramírez', 40, 'pedroramirez@gmail.com'),
(4, 'Ana', 'Sánchez', 28, 'anasanchez@gmail.com'),
(5, 'Luis', 'Martínez', 35, 'luismartinez@gmail.com'),
(6, 'Lucía', 'Fernández', 22, 'luciafernandez@gmail.com'),
(7, 'Manuel', 'García', 45, 'manuelgarcia@gmail.com'),
(8, 'Laura', 'Díaz', 27, 'lauradiaz@gmail.com'),
(9, 'Javier', 'López', 33, 'javierlopez@gmail.com'),
(10, 'Carmen', 'Ruiz', 31, 'carmenruiz@gmail.com');

SELECT * FROM DATOS_USUARIO;

-- REALIZAMOS 5 UPDATE
UPDATE DATOS_USUARIO SET gmail = 'JuancitoTowers_correo@gmail.com' WHERE id = 1;
UPDATE DATOS_USUARIO SET apellido = 'Genaro' WHERE id = 5;
UPDATE DATOS_USUARIO SET edad = 50 WHERE id = 7;
UPDATE DATOS_USUARIO SET gmail = 'laurita@gmail.com', edad = 30 WHERE id = 8;
UPDATE DATOS_USUARIO SET edad = 20 WHERE id = 1;

-- RELIZAMOS 5 LISTADOS
-- LISTAR TODOS LOS REGISTROS
SELECT * FROM DATOS_USUARIO;
-- LISTAR NOMBRE Y APELLIDO MAYORES A 30 AÑOS
SELECT nombre, apellido FROM DATOS_USUARIO WHERE edad > 30;
-- LISTAR LOS GMAIL
SELECT gmail FROM DATOS_USUARIO WHERE nombre LIKE '%a%';
-- LISTAR NOMBRE Y APELLIDO
SELECT nombre, apellido FROM DATOS_USUARIO ORDER BY apellido ASC;
-- LISTAR NUMERO TOTAL DE USUARIOS
SELECT COUNT(*) FROM DATOS_USUARIO;

-- 5 ejemplos de eliminar
-- ELIMINACIÓN DE USUARIO CON EL ID 5
DELETE FROM DATOS_USUARIO WHERE id = 5;
DELETE FROM DATOS_USUARIO WHERE nombre = 'Juan' AND gmail = 'juanperez@gmail.com';
DELETE FROM DATOS_USUARIO WHERE gmail = 'pedroramirez@gmail.com';
DELETE FROM DATOS_USUARIO WHERE apellido = 'Ramírez';
DELETE FROM DATOS_USUARIO WHERE gmail = 'pedroramirez@gmail.com';