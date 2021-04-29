ALTER TABLE PELLICULES
ADD qtatVisualComp smallint unsigned;

ALTER TABLE PELLICULES
ADD qtatVisualParc smallint unsigned;

USE videoclub;

DELIMITER //

DROP TRIGGER IF EXISTS apartat_17;

CREATE TRIGGER apartat_17
AFTER INSERT ON VISUALITZACIONS
FOR EACH ROW
BEGIN

DECLARE pa_qtat_visualcomp smallint;
DECLARE pa_qtat_visualparc smallint;

SELECT count(*)
INTO pa_qtat_visualcomp
FROM VISUALITZACIONS
WHERE temps IS NULL AND id_peli = new.id_peli;

SELECT count(*)
INTO pa_qtat_visualparc
FROM VISUALITZACIONS
WHERE temps IS NOT NULL AND id_peli = new.id_peli;

UPDATE PELLICULES
SET qtatVisualComp = pa_qtat_visualcomp
WHERE id_peli = new.id_peli;

UPDATE PELLICULES
SET qtatVisualParc = pa_qtat_visualparc
WHERE id_peli = new.id_peli;

END //

DELIMITER ;

