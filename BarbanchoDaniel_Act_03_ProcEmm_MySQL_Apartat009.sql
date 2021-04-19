USE videoclub;

DELIMITER //

DROP PROCEDURE IF EXISTS act09_precedere//


CREATE PROCEDURE act09_precedere()
BEGIN

DECLARE cActor bigint default 0;
DECLARE final int default false;

DECLARE elcursor cursor for
SELECT id_actor
FROM ACTORS;

DECLARE continue handler for not found set final = 1;
OPEN elcursor;
elbucle:loop
FETCH elcursor into cActor;

IF final = 1 then
leave elbucle;
END IF;
SELECT nom_actor, year(curdate()) - anynaix_actor"anys", anynaix_actor, sexe_actor,
/*condicio home*/
IF(sexe_actor="home",
IF(year(curdate()) - anynaix_actor<15,"nen",
IF(year(curdate()) - anynaix_actor BETWEEN 15 AND 25,"home adolescent i jove",
IF(year(curdate()) - anynaix_actor BETWEEN 26 AND 40, "home adult",
IF(year(curdate()) - anynaix_actor BETWEEN 41 AND 60, "home madur",
IF(year(curdate()) - anynaix_actor>61, "home gran",""))))),

/*condicio dona*/
IF(year(curdate()) - anynaix_actor<15,"nena",
IF(year(curdate()) - anynaix_actor BETWEEN 15 AND 25,"dona adolescent i jove",
IF(year(curdate()) - anynaix_actor BETWEEN 26 AND 40, "dona adult",
IF(year(curdate()) - anynaix_actor BETWEEN 41 AND 60, "dona madura",
IF(year(curdate()) - anynaix_actor>61, "dona gran","")))))) as "Paper que pot interpretar"
FROM ACTORS
WHERE ACTORS.id_actor = cActor;
END loop elbucle;
CLOSE elcursor;
END//

DELIMITER ;

-- call act09_precedere();