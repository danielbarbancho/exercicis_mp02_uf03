USE videoclub;

DELIMITER //

DROP PROCEDURE IF EXISTS act03_agafaActorsPerPeli//

CREATE PROCEDURE act03_agafaActorsPerPeli(
IN codi_Peli smallint)
BEGIN
DECLARE codi_Actor smallint;

SELECT nom_peli
FROM PELLICULES
WHERE id_peli = codi_Peli;

SELECT id_actor INTO codi_Actor
FROM ACTORS_PELLICULES
WHERE id_peli = codi_Peli;

SELECT nom_actor
FROM ACTORS
WHERE id_actor = codi_Actor;

SELECT papel
FROM ACTORS_PELLICULES
WHERE id_actor = codi_Actor AND id_peli = codi_Peli;

END //

DELIMITER ;

CALL act03_agafaActorsPerPeli(1);