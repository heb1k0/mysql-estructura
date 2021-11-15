
--! Base de dades Tienda
-- 1 Llista el nom de tots els productos que hi ha en la taula producto.
select nombre from producto;
-- 2 Llista els noms i els preus de tots els productos de la taula producto.

select nombre,precio from producto;
-- 3  Llista totes les columnes de la taula producto.
select * from producto
-- 4 Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD).
--?select nombre,precio from producto inner join produco.precio on produco.precio;
-- 5 Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dolars.
-- 6 Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a majúscula.   

-- 7 Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a minúscula.
select lower(nombre),precio from producto;
-- 8 Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
select nombre,upper(substr(nombre,1,2)) from fabricante;
-- 9 Llista els noms i els preus de tots els productos de la taula producto, arrodonint el valor del preu.
select nombre,round(precio) from producto;
-- 10 Llista els noms i els preus de tots els productos de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
select nombre,truncate(precio) from producto;
-- 11 Llista el codi dels fabricants que tenen productos en la taula producto.
select codigo from fabricante where codigo in (select codigo_fabricante from producto);
-- 12 Llista el codi dels fabricants que tenen productos en la taula producto, eliminant els codis que apareixen repetits.
select distinct codigo from fabricante where codigo in (select codigo_fabricante from producto);
-- 12 Llista els noms dels fabricants ordenats de manera ascendent.
select nombre from fabricante order by nombre asc;
-- 13 Llista els noms dels fabricants ordenats de manera descendent.
select nombre from fabricante order by nombre desc;
-- 14 Llista els noms dels productos ordenats en primer lloc pel nom de manera ascendent i en segon lloc pel preu de manera descendent.
select nombre,precio from producto order by nombre asc,precio desc;
-- 15 Retorna una llista amb les 5 primeres files de la taula fabricante.
select * from fabricante limit 5;
-- 16 Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
select * from fabricante limit 2 offset 3;
-- 17 Llista el nom i el preu del producto més barat. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY
select nombre,precio from producto order by precio asc limit 1;
-- 18 Llista el nom i el preu del producto més car. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
select nombre,precio from producto order by precio desc limit 1;
-- 19 Llista el nom de tots els productos del fabricant el codi de fabricant del qual és igual a 2.
select nombre from producto where codigo_fabricante = 2;
-- 20 Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
select producto.nombre,precio,fabricante.nombre as "nombre fabricante" from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo;
-- 21 Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordeni el resultat pel nom del fabricador, per ordre alfabètic.
select producto.nombre,precio,fabricante.nombre as "nombre fabricante" from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo order by fabricante.nombre asc;
-- 22 Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
select producto.codigo,producto.nombre,fabricante.codigo as "codigo fabricante",fabricante.nombre as "nombre fabricante" from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo;
-- 23 Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
select producto.nombre,precio,fabricante.nombre as "nombre fabricante" from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo order by precio asc limit 1;
-- 24 Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.    
select producto.nombre,precio,fabricante.nombre as "nombre fabricante" from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo order by precio desc limit 1;
-- 25 Retorna una llista de tots els productes del fabricador Lenovo.
select producto.nombre,precio,fabricante.nombre as "nombre fabricante" from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = "Lenovo";
-- 26 Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200€.
select producto.nombre,precio,fabricante.nombre as "nombre fabricante" from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = "Crucial" and precio > 200;
-- 27 Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Sense utilitzar l'operador IN.
select producto.nombre,precio,fabricante.nombre as "nombre fabricante" from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = "Asus" or fabricante.nombre = "Hewlett-Packard" or fabricante.nombre = "Seagate";
-- 28 Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Utilitzant l'operador IN.
select producto.nombre,precio,fabricante.nombre as "nombre fabricante" from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre in ("Asus","Hewlett-Packard","Seagate");
-- 29 Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
select producto.nombre,precio,fabricante.nombre as "nombre fabricante" from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre like "%e";
-- 30 Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
select producto.nombre,precio,fabricante.nombre as "nombre fabricante" from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre like "%w%";
-- 31Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180€. Ordeni el resultat en primer lloc pel preu (en ordre descendent) i en segon lloc pel nom (en ordre ascendent)
select producto.nombre,precio,fabricante.nombre as "nombre fabricante" from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where precio >= 180 order by precio desc, nombre asc;
-- 32 Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
select fabricante.codigo,fabricante.nombre from fabricante inner join producto on fabricante.codigo = producto.codigo_fabricante group by fabricante.codigo;
-- 33 Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
select fabricante.codigo,fabricante.nombre as "Nombre Fabricante ",producto.nombre as "Nombre producto" from fabricante left join producto on fabricante.codigo = producto.codigo_fabricante;
-- 34 Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
select fabricante.codigo,fabricante.nombre  from fabricante left join producto on fabricante.codigo = producto.codigo_fabricante where producto.codigo_fabricante is null;
-- 35 Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
select * from producto where codigo_fabricante in (select codigo from fabricante where nombre = "Lenovo")-- 36 Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricador Lenovo. (Sense utilitzar INNER JOIN).
-- 37 Llista el nom del producte més car del fabricador Lenovo.
select nombre from producto where codigo_fabricante in (select codigo from fabricante where nombre = "Lenovo") order by precio desc limit 1;
-- 38 Llista el nom del producte més barat del fabricant Hewlett-Packard.
select nombre from producto where codigo_fabricante in (select codigo from fabricante where nombre = "Hewlett-Packard") order by precio asc limit 1;
-- 39Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricador Lenovo.
select * from producto where codigo_fabricante in (select codigo from fabricante where nombre = "Lenovo") and precio >= (select precio from producto where codigo_fabricante in (select codigo from fabricante where nombre = "Lenovo") order by precio desc limit 1);
-- 40 Llesta tots els productes del fabricador Asus que tenen un preu superior al preu mitjà de tots els seus productes.
select * from producto where codigo_fabricante in (select codigo from fabricante where nombre = "Asus") and precio > (select avg(precio) from producto where codigo_fabricante in (select codigo from fabricante where nombre = "Asus"));
--! Base de dades UniversidadBase de dades Universidad

