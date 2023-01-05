-- Active: 1671519124980@@127.0.0.1@3306@bd

use tabla_compania;

create table
    empleado(
        nombre VARCHAR(30),
        apellido VARCHAR(30),
        ci VARCHAR(10) NOT NULL,
        fecha_n DATE,
        direccion VARCHAR(30),
        sexo CHAR(1),
        salario INTEGER(4),
        superCi VARCHAR(10),
        dno INTEGER(1)
    );

create table
    departamento(
        dNombre VARCHAR(30),
        dNumero INTEGER(1),
        jefeCi VARCHAR(10) NOT NULL,
        jefeFi DATE
    );

create table
    localizacion(
        dNumero INTEGER(1) NOT NULL,
        depLoc VARCHAR(30)
    );

CREATE TABLE
    trabaja_en (
        eci VARCHAR (10) NOT NULL,
        pno INTEGER (2) NOT NULL,
        horas DOUBLE (4, 2)
    );

CREATE TABLE
    proyecto (
        pnombre VARCHAR (30),
        pnumero INTEGER (2) NOT NULL,
        plocal VARCHAR (30),
        dnum INTEGER (1)
    );

CREATE TABLE
    carga_f (
        eci VARCHAR (10) NOT NULL,
        dep_nom VARCHAR (30),
        sexo VARCHAR (1),
        fechan_n DATE,
        relacion VARCHAR (10)
    );

SHOW TABLES;

/* ver al detalle la tabla */

DESCRIBE empleado;

/* creacion de llaves forneas  */

ALTER TABLE empleado ADD PRIMARY KEY (ci);

ALTER table departamento ADD PRIMARY KEY (dnumero);

ALTER table proyecto ADD PRIMARY KEY (pnumero);

/* llaves foraneas */

ALTER Table empleado
ADD
    Foreign Key (dno) REFERENCES departamento(dnumero) ON DELETE
SET NULL ON UPDATE CASCADE,
ADD
    FOREIGN KEY(superci) REFERENCES empleado(ci) ON DELETE
SET NULL ON UPDATE CASCADE;

ALTER Table departamento
ADD
    FOREIGN KEY (jefeci) REFERENCES empleado(ci) ON DELETE
SET NULL ON UPDATE CASCADE;

ALTER table localizacion
ADD
    Foreign Key (dnumero) REFERENCES departamento(dnumero) ON DELETE
SET NULL ON UPDATE CASCADE;

ALTER TABLE trabaja_en
ADD
    FOREIGN KEY (eci) REFERENCES empleado (ci) ON DELETE CASCADE ON UPDATE CASCADE,
ADD
    FOREIGN KEY (pno) REFERENCES proyecto (pnumero) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE proyecto
ADD
    FOREIGN KEY (dnum) REFERENCES departamento (dnumero) ON DELETE
SET NULL ON UPDATE CASCADE;

ALTER TABLE carga_f
ADD
    FOREIGN KEY (eci) REFERENCES empleado (ci) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE departamento ADD UNIQUE (dnombre);

INSERT INTO
    empleado (
        `NOMBRE`,
        `APELLIDO`,
        `CI`,
        `FECHA_N`,
        `DIRECCION`,
        `SEXO`,
        `SALARIO`
    )
VALUES (
        'Juan',
        'Polo',
        '123456789',
        '1959-03-03',
        'Sucre 7-12',
        'M',
        3000
    ), (
        'Humberto',
        'Pons',
        '333445555',
        '1960-12-25',
        'Bolivar 5-67',
        'M',
        4000
    ), (
        'Marcia',
        'Mora',
        '453453453',
        '1960-03-29',
        'Colombia 4-23',
        'F',
        2500
    ), (
        'Pablo',
        'Castro',
        '666884444',
        '1955-09-15',
        'Bolivar 1-50',
        'M',
        3800
    ), (
        'Jaime',
        'Perez',
        '888665555',
        '1957-04-05',
        'Sangurima 8-34',
        'M',
        5500
    ), (
        'Elena',
        'Tapia',
        '987654321',
        '1961-05-03',
        'Ordonez 7-29',
        'F',
        4300
    ), (
        'Manuel',
        'Bonilla',
        '987987987',
        '1958-07-16',
        'B. Malo 1-10',
        'M',
        2500
    ), (
        'Irma',
        'Vega',
        '999887777',
        '1950-11-13',
        'P. Cordova 3-45',
        'F',
        2500
    );

DESCRIBE empleado;

/* añadir una columna a empleados */

ALTER TABLE empleado ADD COLUMN nombreColumna VARCHAR(40) NOT NULL;

