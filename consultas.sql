/*
Integrantes:
Antuña Pablo - Legajo: A-4288/9
Garavano Lautaro - Legajo: G-5582/4
*/

/* Ejercicio 5 */

/* Apartado a */
SELECT nombre FROM Persona WHERE
codigo IN (SELECT codigo FROM Propietario);

/* Apartado b */
SELECT codigo FROM Inmueble WHERE precio >= 600000 AND precio <= 700000;

/* Apartado c */
SELECT nombre FROM Persona
WHERE Persona.codigo IN
    (SELECT Cliente.codigo FROM Cliente
     WHERE Cliente.codigo IN (SELECT codigo_cliente FROM PrefiereZona) AND Cliente.codigo NOT IN
        (SELECT codigo_cliente FROM PrefiereZona
         WHERE NOT (nombre_poblacion = 'Santa Fe' AND nombre_zona = 'Norte')));

/* Apartado d */
SELECT nombre FROM Persona WHERE
codigo IN (SELECT vendedor FROM Cliente WHERE
EXISTS (SELECT * FROM PrefiereZona WHERE
        codigo_cliente = Cliente.codigo 
        AND nombre_poblacion = 'Rosario' 
        AND nombre_zona = 'Centro'));

/* Apartado e */
SELECT nombre_zona, COUNT(*) 'Cant. Inmuebles', AVG(precio) 'Promedio Precios'
        FROM Inmueble
        WHERE nombre_poblacion = 'Rosario'
        GROUP BY nombre_zona;

/* Apartado f */
SELECT nombre FROM Persona 
WHERE codigo IN (SELECT codigo_cliente FROM PrefiereZona 
                 WHERE nombre_poblacion = 'Santa Fe'
                 GROUP BY codigo_cliente
                 HAVING COUNT(nombre_poblacion) = (SELECT COUNT(*) FROM Zona WHERE nombre_poblacion = 'Santa Fe'));