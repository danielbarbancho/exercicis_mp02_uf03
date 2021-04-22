USE videoclub;

DELIMITER //

DROP PROCEDURE IF EXISTS act13_peliPrMax//

CREATE PROCEDURE act13_peliPrMax()
BEGIN

SELECT id_peli
FROM PELLICULES
WHERE recaudacio_peli = (SELECT MAX(recaudacio_peli) FROM PELLICULES);

END//

DELIMITER ;

CALL act13_peliPrMax();