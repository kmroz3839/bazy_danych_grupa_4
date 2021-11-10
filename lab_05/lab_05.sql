--zadanie 1

--1.
CREATE TABLE kreatura AS SELECT * FROM wikingowie.kreatura;
CREATE TABLE zasob AS SELECT * FROM wikingowie.zasob;
CREATE TABLE ekwipunek AS SELECT * FROM wikingowie.ekwipunek;

--2.
SELECT * FROM zasob;

--3.
SELECT * FROM zasob WHERE rodzaj = 'jedzenie';

--4.
SELECT idZasobu, ilosc FROM ekwipunek WHERE idKreatury IN (1,3,5);


--zadanie 2

--1.
SELECT * FROM kreatura WHERE rodzaj <> 'wiedzma' AND udzwig >= 50;

--2.
SELECT * FROM zasob WHERE waga >= 2 AND waga <= 5;

--3.
SELECT * from kreatura WHERE nazwa LIKE "%or%" AND udzwig >= 30 AND udzwig <= 70;


--zadanie 3

--1.
SELECT * FROM zasob WHERE MONTH(dataPozyskania) = 7 OR MONTH(dataPozyskania) = 8;

--2.
SELECT * FROM zasob WHERE rodzaj IS NOT NULL ORDER BY waga ASC;

--3.
SELECT * FROM kreatura ORDER BY dataUr ASC LIMIT 5;


--zadanie 4

--1.
SELECT DISTINCT rodzaj FROM zasob WHERE rodzaj IS NOT NULL;

--2.
SELECT CONCAT(nazwa, " - ", rodzaj) FROM kreatura WHERE rodzaj LIKE "wi%";

--3.
SELECT idZasobu, nazwa, dataPozyskania, rodzaj, waga*ilosc FROM zasob WHERE YEAR(dataPozyskania) >= 2000 AND YEAR(dataPozyskania) <= 2007;


--zadanie 5

--1.
SELECT SUM(waga*ilosc)*0.7 AS "wl.jedzenie", SUM(waga*ilosc)*0.3 AS "odpad" FROM zasob;

--2.
SELECT * FROM zasob WHERE rodzaj IS NULL;

--3.
SELECT DISTINCT nazwa, rodzaj FROM zasob WHERE nazwa LIKE "ba%" OR nazwa LIKE "%os" ORDER BY rodzaj DESC;
