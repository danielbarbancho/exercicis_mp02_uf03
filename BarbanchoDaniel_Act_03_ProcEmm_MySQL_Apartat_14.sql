USE videoclub;

DELIMITER //

DROP TRIGGER IF EXISTS apartat_14_1//
DROP TRIGGER IF EXISTS apartat_14_2//

CREATE TRIGGER apartat_14_1
BEFORE UPDATE ON PELLICULES
FOR EACH ROW
BEGIN
SET new.titol_peli = upper(new.titol_peli);
END//

CREATE TRIGGER apartat_14_2
BEFORE UPDATE ON PELLICULES
FOR EACH ROW
BEGIN
SET new.titol_peli = upper(new.titol_peli);
END//

DELIMITER ;