/* borrar una columna a empleados */

ALTER TABLE empleado DROP nombreColumna;

/* agregando una columna en una ubicacion especifica */

ALTER Table empleado
ADD
    COLUMN nombreColumna VARCHAR(40) after apellido;

/* insertar columna en la primera fila  */

ALTER TABLE empleado ADD COLUMN nomColll VARCHAR(40) NOT NULL FIRST;

/* borrar nomColll - nombreColumna */

ALTER TABLE empleado DROP nomColll;

INSERT INTO
    departamento (
        `DNOMBRE`,
        `DNUMERO`,
        `JEFECI`,
        `JEFEFI`
    )
VALUES (
        'Compras',
        1,
        '333445555',
        '1978-06-06'
    ), (
        'Administrativo',
        4,
        '987654321',
        '1982-12-05'
    ), (
        'Investigacion',
        5,
        '888665555',
        '1980-12-05'
    );

INSERT INTO
    localizacion (`dNumero`, `depLoc`)
VALUES (4, 'Guayaquil'), (5, 'Quito'), (5, 'Manta'), (5, 'Cuenca'), (1, 'Cuenca');

INSERT INTO
    proyecto (
        `PNOMBRE`,
        `PNUMERO`,
        `PLOCAL`,
        `DNUM`
    )
VALUES ('ProductoX', 1, 'Quito', 5), ('ProductoY', 2, 'Manta', 5), ('ProductoZ', 3, 'Cuenca', 5), (
        'Computadora',
        10,
        'Guayaquil',
        4
    ), ('Reorganizar', 20, 'Cuenca', 1), (
        'Beneficios',
        30,
        'Guayaquil',
        4
    );

INSERT INTO
    `trabaja_en` (`ECI`, `PNO`, `HORAS`)
VALUES ('123456789', 1, 12.5), ('123456789', 2, 15.6), ('666884444', 3, 14.7), ('453453453', 1, 10), ('453453453', 2, 10), ('333445555', 2, 20), ('333445555', 3, 10), ('333445555', 10, 10), ('333445555', 20, 10), ('999887777', 30, 30), ('999887777', 10, 5), ('987987987', 10, 15), ('987987987', 30, 17), ('987654321', 30, 10), ('987654321', 20, 12), ('888665555', 20, NULL);

INSERT INTO
    carga_f (
        `ECI`,
        `DEP_NOM`,
        `SEXO`,
        `FECHAN_N`,
        `RELACION`
    )
VALUES (
        '333445555',
        'Maria',
        'F',
        '1986-02-02',
        'Hija'
    ), (
        '333445555',
        'Teodoro',
        'M',
        '1990-10-10',
        'Hijo'
    ), (
        '333445555',
        'Ana',
        'F',
        '1965-09-15',
        'Conyuge'
    ), (
        '987654321',
        'Alberto',
        'M',
        '1967-07-06',
        'Conyuge'
    ), (
        '123456789',
        'Miguel',
        'M',
        '1984-11-05',
        'Hijo'
    ), (
        '123456789',
        'Maria',
        'F',
        '1987-01-09',
        'Hija'
    ), (
        '123456789',
        'Elizabeth',
        'F',
        '1960-12-12',
        'Conyuge'
    );

 

UPDATE empleado
SET superci=’333445555’, dno=’5’
WHERE ci=’453453453’;

SELECT * FROM empleado;

SELECT nombre, sexo FROM empleado;

/* 
 Como separador entre las columnas concatenadas se puede usar la coma (,), punto (.)
 o espacio ( ), éste debe estar siempre entre comilla simple */

SELECT CONCAT (nombre, ' ', sexo ) AS empleado FROM empleado;

SELECT * FROM empleado WHERE ci="123456789";

SELECT nombre , apellido FROM empleado WHERE sexo="F";

SELECT nombre , apellido FROM empleado WHERE sexo !="M";

UPDATE empleado
SET
    superci = "333445555",
    dno = "5"
WHERE ci = "123456789";

UPDATE empleado
SET
    superci = "888665555",
    dno = "5"
WHERE ci = "333445555";

UPDATE empleado
SET
    superci = "987654321",
    dno = "4"
WHERE ci = "99988777’";

UPDATE empleado
SET
    superci = "888665555",
    dno = "4"
WHERE ci = "987654321";

UPDATE empleado
SET
    superci = "333445555",
    dno = "5"
WHERE ci = "666884444";

UPDATE empleado
SET
    superci = "333445555",
    dno = "5"
WHERE ci = "453453453";

