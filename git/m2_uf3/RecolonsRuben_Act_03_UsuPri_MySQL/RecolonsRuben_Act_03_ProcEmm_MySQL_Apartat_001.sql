USE videoclub;
DELIMITER //

DROP PROCEDURE IF EXISTS  EX1//

CREATE PROCEDURE  EX1(
       IN p_codiPelicula smallint unsigned )
  BEGIN

     SELECT titol_peli, nom_actor
     FROM PELLICULES, ACTORS_PELLICULES
     INNER JOIN ACTORS ON ACTORS_PELLICULES.id_actor = ACTORS.id_actor
     WHERE PELLICULES.id_peli = p_codiPelicula
     AND ACTORS_PELLICULES.id_peli = PELLICULES.id_peli;
  END //

DELIMITER ;
CALL EX1(8);
