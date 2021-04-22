USE videoclub;

DELIMITER //

DROP PROCEDURE IF EXISTS act12_actorPrPeli//

CREATE PROCEDURE act12_actorPrPeli(
IN codi_peli smallint)
BEGIN

SELECT nom_actor
FROM ACTORS
INNER JOIN ACTORS_PELLICULES
ON ACTORS.id_actor = ACTORS_PELLICULES.id_actor
WHERE principal = true AND id_peli = codi_peli;

END//

DELIMITER ;

CALL act12_actorPrPeli(1);