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