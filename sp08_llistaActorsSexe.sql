USE videoclub;

DELIMITER //

DROP PROCEDURE IF EXISTS sp08_llistaActorsSexe//

CREATURE PROCEDURE sp08_llistaActorsSexe(
IN p_sexeActors varchar(4))
BEGIN
DECLARE codi_Actor smallint;
DECLARE nom_Actor varchar(30);

SELECT id_actor INTO codi_Actor
FROM ACTORS
WHERE sexe_actor = p_sexeActors;

SELECT nom_actor INTO nom_Actor
FROM ACTORS
WHERE id_actor = codi_Actor;

SELECT CONCAT ("L'actor ", nom_Actor, " és ", p_sexeActors) AS Sexo

END //

DELIMITER ;

CALL sp08_llistaActorsSexe("Dona");