--###### pomocnicze:

SELECT AVG(udzwig) FROM kreatura;
SELECT rodzaj, AVG(udzwig) FROM kreatura GROUP BY rodzaj;

SELECT COUNT(*) FROM kreatura;

SELECT COUNT(DISTINCT rodzaj) FROM kreatura;

SELECT rodzaj, AVG(udzwig) FROM kreatura GROUP BY rodzaj HAVING AVG(udzwig) > 50;

SELECT NOW() - dataUr FROM kreatura;

SELECT * from kreatura, ekwipunek
WHERE kreatura.idKreatury = ekwipunek.idKreatury;


SELECT * from kreatura
INNER JOIN ekwipunek
ON kreatura.idKreatury = ekwipunek.idKreatury;


--###### zadania:


--zadanie 1.
--1.
SELECT AVG(waga) FROM kreatura WHERE rodzaj = "wiking";

--2.
SELECT rodzaj, AVG(waga), COUNT(DISTINCT nazwa) FROM kreatura GROUP BY rodzaj;

--3.
SELECT rodzaj, AVG(YEAR(NOW()) - YEAR(dataUr)) FROM kreatura GROUP BY rodzaj;


--zadanie 2.
--1.
SELECT rodzaj, SUM(waga*ilosc) FROM zasob GROUP BY rodzaj;

--2.
SELECT nazwa, SUM(waga*ilosc) FROM zasob GROUP BY nazwa HAVING SUM(ilosc) > 4 AND SUM(waga) > 10;

--3.
SELECT COUNT(nazwa) FROM (
	SELECT z.nazwa FROM zasob z GROUP BY z.nazwa HAVING SUM(z.ilosc)>1
);
--!


--zadanie 3.
--1.
SELECT kreatura.nazwa, SUM(zasob.ilosc) from kreatura
INNER JOIN ekwipunek
ON kreatura.idKreatury = ekwipunek.idKreatury
INNER JOIN zasob
ON ekwipunek.idZasobu = zasob.idZasobu
GROUP BY kreatura.nazwa;

--2.
SELECT kreatura.nazwa, zasob.nazwa from kreatura
INNER JOIN ekwipunek
ON kreatura.idKreatury = ekwipunek.idKreatury
INNER JOIN zasob
ON ekwipunek.idZasobu = zasob.idZasobu;

--3.
SELECT kreatura.nazwa, COUNT(ekwipunek.idKreatury) from kreatura
LEFT JOIN ekwipunek
ON kreatura.idKreatury = ekwipunek.idKreatury
GROUP BY kreatura.nazwa HAVING COUNT(ekwipunek.idKreatury) = 0;
