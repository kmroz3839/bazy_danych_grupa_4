INSERT INTO postac(id_postaci, nazwa, rodzaj, data_ur, wiek) VALUES
	(default, 'Zdrajca', 'wiking', '1999-09-09', 18),
	(default, 'Intruz', 'wiking', '1654-01-01', 21),
	(default, 'Szkodnik', 'wiking', '1696-04-02', 18),
	(default, 'Awanturnik', 'wiking', '1666-06-06', 24),
	(default, 'Maurycy', 'wiking', '1686-09-15', 23);

CREATE TABLE statek(
	nazwa VARCHAR(255) NOT NULL PRIMARY KEY,
	rodzaj enum('statek', 'ulepszony statek+1', 'ulepszony statek+2', 'statek bitewny+4') NOT NULL,
	data_wodowania DATE,
	max_ladownosc INT UNSIGNED
);

INSERT INTO statek(nazwa, rodzaj, data_wodowania, max_ladownosc) VALUES 
	('niszczyciel', 'statek bitewny+4', '1686-01-01', 1000),
	('pogromca', 'ulepszony statek+2', '1686-01-01', 250);

ALTER TABLE postac ADD funkcja VARCHAR(45);

UPDATE postac SET funkcja = 'kapitan' WHERE nazwa = 'Bjorn';

ALTER TABLE postac ADD statek VARCHAR(45);
ALTER TABLE postac ADD FOREIGN KEY (statek) REFERENCES statek(nazwa);

UPDATE postac SET statek = 'niszczyciel' WHERE rodzaj = 'wiking';
UPDATE postac SET statek = 'niszczyciel' WHERE nazwa = 'Drozd';

DELETE FROM izba WHERE nazwa_izby = 'spizarnia';
DROP TABLE izba;