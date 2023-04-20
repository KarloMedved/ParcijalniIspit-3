


CREATE TABLE zaposlenici (
  id int NOT NULL AUTO_INCREMENT,
  ime varchar(255) NOT NULL,
  prezime varchar(255) NOT NULL,
  placa DECIMAL NOT NULL,
  PRIMARY KEY (id_Zaposleni)
);


CREATE TABLE odjeli (
  id_Odjeli int NOT NULL AUTO_INCREMENT,
  voditelj_id int NOT NULL,
  KEY voditelj_id (voditelj_id),
  PRIMARY KEY (id_Odjeli));
 
 ALTER TABLE Firma.odjeli 
 ADD Ime varchar(255) NULL;

 
 CREATE TABLE odjel_zaposlenici (
  id_Radnici int NOT NULL AUTO_INCREMENT,
  id_odjel2 int NOT NULL,
  zaposlen_id int NOT NULL,
  KEY zaposlen_id (zaposlen_id),
  KEY id_odjel2 (id_odjel2),
  PRIMARY KEY (id_Radnici)); 

 
 INSERT INTO zaposlenici (ime, prezime, placa)
VALUES ('Marko', 'Marić', 1300.00),
	('Food', 'Bar', 700.00),
	('Baz', 'Zar', 500.00),
	('Tra', 'Gib', 700.00),
	('Mir', 'Tko', 1000.00);

INSERT INTO odjeli (id_Odjeli, voditelj_id, Ime)
VALUES (1, 1, 'Ludski resursi'),
(2, 5, 'Prodaja');

INSERT INTO  odjel_zaposlenici (id_odjel2,  zaposlen_id)
VALUES (1, 1),
(1, 3),
(2,2),
(2, 4),
(2, 5);


SELECT ime, prezime, placa FROM zaposlenici;


SELECT AVG(zaposlenici.placa) FROM zaposlenici
INNER JOIN odjeli ON odjeli.voditelj_id = z;


DROP PROCEDURE IF EXISTS prosjekPlaca;

DELIMITER //

CREATE PROCEDURE prosjekPlaca(OUT prosjek DECIMAL(9,2))
BEGIN
    SELECT AVG(placa) INTO prosjek FROM zaposlenici;
END//
DELIMITER ;

CALL prosjekPlaca(@prosjek);
SELECT @prosjek;


