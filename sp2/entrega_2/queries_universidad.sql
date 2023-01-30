USE universidad;

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
SELECT departamento.nombre, ANY_VALUE (IF(profesor.id_profesor IS NULL, 0, COUNT(*))) AS "Número de profesores" FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.id ORDER BY COUNT(*) DESC;
SELECT grado.nombre AS "Grado", ANY_VALUE(IF(asignatura.id IS NULL, 0, COUNT(*))) AS "Número de asignaturas" FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.id ORDER BY COUNT(*) DESC;
SELECT grado.nombre AS "Grado", ANY_VALUE(IF(asignatura.id IS NULL, 0, COUNT(*))) AS "Número de asignaturas" FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.id HAVING COUNT(*)>40;
SELECT grado.nombre AS "Grado", asignatura.tipo AS "Tipo de asignatura", COUNT(*) AS "Número de créditos" FROM grado INNER JOIN asignatura ON grado.id=asignatura.id_grado GROUP BY grado.nombre, asignatura.tipo ORDER BY grado.nombre, asignatura.tipo;
SELECT curso_escolar.anyo_inicio, COUNT(DISTINCT id_alumno) AS "Número de alumnos matrículados" FROM curso_escolar INNER JOIN alumno_se_matricula_asignatura ON curso_escolar.id= alumno_se_matricula_asignatura.id_curso_escolar GROUP BY curso_escolar.anyo_inicio;
SELECT persona.id, persona.nombre, persona.apellido1, persona.apellido2, IF (asignatura.id_profesor IS NULL, 0, COUNT(*)) FROM asignatura RIGHT JOIN profesor ON profesor.id_profesor = asignatura.id_profesor RIGHT JOIN persona ON persona.id=profesor.id_profesor WHERE persona.tipo = "Profesor" GROUP BY persona.id ORDER BY COUNT(*) DESC;
SELECT * FROM persona WHERE persona.tipo = "Alumno" AND persona.fecha_nacimiento IN (SELECT MAX(fecha_nacimiento) FROM persona);
SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM persona INNER JOIN profesor ON persona.id=profesor.id_profesor INNER JOIN departamento ON profesor.id_departamento=departamento.id LEFT JOIN asignatura ON profesor.id_profesor=asignatura.id_profesor WHERE asignatura.id IS NULL;