UPDATE empleado
SET
    superci = "987654321",
    dno = "4"
WHERE ci = "987987987";

UPDATE empleado SET dno="1" WHERE ci="888665555";

/* 
 La cláusula WHERE también es utilizada para realizar consultas en las que se utilizará
 más de una tabla, siempre y cuando exista algún tipo de relación entre ellas.
 en este caso el dno=dnumero
 */

SELECT ci, nombre, apellido
FROM empleado, departamento
WHERE
    dno = dnumero
    AND dnombre = "Administrativo";

/*  esta cláusula es utilizada cuando se repite varias veces un mismo 
 registro y se quiere eliminar los valores duplicados y se aplica solamente
 a una columna.  */

SELECT DISTINCT eci FROM trabaja_en;

/* 
 sirve generalmente para el manejo de las llaves foráneas al momento de 
 actualizar o borrar las llaves a las que hacen referencia,
 también se refiere a los campos que no obligadamente se tienen
 que llenar. 
 */

SELECT
    ci,
    nombre,
    apellido,
    superci
FROM empleado
WHERE superci IS NULL;

SELECT
    ci,
    nombre,
    apellido,
    superci
FROM empleado
WHERE superci IS NOT NULL;

SELECT nombre, apellido
FROM empleado
WHERE
    nombre LIKE "%r%"
    AND apellido LIKE "%a%";

SELECT
    nombre,
    apellido,
    jefefi
FROM empleado, departamento
WHERE
    jefeci = ci
    AND YEAR(jefefi) BETWEEN 1979 AND 1983;

/* 
 A partir de una fecha de nacimiento en la base de datos y queremos 
 calcular la edad de una persona,  */

SELECT
    nombre,
    apellido,
    fecha_n, (
        YEAR(CURRENT_DATE) - YEAR(fecha_n)
    ) - (
        RIGHT(CURRENT_DATE, 5) < RIGHT(fecha_n, 5)
    ) AS edad
FROM empleado;

/* CURRENT_DATE => fecha actual del sistema - fecha_n => see obtiene la edad base
 rigth Para poder restar los meses y días y
 obtener la edad exacta respecto a la fecha actual extraemos los 5 últimos dígitos de la
 fecha actual y de la fecha de nacimiento, los comparamos y si es que la fecha de
 nacimiento en meses y días es mayor a la fecha actual, esta se restará.
 en as se dirije la variable edad 
 */

/* Por ejemplo vamos a listar el código y nombre de los 
 departamentos localizados en
 Cuenca.  */

SELECT
    departamento.dnumero,
    dnombre
FROM
    departamento,
    localizacion
WHERE
    departamento.dnumero = localizacion.dnumero
    AND depLoc = "Cuenca";

SELECT
    e.ci,
    e.nombre,
    e.apellido,
    s.ci,
    s.nombre,
    s.apellido
FROM empleado e, empleado s
WHERE e.superci = s.ci;

/* Contar el número de empleados que trabajan en la empresa. */

SELECT COUNT(ci) FROM empleado;

/* Calcular el salario promedio de los empleados de la empresa. */

SELECT AVG(salario) FROM empleado;

/*  Sumar el número de horas que ha trabajado 
 el empleado Humberto Pons en los
 diferentes proyectos */

SELECT SUM(horas)
FROM empleado, trabaja_en
WHERE
    eci = ci
    AND nombre = "Humberto"
    AND apellido = "Pons";

/*  Calcular el salario más alto y el más bajo de 
 los empleados de la empresa.
 */

SELECT MAX(salario), MIN(salario) FROM empleado;

/*  Ahora vamos a listar todos los empleados de la empresa por 
 orden alfabético de sus apellidos.  */

SELECT apellido, nombre FROM empleado ORDER BY apellido desc;

/* ascendente */

SELECT apellido, nombre FROM empleado ORDER BY apellido;

/* 
 consultar el total de horas trabajadas por cada uno de los
 empleados. 
 */

SELECT
    eci,
    nombre,
    apellido,
    SUM(horas)
FROM trabaja_en, empleado
WHERE ci = eci
GROUP BY eci;

/* 
 En el caso de usar la cláusula HAVING, las relaciones entre tablas se harán en la
 cláusula WHERE. No olvidar que HAVING solo puede utilizarse luego de la cláusula
 GROUP BY.  
 Por ejemplo vamos a listar el nombre de los empleados que han trabajado en más de 3
 proyectos. 
 */

SELECT
    nombre,
    apellido,
    COUNT(pno)
FROM empleado, trabaja_en
WHERE eci = ci
GROUP BY ci
HAVING count(pno) > 3;

