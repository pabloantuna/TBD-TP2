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
INSERT INTO Autor (nombre, apellido, nacionalidad, residencia) VALUES ('Abelardo', 'Castillo', 'argentina', 'San Pedro');
INSERT INTO Autor (nombre, apellido, nacionalidad, residencia) VALUES ('Jane', 'Austen', 'inglesa', 'Steventon');
INSERT INTO Autor (nombre, apellido, nacionalidad, residencia) VALUES ('Jorge Luis', 'Borges', 'argentina', 'Buenos Aires');
INSERT INTO Autor (nombre, apellido, nacionalidad, residencia) VALUES ('Ernest', 'Hemingway', 'estadounidense', 'Illinois');

/* En la tabla Libro */
INSERT INTO Libro (isbn, titulo, editorial, precio) VALUES ('9789500411110', 'Cronica de un iniciado', 'UNR', 100);
INSERT INTO Libro (isbn, titulo, editorial, precio) VALUES ('9789507312267', 'El evangelio segun Van Hutten', 'Planeta', 200);
INSERT INTO Libro (isbn, titulo, editorial, precio) VALUES ('9789500803359', 'Orgullo y Prejuicio', 'Atlantida', 250);
INSERT INTO Libro (isbn, titulo, editorial, precio) VALUES ('9789870408543', 'Emma', 'UNR', 150);
INSERT INTO Libro (isbn, titulo, editorial, precio) VALUES ('9789500401906', 'El libro de arena', 'UNR', 169);
INSERT INTO Libro (isbn, titulo, editorial, precio) VALUES ('9789500416276', 'Elogio de la sombra', 'Emece', 142);
INSERT INTO Libro (isbn, titulo, editorial, precio) VALUES ('9789507428739', 'El viejo y el mar', 'Planeta', 120);
INSERT INTO Libro (isbn, titulo, editorial, precio) VALUES ('9789503701386', 'Paris era una fiesta', 'Planeta', 300);

/* En la tabla Escribe */
INSERT INTO Escribe (id, isbn, ano) VALUES ((SELECT id FROM Autor WHERE nombre = 'Abelardo' AND apellido = 'Castillo'), '9789500411110', 1991);
INSERT INTO Escribe (id, isbn, ano) VALUES ((SELECT id FROM Autor WHERE nombre = 'Abelardo' AND apellido = 'Castillo'), '9789507312267', 1998);
INSERT INTO Escribe (id, isbn, ano) VALUES ((SELECT id FROM Autor WHERE nombre = 'Jane' AND apellido = 'Austen'), '9789500803359', 1814);
INSERT INTO Escribe (id, isbn, ano) VALUES ((SELECT id FROM Autor WHERE nombre = 'Jane' AND apellido = 'Austen'), '9789870408543', 1815);
INSERT INTO Escribe (id, isbn, ano) VALUES ((SELECT id FROM Autor WHERE nombre = 'Jorge Luis' AND apellido = 'Borges'), '9789500401906', 1998);
INSERT INTO Escribe (id, isbn, ano) VALUES ((SELECT id FROM Autor WHERE nombre = 'Jorge Luis' AND apellido = 'Borges'), '9789500416276', 1985);
INSERT INTO Escribe (id, isbn, ano) VALUES ((SELECT id FROM Autor WHERE nombre = 'Ernest' AND apellido = 'Hemingway'), '9789507428739', 1998);
INSERT INTO Escribe (id, isbn, ano) VALUES ((SELECT id FROM Autor WHERE nombre = 'Ernest' AND apellido = 'Hemingway'), '9789503701386', 1983);

/* Ejercicio 4 */

/* Apartado a */
UPDATE Autor
SET residencia = 'Buenos Aires'
WHERE nombre = 'Abelardo'
AND apellido = 'Castillo';
/* Apartado b */
UPDATE Libro
SET precio = 1.1 * precio
WHERE editorial = 'UNR';
/* Apartado c */
UPDATE Libro
SET precio = 1.1 * precio
WHERE (SELECT nacionalidad FROM Autor WHERE Autor.id = (SELECT Escribe.id FROM Escribe WHERE Escribe.isbn = Libro.isbn)) <> 'argentina' AND precio > 200;

UPDATE Libro
SET precio = 1.2 * precio
WHERE (SELECT nacionalidad FROM Autor WHERE Autor.id = (SELECT Escribe.id FROM Escribe WHERE Escribe.isbn = Libro.isbn)) <> 'argentina' AND precio <= 200
/* Apartado d */
DELETE FROM Libro
WHERE isbn IN (SELECT isbn FROM Escribe WHERE ano = 1998);