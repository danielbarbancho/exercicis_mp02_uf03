ALTER TABLE SOCIS
ADD nvisualitzacio smallint unsigned;

USE videoclub;

DELIMITER //

DROP TRIGGER IF EXISTS apartat_16;

CREATE TRIGGER apartat_16
AFTER INSERT ON VISUALITZACIONS
FOR EACH ROW
BEGIN

DECLARE pa_id_soci varchar(10);
DECLARE pa_qtat_visualitzacions smallint unsigned;

SET pa_id_soci = new.id_soci;

SELECT count(*)
INTO pa_qtat_visualitzacions
FROM VISUALITZACIONS
WHERE id_soci = pa_id_soci;

UPDATE SOCIS
SET nvisualitzacio = pa_qtat_visualitzacions
WHERE id_soci = pa_id_soci;

END//

DELIMITER ;
