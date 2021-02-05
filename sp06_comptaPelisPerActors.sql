USE videoclub;

DELIMITER //

DROP PROCEDURE IF EXISTS sp06_comptaPelisPerActors//

CREATE PROCEDURE sp06_comptaPelisPerActors(
IN p_nomActors varchar(30))
BEGIN
DECLARE codi_Actor smallint;
DECLARE qtat_Pelis smallint;

SELECT id_actor INTO codi_Actor
FROM ACTORS
WHERE nom_actor = p_nomActors;

SELECT COUNT(id_peli) INTO qtat_Pelis
FROM ACTORS_PELLICULES
WHERE id_actor=codi_Actor;

SELECT CONCAT( "L'actor ", p_nomActors, " ha fet ", qtat_Pelis, " pelicules!") AS Pel·lícules;

END //

DELIMITER ;

CALL sp06_comptaPelisPerActors("Nicolas Cage");