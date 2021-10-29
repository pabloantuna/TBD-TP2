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
WHERE codigo IN (SELECT codigo_cliente FROM PrefiereZona 
                 WHERE nombre_zona = 'Norte' 
                 AND nombre_poblacion = 'Santa Fe')
GROUP BY nombre 
HAVING COUNT(nombre) = (SELECT COUNT(codigo_cliente) FROM PrefiereZona 
                        WHERE codigo_cliente = codigo);

/* Apartado d */
SELECT nombre FROM Persona WHERE
codigo IN (SELECT vendedor FROM Cliente WHERE
EXISTS (SELECT * FROM PrefiereZona WHERE
        codigo_cliente = Cliente.codigo 
        AND nombre_poblacion = 'Rosario' 
        AND nombre_zona = 'Centro'));

/* Apartado e */
SELECT

/* Apartado f */
SELECT nombre FROM Persona 
WHERE codigo IN (SELECT codigo_cliente FROM PrefiereZona 
                 WHERE nombre_poblacion = 'Santa Fe')
GROUP BY nombre 
HAVING COUNT(nombre) = (SELECT COUNT(*) FROM Zona
                        WHERE nombre_poblacion = 'Santa Fe');