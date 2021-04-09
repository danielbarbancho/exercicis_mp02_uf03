USE videoclub;

DELIMITER //

DROP FUNCTION IF EXISTS sp11_usuariVeure//

CREATE FUNCTION sp11_usuariVeure(p_CodiPeli SMALLINT UNSIGNED)
RETURNS SMALLINT UNSIGNED
DETERMINISTIC
BEGIN

DECLARE Qtat_Exemp SMALLINT UNSIGNED;

SELECT COUNT(*)
INTO Qtat_Exemp
FROM EXEMPLARS
WHERE id_peli = p_CodiPeli;

RETURN Qtat_Exemp;

END//

DELIMITER ;


// Proba del sql.

SELECT titol_peli Titol, sp11_usuariVeure "Quantitat de exemplars"
FROM PELLICULES
id_peli = 1;