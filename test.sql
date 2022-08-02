--1.a)
SELECT nazov, COUNT(nazov)
FROM obec
GROUP BY nazov
HAVING COUNT(nazov) > 1;

--1.b)
SELECT nazov, COUNT(nazov) as count
FROM obec
GROUP BY nazov
HAVING COUNT(nazov) > 1
ORDER BY count DESC
LIMIT 1;

--2
SELECT COUNT(id_kraj)
FROM okres
WHERE id_kraj = 8;

--3
SELECT COUNT(nazov)
FROM obec
WHERE id_okres > 800;

--4
SELECT id_obec, muzi + zeny AS sucet, obec.nazov
FROM populacia
INNER JOIN obec ON obec.id = id_obec
WHERE rok = 2012
ORDER BY sucet DESC
LIMIT 1;

--5
SELECT SUM(muzi + zeny) AS sucet
FROM obec
INNER JOIN populacia ON populacia.id_obec = id
WHERE id_okres = 708 AND populacia.rok = 2012;

--6
SELECT rok, SUM(muzi + zeny) AS sucet
FROM populacia
GROUP BY rok
ORDER BY rok DESC;

--7
SELECT nazov, MIN(populacia.muzi + populacia.zeny) AS sucet
FROM obec
INNER JOIN populacia ON id = populacia.id_obec
WHERE id_okres = 510 AND populacia.rok = 2011
GROUP BY nazov
ORDER BY sucet;

--8
SELECT nazov
FROM obec
INNER JOIN populacia ON id = populacia.id_obec
WHERE populacia.muzi + populacia.zeny < 5000 AND populacia.rok = 2010;

--9
SELECT nazov, ROUND(populacia.muzi * 1.0 / populacia.zeny, 4) AS pomer
FROM obec
INNER JOIN populacia ON id = populacia.id_obec
WHERE populacia.muzi + populacia.zeny > 20000 AND populacia.zeny > populacia.muzi AND populacia.rok = 2012
ORDER BY pomer
LIMIT 10;

--10
SELECT kraj.nazov, COUNT(id_kraj) AS pocet_okresov
FROM okres
INNER JOIN kraj ON kraj.id = id_kraj
GROUP BY kraj.nazov;

--11

--12
SELECT AVG(muzi + zeny) AS priemer
FROM populacia
WHERE rok = 2012;