/* Listar el nombre de todos los departamentos */

SELECT dNombre FROM departamento ;

/* Listar la cédula, nombre, apellido y salario de los empleados que trabajan en el
 departamento de Compras.  */

SELECT
    nombre,
    apellido,
    salario
FROM empleado, departamento
WHERE
    dnumero = dno
    AND dnombre = "Compras";

/* Listar nombre, apellido y salario de los empleados que ganan más de 3000
 dólares.  */

SELECT
    nombre,
    apellido,
    salario
FROM empleado
WHERE salario > 3000;

/* Listar los empleados que trabajan en el proyecto ProductoX */

SELECT
    nombre,
    apellido,
    ci,
    sexo,
    dno
FROM
    proyecto,
    empleado,
    trabaja_en
WHERE
    pnumero = pno
    AND eci = ci
    AND pnombre = "productoX";

/* 
 Contar las cargas familiares del empleado Humberto Pons */

SELECT
    nombre,
    apellido,
    COUNT(eci)
FROM carga_f, empleado
WHERE
    eci = ci
    AND nombre = "Humberto"
    AND apellido = "Pons"
GROUP BY eci;

SELECT
    nombre,
    apellido,
    salario
FROM empleado
WHERE
    salario BETWEEN 2500 AND 3000;

/* 
 Listar la cédula, nombre, apellido y total de horas trabajadas de todos los
 empleados.  */

SELECT
    ci,
    nombre,
    apellido,
    SUM(horas)
FROM trabaja_en, empleado
WHERE ci = eci
GROUP BY eci;

/*  Listar todos los empleados nacidos en el mes de marzo.  */

SELECT nombre, apellido,fecha_n FROM empleado WHERE MONTH(fecha_n)=3;

/* Listar el nombre de los empleados que tienen más de 1 carga familiar de sexo
 femenino. */

SELECT
    nombre,
    apellido,
    COUNT(eci)
FROM empleado, carga_f
WHERE
    eci = ci
    AND carga_f.sexo = "f"
GROUP BY eci
HAVING COUNT(eci) > 1;

/* Listar los empleados que tengan como sueldo 2500,3000 o 4000 dólares. */

SELECT
    nombre,
    apellido,
    salario
FROM empleado
WHERE
    salario IN (2500, 3000, 4000);

/* Listar las cargas familiares ordenadas por sexo y por nombre.
 */

SELECT * FROM carga_f ORDER BY sexo, dep_nom;

/* 
 3. Calcular la suma de todos los salarios, el salario promedio, salario máximo y
 salario mínimo de los empleados.  */

SELECT
    SUM(salario),
    AVG(salario),
    MAX(salario),
    MIN(salario)
FROM empleado;

/*  Listar el nombre del departamento que tiene más de 3 empleados.
 */

SELECT dnombre, COUNT(ci)
FROM departamento, empleado
WHERE dno = dnumero
GROUP BY dno
HAVING COUNT(ci) > 3;

/* 
 Calcular el salario máximo y mínimo del departamento de Compras.  */

SELECT
    nombre,
    apellido,
    MAX(salario),
    MIN(salario)
FROM empleado, departamento
WHERE
    dnumero = dno
    AND dnombre = "Compras"
GROUP BY (dnombre);

/* . Calcular el salario promedio de todos los departamentos.  */

SELECT dnombre, AVG(salario)
FROM departamento, empleado
WHERE dnumero = dno
GROUP BY dnombre;

/* 
 Calcular el total de horas trabajadas en cada proyecto.  */

SELECT pnombre, SUM(horas)
FROM proyecto, trabaja_en
WHERE pno = pnumero
GROUP BY pnumero;

/* 
 0. Listar el nombre y apellido de todos los empleados con su respectivo supervisor.  */

SELECT
    e.ci,
    e.nombre,
    e.apellido,
    s.ci,
    s.nombre,
    s.apellido
FROM empleado e, empleado s
WHERE e.superci = s.ci;

/* 
 2. Listar los empleados cuyos apellidos estén entre la letra M y la letra Q */

SELECT nombre, apellido
FROM empleado
WHERE
    apellido BETWEEN "M" AND "Q";

/*     Listar la cédula y nombre de los supervisores.
 */

SELECT
    distinct s.ci,
    s.nombre,
    s.apellido
FROM empleado e, empleado s
WHERE s.ci = e.superci;

/*  Contar cuantos empleados existen en cada departamento.
 */

SELECT dnombre, COUNT(ci)
FROM empleado, departamento
WHERE dno = dnumero
GROUP BY dno;