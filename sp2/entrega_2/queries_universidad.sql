

SELECT p.apellido1, p.apellido2, p.nombre FROM persona p WHERE p.tipo = "alumno" ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
SELECT p.apellido1, p.apellido2, p.nombre FROM persona p WHERE p.tipo = "alumno" AND p.telefono IS NULL;
SELECT * FROM persona WHERE persona.fecha_nacimiento BETWEEN "1999-01-01" AND "1999-12-31";
SELECT * FROM persona p WHERE p.tipo = "profesor" AND p.telefono IS NULL AND p.nif LIKE "%K";
SELECT * FROM asignatura a WHERE a.cuatrimestre = 1 AND a.curso = 3 AND id_grado = 7;
SELECT p.apellido1, p.apellido2, p.nombre, departamento.nombre FROM persona p INNER JOIN profesor ON p.id = profesor.id_profesor INNER JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY apellido1 ASC, apellido2 ASC, p.nombre ASC;
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM alumno_se_matricula_asignatura INNER JOIN persona ON id_alumno = persona.id INNER JOIN curso_escolar ON id_curso_escolar = curso_escolar.id INNER JOIN asignatura ON id_asignatura = asignatura.id WHERE persona.nif = "26902806M";
SELECT departamento.nombre, grado.nombre FROM departamento INNER JOIN profesor ON departamento.id=profesor.id_departamento INNER JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor INNER JOIN grado ON asignatura.id_grado=grado.id WHERE grado.nombre LIKE "%nform%" AND grado.nombre LIKE "%2015%";
SELECT DISTINCT persona.* FROM persona INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno INNER JOIN curso_escolar ON id_curso_escolar=curso_escolar.id WHERE anyo_inicio=2018 AND anyo_fin=2019;


SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM persona INNER JOIN profesor ON persona.id=profesor.id_profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id;
SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM persona INNER JOIN profesor ON persona.id=profesor.id_profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE departamento.nombre IS NULL;
SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM persona INNER JOIN profesor ON persona.id=profesor.id_profesor RIGHT JOIN departamento ON profesor.id_departamento = departamento.id WHERE apellido1 IS NULL;
SELECT DISTINCT persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN asignatura ON persona.id=asignatura.id_profesor WHERE persona.tipo="profesor" AND asignatura.nombre IS NULL;
SELECT asignatura.nombre FROM asignatura WHERE id_profesor IS NULL;
SELECT departamento.nombre FROM departamento INNER JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN asignatura ON profesor.id_profesor=asignatura.id_profesor WHERE asignatura.nombre IS NULL;


SELECT COUNT(tipo) FROM persona WHERE tipo="alumno";
SELECT COUNT(fecha_nacimiento) FROM persona WHERE persona.fecha_nacimiento BETWEEN "1999-01-01" AND "1999-12-31";
SELECT departamento.nombre AS "Departamento", COUNT(*) AS "Número de profesores" FROM departamento RIGHT JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.id ORDER BY COUNT(*) DESC;
SELECT departamento.nombre, IF(profesor.id_profesor IS NULL, 0, COUNT(*)) AS "Número de profesores" FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.id ORDER BY COUNT(*) DESC;
SELECT grado.nombre, IF(asignatura.id IS NULL, 0, COUNT(*)) AS "Número de asignaturas" FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.id ORDER BY COUNT(*) DESC;

select * from grado;

select * from profesor;
SELECT * FROM departamento;
SELECT * FROM persona WHERE persona.tipo = "profesor";
SELECT * FROM grado;



SELECT p.apellido1, p.apellido2, p.nombre FROM persona p WHERE p.id IN (SELECT am.id_alumno FROM alumno_se_matricula_asignatura am);

SELECT * from universidad.persona;
SELECT DISTINCT id_profesor from universidad.profesor;
SELECT DISTINCT id_alumno from universidad.alumno_se_matricula_asignatura;