DELIMITER //

CREATE PROCEDURE sp02_exercici_llistaActors ()
BEGIN
	SELECT nom_actor, data_actor
	FROM ACTORS
	WHERE sexe_actor = "home";
END //

DELIMITER;