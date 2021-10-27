CREATE TABLE przetwory(
	id_przetworu INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	rok_produkcji INT UNSIGNED DEFAULT 1654,
	id_wykonawcy INT UNSIGNED,
	FOREIGN KEY (id_wykonawcy) REFERENCES postac(id_postaci) ON DELETE CASCADE,
	zawartosc VARCHAR(45),
	dodatek VARCHAR(45) DEFAULT 'papryczka chilli',
	id_konsumenta INT UNSIGNED,
	FOREIGN KEY (id_konsumenta) REFERENCES postac(id_postaci) ON DELETE CASCADE
);

INSERT INTO przetwory(id_przetworu, rok_produkcji, id_wykonawcy, zawartosc, dodatek, id_konsumenta) VALUES
	(default, default, 1, 'bigos', default, 2);