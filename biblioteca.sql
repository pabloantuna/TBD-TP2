/*
Integrantes:
Antuña Pablo - Legajo: A-4288/9
Garavano Lautaro - Legajo: G-5582/4
*/
/* Ejercicio 1 */

CREATE DATABASE IF NOT EXISTS pantuna_Biblioteca;

USE pantuna_Biblioteca;

DROP TABLE IF EXISTS Escribe;
DROP TABLE IF EXISTS Autor;
DROP TABLE IF EXISTS Libro;

CREATE TABLE Autor (
    id                  INT             NOT NULL        AUTO_INCREMENT,
    nombre              VARCHAR(20)     NOT NULL,
    apellido            VARCHAR(30)     NOT NULL,
    nacionalidad        VARCHAR(20)     NOT NULL,
    residencia          VARCHAR(20)     NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Libro (
    isbn                VARCHAR(13)     NOT NULL,
    titulo              VARCHAR(100)    NOT NULL,
    editorial           VARCHAR(30)     NOT NULL,
    precio              INT UNSIGNED    NOT NULL,
    PRIMARY KEY (isbn)
);

CREATE TABLE Escribe (
    id                  INT             NOT NULL,
    isbn                VARCHAR(13)     NOT NULL,
    ano                 INT             NOT NULL,
    PRIMARY KEY (id, isbn),
    FOREIGN KEY (id) REFERENCES Autor(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (isbn) REFERENCES Libro(isbn) ON DELETE CASCADE ON UPDATE CASCADE
);

/* Ejercicio 2 */
CREATE INDEX apellido_idx ON Autor(apellido);
CREATE INDEX titulo_idx ON Libro(titulo);
/* Ejercicio 3 */

/* En la tabla Autor */
INSERT INTO Autor (nombre, apellido, nacionalidad, residencia) VALUES ('Abelardo', 'Castillo', 'Argentino', 'San Pedro');
/*INSERT INTO Autor (nombre, apellido, nacionalidad, residencia) VALUES ('', '', '', '');
INSERT INTO Autor (nombre, apellido, nacionalidad, residencia) VALUES ('', '', '', '');*/

/* En la tabla Libro */
INSERT INTO Libro (isbn, titulo, editorial, precio) VALUES ('9789500411110', 'Cronica de un iniciado', 'UNR', 100);
/*INSERT INTO Libro;
INSERT INTO Libro;*/

/* En la tabla Escribe */
INSERT INTO Escribe (id, isbn, ano) VALUES ((SELECT id FROM Autor WHERE nombre = 'Abelardo' AND apellido = 'Castillo'), '9789500411110', 1991);
/*INSERT INTO Escribe;
INSERT INTO Escribe;*/

/* Ejercicio 4 */

/* Apartado a */
UPDATE Autor
SET residencia = 'Buenos Aires'
WHERE nombre = 'Abelardo'
AND apellido = 'Castillo';
/* Apartado b */
UPDATE Libro l1
SET precio = 1.1 * precio
WHERE editorial = 'UNR';
/* Apartado c */
/*UPDATE ;*/
/* Apartado d */
/*DELETE ;*/