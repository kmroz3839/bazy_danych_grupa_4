CREATE TABLE izba(
	adres_budynku VARCHAR(55) NOT NULL,
	nazwa_izby VARCHAR(55) NOT NULL,
	metraz INT UNSIGNED,
	wlasciciel INT UNSIGNED,
	FOREIGN KEY (wlasciciel) REFERENCES postac(id_postaci) ON DELETE SET NULL,
	CONSTRAINT id_izby PRIMARY KEY(adres_budynku, nazwa_izby)
);

ALTER TABLE izba ADD kolor VARCHAR(20) DEFAULT 'czarny';

INSERT INTO izba(adres_budynku, nazwa_izby, metraz, wlasciciel) VALUES
	()