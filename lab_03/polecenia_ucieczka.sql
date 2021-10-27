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

ALTER TABLE postac ADD funkcja VARCHAR(45);

UPDATE postac SET funkcja = 'kapitan' WHERE nazwa = 'Bjorn';

ALTER TABLE postac ADD 