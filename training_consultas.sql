/* Raúl Martínez Sánchez */

--consulta 1
select nombre, fecha_inicio, fecha_fin, nombre_pais from competicion c JOIN nacionalidad n ON c.codpais = n.codpais 
WHERE nombre_pais LIKE '%Estados Unidos%';      

--consulta 2
select e.id as evento, d.nombre as disciplina, c.nombre as competicion from eventos e
JOIN disciplinas d ON e.id_disciplina = d.id JOIN competicion c ON e.id_competicion = c.id 
WHERE YEAR(fecha_inicio) = 2023;

--consulta 3
select nombre_pais as nombre, pais as codigo, COUNT(*) as cantidad_atletas FROM atletas a 
JOIN nacionalidad n ON n.codpais = a.pais GROUP BY pais HAVING COUNT(*) >= 2 
ORDER BY cantidad_atletas DESC;

--consulta 4
select d.id, d.nombre, MIN(r.resultado) as mejor_tiempo, MAX(r.resultado) as peor_tiempo from resultados r 
JOIN eventos e ON r.id_evento = e.id JOIN disciplinas d ON e.id_disciplina = d.id 
JOIN competicion c ON e.id_competicion = c.id WHERE YEAR(c.fecha_inicio) = 2023 GROUP BY d.nombre DESC;


--consulta 5
select CONCAT(a.nombre, ' ', a.apellido) AS nombre_completo, e.id_competicion, r.puesto, r.resultadofrom resultados r JOIN atletas a ON r.id_atleta = a.id JOIN eventos e ON r.id_evento =
e.id WHERE r.resultado IS NOT NULL;

--consulta 6
select nombre from disciplinas WHERE es_masculina = FALSE AND distancia < 600;
