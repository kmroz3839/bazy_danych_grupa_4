--zadanie 1.

--1.
CREATE TABLE kreatura2 AS SELECT * FROM wikingowie.kreatura;
CREATE TABLE uczestnicy AS SELECT * FROM wikingowie.uczestnicy;
CREATE TABLE etapy_wyprawy AS SELECT * FROM wikingowie.etapy_wyprawy;
CREATE TABLE sektor AS SELECT * FROM wikingowie.sektor;
CREATE TABLE wyprawa AS SELECT * FROM wikingowie.wyprawa;

--2.
SELECT nazwa
FROM kreatura2
LEFT JOIN uczestnicy ON kreatura2.idKreatury = uczestnicy.id_uczestnika
GROUP BY nazwa
HAVING COUNT(id_wyprawy) = 0;

--3.
SELECT nazwa, SUM(ilosc)
FROM wyprawa
LEFT JOIN uczestnicy ON wyprawa.id_wyprawy = uczestnicy.id_wyprawy
LEFT JOIN ekwipunek ON ekwipunek.idKreatury = uczestnicy.id_uczestnika
GROUP BY nazwa;



--zadanie 2.

--1.
SELECT wyprawa.nazwa, GROUP_CONCAT(kreatura2.nazwa) AS uczestnicy
FROM wyprawa
LEFT JOIN uczestnicy ON wyprawa.id_wyprawy = uczestnicy.id_wyprawy
LEFT JOIN kreatura2 ON uczestnicy.id_uczestnika = kreatura2.idKreatury
GROUP BY wyprawa.nazwa;

--2.
--!



--zadanie 3.

--1.
SELECT sektor.nazwa, COUNT(etapy_wyprawy.sektor) as "ilosc odwiedzin"
FROM sektor
LEFT JOIN etapy_wyprawy ON etapy_wyprawy.sektor =  sektor.id_sektora
GROUP BY sektor.nazwa;

--2.
SELECT kreatura2.nazwa, IF(COUNT(wyprawa.id_wyprawy) = 0, "nie bral udzialu w wyprawie", "bral udzial w wyprawie") as "bral udzial?"
FROM kreatura2
LEFT JOIN uczestnicy ON uczestnicy.id_uczestnika = kreatura2.idKreatury
LEFT JOIN wyprawa ON wyprawa.id_wyprawy = uczestnicy.id_wyprawy
GROUP BY kreatura2.nazwa;

