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

CREATE TABLE marynarz LIKE postac;

INSERT INTO marynarz SELECT * FROM postac WHERE statek IS NOT NULL;
