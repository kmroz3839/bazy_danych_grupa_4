CREATE TABLE walizka(
	id_walizki INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	pojemnosc INT UNSIGNED,
	kolor ENUM('rozowy', 'czerwony', 'teczowy', 'zolty'),
	id_wlasciciela INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_wlasciciela) REFERENCES postac(id_postaci) ON DELETE CASCADE
);

ALTER TABLE walizka
ALTER kolor SET DEFAULT 'rozowy';

INSERT INTO walizka(id_walizki, pojemnosc, kolor, id_wlasciciela) VALUES
	(default, 20, 'czerwony', 1),
	(default, 4, default, 2);