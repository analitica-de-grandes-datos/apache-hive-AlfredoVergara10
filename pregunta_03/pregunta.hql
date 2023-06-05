/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Escriba una consulta que devuelva los cinco valores diferentes más pequeños 
de la tercera columna.

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/


-- Eliminar la tabla en caso de que exista.
DROP TABLE IF EXISTS data;

-- Crear la estructura de la tabla y especificar que los campos están delimitados por '\t'.
CREATE TABLE data (
    col1 STRING,
    col2 DATE,
    col3 INT
)

ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';

-- Cargar el archivo los datos desde el ambiente local.
LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE
INTO TABLE data;

-- Escribir el resultado de la consulta en el directorio 'output' delimitado por comas.
INSERT OVERWRITE LOCAL DIRECTORY 'output/'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','

-- Consulta HQL.
SELECT DISTINCT col3
FROM data
ORDER BY col3
LIMIT 5;