-- 41. Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT nombre,apellido1,apellido2 FROM persona where tipo="alumno" ORDER BY apellido1 ASC,apellido2 ASC, nombre ASC;
-- 42 .Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
select nombre,apellido1,apellido2 FROM persona where tipo="alumno" and telefono is null;
-- 43. Retorna el llistat dels alumnes que van néixer en 1999.
select * from persona where tipo="alumno" and fecha_nacimiento like "1999-%";
-- 44 .Retorna el llistat de professors que no han donat d'alta el seu número de telèfon en la base de dades i a més la seva nif acaba en K.
select * from persona where tipo="profesor" and telefono is null and nif like "%K";
-- 45 .Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
select * from asignatura where cuatrimestre=1 and curso=3 and id_grado=7;
-- 46 .Retorna un llistat dels professors juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
select DISTINCT persona.apellido1,persona.apellido2,persona.nombre,departamento.nombre as "nombre departamento" from persona,departamento,profesor where persona.tipo = "profesor" and profesor.id_profesor = persona.id and departamento.id = profesor.id_departamento;
-- 47. Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne amb nif 26902806M.
SELECT nombre,curso_escolar.anyo_inicio,curso_escolar.anyo_fin FROM alumno_se_matricula_asignatura,asignatura,curso_escolar where id_alumno in (select id from persona where nif = "26902806M") AND asignatura.id = alumno_se_matricula_asignatura.id_asignatura and curso_escolar.id=id_curso_escolar;
-- 48 .Retorna un llistat amb el nom de tots els departaments que tenen professors que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT nombre FROM departamento where id in (SELECT id_departamento FROM profesor where id_profesor IN(SELECT DISTINCT id_profesor FROM asignatura WHERE id_grado IN (SELECT id FROM grado WHERE nombre LIKE 'Grado en Ingeniería Informática (Plan 2015)') AND  id_profesor IS NOT NULL)
);
-- 49 .Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT * FROM persona WHERE id in (SELECT DISTINCT id_alumno FROM alumno_se_matricula_asignatura WHERE id_curso_escolar IN (SELECT id FROM curso_escolar WHERE anyo_inicio = '2018'))

