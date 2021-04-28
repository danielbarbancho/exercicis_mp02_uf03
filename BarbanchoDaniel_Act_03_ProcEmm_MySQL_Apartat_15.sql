USE videoclub;

DELIMITER //


DROP TRIGGER IF EXISTS apartat_15;
 
CREATE TRIGGER apartat_15
AFTER INSERTS ON VISUALITZACIONS
FOR EACH ROW
BEGIN
DECLARE paCodiPeli smallint unsigned;
UPDATE PELLICULES
SET recaudacio_peli = recaudacio_peli + 2;
WHERE id_peli = new.id_peli;
END//

