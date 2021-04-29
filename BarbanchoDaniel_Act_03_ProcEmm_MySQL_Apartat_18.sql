USE videoclub;

DELIMITER //

DROP TRIGGER IF EXISTS apartat_18;

CREATE TRIGGER apartat_18
AFTER DELETE ON SOCIS
FOR EACH ROW
BEGIN

DECLARE pa_id_soci varchar(10);
DECLARE pa_qtat_visualitzacions smallint unsigned;

SET pa_id_soci = old.id_soci;

SELECT *
INTO pa_qtat_visualitzacions
FROM VISUALITZACIONS
WHERE id_soci = pa_id_soci;

UPDATE SOCIS
SET nvisualitzacio = pa_qtat_visualitzacions
WHERE id_soci = pa_id_soci;

END //

DELIMITER ;