--? Resolgui les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

-- 50 Retorna un llistat amb els noms de tots els professors i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT departamento.nombre AS "Nombre departamento",persona.nombre,persona.apellido1 as "primer apellido",persona.apellido2 as "segundo apellido" FROM profesor LEFT JOIN departamento on profesor.id_departamento = departamento.id LEFT JOIN persona ON profesor.id_profesor = persona.id ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
 -- 51 Retorna un llistat amb els professors que no estan associats a un departament.
SELECT * FROM profesor left join persona on profesor.id_profesor = persona.id where profesor.id_departamento is null;
-- 52 Retorna un llistat amb els departaments que no tenen professors associats.

-- 53 Retorna un llistat amb els professors que no imparteixen cap assignatura.
SELECT * FROM profesor left join persona on profesor.id_profesor = persona.id where profesor.id_profesor not in (select id_profesor from asignatura);
-- 54 Retorna un llistat amb les assignatures que no tenen un professor assignat.
SELECT asignatura.nombre FROM asignatura left join persona on asignatura.id_profesor = persona.id where asignatura.id_profesor is null;
-- 55 Retorna un llistat amb els alumnes que no han donat d'alta cap telèfon.
select nombre from persona where tipo="alumno" and telefono is null;
-- 55 Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
select DISTINCT departamento.nombre from profesor left join asignatura on asignatura.id_profesor = profesor.id_profesor left join departamento on departamento.id = profesor.id_departamento where asignatura.id is null;
-- 56 Retorna el nombre total d'alumnes que hi ha.
SELECT * FROM persona WHERE tipo="alumno";
-- 57 Calcula quants alumnes van néixer en 1999.
SELECT count(*) FROM persona WHERE fecha_nacimiento like "1999%";
-- 58 Calcula quants professors hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors associats i haurà d'estar ordenat de major a menor pel nombre de professors.
SELECT departamento.nombre,count(*) FROM departamento LEFT JOIN profesor on departamento.id = profesor.id_departamento GROUP BY departamento.nombre ORDER BY count(*) DESC;
-- 59 Retorna un llistat amb tots els departaments i el nombre de professors que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors associats. Aquests departaments també han d'aparèixer en el llistat.
select departamento.nombre,persona.nombre from departamento left join profesor on id_departamento = departamento.id left join persona on profesor.id_profesor=persona.id;
-- 60 Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingui en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT grado.nombre,count(*) FROM grado LEFT JOIN asignatura on grado.id = asignatura.id_grado GROUP BY grado.nombre ORDER BY count(*) DESC;
-- 61 Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
SELECT grado.nombre,count(*) FROM grado LEFT JOIN asignatura on grado.id = asignatura.id_grado GROUP BY grado.nombre HAVING count(*) > 40 ORDER BY count(*) DESC;
-- 62 Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
SELECT grado.nombre,asignatura.tipo,sum(asignatura.creditos) FROM grado LEFT JOIN asignatura on grado.id = asignatura.id_grado GROUP BY grado.nombre,asignatura.tipo;
-- 63 Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.
SELECT curso_escolar.anyo_inicio,count(*) FROM curso_escolar LEFT JOIN alumno_se_matricula_asignatura on curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar GROUP BY curso_escolar.anyo_inicio;
-- 64 Retorna un llistat amb el nombre d'assignatures que imparteix cada professor. El llistat ha de tenir en compte aquells professors que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
select  persona.id,persona.nombre as "Nombre profesor",persona.apellido1, persona.apellido2, asignatura.nombre as "Nombre asignatura" from persona left join asignatura on persona.id = asignatura.id_profesor where persona.tipo = "profesor" ORDER by asignatura.nombre desc;
-- 65 Retorna totes les dades de l'alumne més jove.
SELECT * FROM persona where tipo="alumno" ORDER BY fecha_nacimiento ASC LIMIT 1;
-- 66 Retorna un llistat amb els professors que tenen un departament associat i que no imparteixen cap assignatura.
