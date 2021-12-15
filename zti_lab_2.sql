
--z.1

--1.
SELECT nazwisko FROM pracownik ORDER BY nazwisko ASC;

--2.
SELECT imie, nazwisko, pensja FROM pracownik WHERE YEAR(data_urodzenia) > 1979;

--3.
SELECT * FROM pracownik WHERE pensja >= 3500 AND pensja <= 5000;

--4.
SELECT nazwa_towaru
FROM towar
LEFT JOIN stan_magazynowy ON towar.id_towaru = stan_magazynowy.towar
WHERE ilosc > 10;

--5.
SELECT * FROM towar
WHERE nazwa_towaru LIKE "A%" OR nazwa_towaru LIKE "B%" OR nazwa_towaru LIKE "C%";

--6.
SELECT * FROM klient
WHERE czy_firma = 0;

--7.
SELECT * FROM zamowienie
ORDER BY data_zamowienia DESC
LIMIT 10;

--8
SELECT * FROM pracownik
ORDER BY pensja ASC
LIMIT 5;