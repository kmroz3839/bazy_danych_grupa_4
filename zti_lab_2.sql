
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

--9
SELECT * FROM towar
WHERE nazwa_towaru NOT LIKE "%a%"
ORDER BY cena_zakupu DESC
LIMIT 10;

--10.
SELECT * FROM towar
LEFT JOIN stan_magazynowy ON stan_magazynowy.towar = towar.id_towaru
LEFT JOIN jednostka_miary ON stan_magazynowy.jm = jednostka_miary.id_jednostki
WHERE nazwa = "szt"
ORDER BY towar.nazwa_towaru ASC;

SELECT * FROM towar
LEFT JOIN stan_magazynowy ON stan_magazynowy.towar = towar.id_towaru
LEFT JOIN jednostka_miary ON stan_magazynowy.jm = jednostka_miary.id_jednostki
WHERE nazwa = "szt"
ORDER BY towar.cena_zakupu DESC;

--11.
CREATE TABLE towary_powyzej_100 AS 
(SELECT * FROM towar WHERE cena_zakupu >= 100);

--12.
CREATE TABLE pracownik_50_plus LIKE pracownik;
INSERT INTO pracownik_50_plus (SELECT * FROM pracownik WHERE YEAR(NOW()) - YEAR(data_urodzenia) >= 50);