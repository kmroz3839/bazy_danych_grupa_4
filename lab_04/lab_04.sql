--zadanie 1

SELECT * FROM postac WHERE rodzaj = "wiking" AND nazwa != "Bjorn" ORDER BY wiek DESC;

SET foreign_key_checks = 0;

ALTER TABLE postac DROP FOREIGN KEY statek;

ALTER TABLE postac MODIFY id_postaci INT UNSIGNED;

ALTER TABLE postac DROP PRIMARY KEY;



--zadanie 2

ALTER TABLE postac ADD pesel CHAR(11);

ALTER TABLE postac ADD PRIMARY KEY (pesel);

ALTER TABLE postac MODIFY COLUMN rodzaj ENUM('wiking', 'ptak', 'kobieta', 'syrena')

INSERT INTO postac(id_postaci, nazwa, rodzaj) VALUES
	(10, "Gertruda Nieszczera", 'syrena');



--zadanie 3

UPDATE postac SET statek = "niszczyciel" WHERE nazwa LIKE "%a%";

UPDATE statek SET max_ladownosc = max_ladownosc*0.7 WHERE YEAR(data_wodowania) > 1900 AND YEAR(data_wodowania) < 2001;

ALTER TABLE postac ADD CHECK (wiek <= 1000);



--zadanie 4

ALTER TABLE postac MODIFY COLUMN rodzaj ENUM('wiking', 'ptak', 'kobieta', 'syrena', 'waz')

INSERT INTO postac(id_postaci, nazwa, rodzaj, data_ur, wiek) VALUES
	(default, "Loko", 'waz', "1655-01-01", 30);

CREATE TABLE marynarz LIKE postac;

INSERT INTO marynarz SELECT * FROM postac WHERE statek IS NOT NULL;


--zadanie 5
--a)
UPDATE postac SET statek = NULL WHERE statek IS NOT NULL;

--b)
DELETE FROM postac WHERE nazwa = "Awanturnik";

--c)
DELETE FROM statek;

--d)
DROP TABLE statek;

--e)
CREATE TABLE zwierz(
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nazwa VARCHAR(55),
	wiek INT UNSIGNED
);

--f)
INSERT INTO zwierz(nazwa, wiek) SELECT nazwa, wiek FROM postac WHERE rodzaj = 'ptak' OR rodzaj = 'waz';