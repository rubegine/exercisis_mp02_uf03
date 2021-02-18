  USE videoclub;

  DELIMITER //

  DROP PROCEDURE IF EXISTS  EX2//

  CREATE PROCEDURE  EX2()
    BEGIN
    DECLARE codi_peli smallint unsigned;

       SELECT id_peli
       INTO @codi_peli
       FROM PELLICULES
       WHERE recaudacio_peli = (
         SELECT MAX(recaudacio_peli)
         FROM PELLICULES);

    END //

  DELIMITER ;
CALL EX2;
