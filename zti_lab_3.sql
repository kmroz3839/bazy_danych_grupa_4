--1.
SELECT imie, nazwisko, YEAR(data_urodzenia) FROM pracownik;

--2.
SELECT imie, nazwisko, YEAR(NOW()) - YEAR(data_urodzenia) FROM pracownik;

--3.
SELECT id_dzialu, nazwa, COUNT(id_pracownika)
FROM dzial
RIGHT JOIN pracownik
ON dzial.id_dzialu = pracownik.dzial
GROUP BY id_dzialu;

--4.
SELECT id_kategori, nazwa_kategori, SUM(ilosc)
FROM kategoria
RIGHT JOIN towar ON towar.kategoria = kategoria.id_kategori
INNER JOIN stan_magazynowy ON stan_magazynowy.towar = towar.id_towaru
GROUP BY id_kategori;

--5.
SELECT id_kategori, nazwa_kategori, GROUP_CONCAT(nazwa_towaru)
FROM kategoria
RIGHT JOIN towar ON towar.kategoria = kategoria.id_kategori
GROUP BY id_kategori;

--6.
SELECT ROUND(AVG(pensja),2)
FROM pracownik;

--7.
SELECT ROUND(AVG(pensja),2)
FROM pracownik
WHERE YEAR(NOW()) - YEAR(data_zatrudnienia) >= 5;

--8.


--9.
SELECT numer_zamowienia, SUM(cena*ilosc)
FROM zamowienie
LEFT JOIN pozycja_zamowienia
ON zamowienie.id_zamowienia = pozycja_zamowienia.zamowienie
WHERE QUARTER(data_zamowienia) = 1 AND YEAR(data_zamowienia) = 2017
GROUP BY numer_zamowienia;

--10.

