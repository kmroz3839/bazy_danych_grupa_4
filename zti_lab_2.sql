
--zadania część 1

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



--zadania część 2

--1.
SELECT imie, nazwisko, dzial.nazwa
FROM pracownik
INNER JOIN dzial ON dzial.id_dzialu = pracownik.dzial;

--2.
SELECT nazwa_towaru, nazwa_kategori, ilosc
FROM towar
LEFT JOIN kategoria ON towar.kategoria = kategoria.id_kategori
LEFT JOIN stan_magazynowy ON towar.id_towaru = stan_magazynowy.towar
ORDER BY ilosc DESC;

--3.
SELECT * FROM zamowienie
LEFT JOIN status_zamowienia
ON zamowienie.status_zamowienia = status_zamowienia.id_statusu_zamowienia
WHERE nazwa_statusu_zamowienia = "anulowane";

--4.
SELECT * FROM klient
RIGHT JOIN adres_klienta ON klient.id_klienta = adres_klienta.klient
WHERE miejscowosc = "Olsztyn";

--5.
SELECT id_jednostki, nazwa FROM jednostka_miary
LEFT JOIN stan_magazynowy ON stan_magazynowy.jm = jednostka_miary.id_jednostki
WHERE stan_magazynowy.jm IS NULL;

--6.
SELECT numer_zamowienia, nazwa_towaru, ilosc, cena
FROM zamowienie
INNER JOIN pozycja_zamowienia ON pozycja_zamowienia.zamowienie = zamowienie.id_zamowienia
LEFT JOIN towar ON pozycja_zamowienia.towar = towar.id_towaru
WHERE YEAR(data_zamowienia) = 2018;

--7.
CREATE TABLE towary_full_info(
	nazwa_towaru VARCHAR(255),
	cena_zakupu DECIMAL(7,2),
	kategoria VARCHAR(45),
	ilosc DECIMAL(7,2),
	jednostka_miary VARCHAR(45)
);

--8.
SELECT * FROM pozycja_zamowienia
INNER JOIN zamowienie ON pozycja_zamowienia.zamowienie = id_zamowienia
ORDER BY data_zamowienia ASC
LIMIT 5;

--9.
SELECT * FROM zamowienie
LEFT JOIN status_zamowienia
ON zamowienie.status_zamowienia = status_zamowienia.id_statusu_zamowienia
WHERE nazwa_statusu_zamowienia <> "zrealizowane";

--10.
SELECT * FROM adres_klienta WHERE kod NOT LIKE '[0-9][0-9][-][0-9][0-9][0-9]';