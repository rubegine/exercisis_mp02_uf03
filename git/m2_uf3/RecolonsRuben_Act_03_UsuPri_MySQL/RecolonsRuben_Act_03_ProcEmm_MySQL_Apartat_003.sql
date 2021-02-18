USE videoclub;

DELIMITER //

DROP PROCEDURE IF EXISTS  EX3//

CREATE PROCEDURE  EX3()
  BEGIN
  DECLARE titol_pelic varchar(40);
  DECLARE p_recaudacio bigint(20);

     SELECT titol_peli
     INTO @titol_pelic
     FROM PELLICULES
     WHERE recaudacio_peli = (
       SELECT MAX(recaudacio_peli)
       FROM PELLICULES);

    SELECT recaudacio_peli
    INTO @p_recaudacio
    FROM PELLICULES
    WHERE recaudacio_peli = (
     SELECT MAX(recaudacio_peli)
     FROM PELLICULES);

  END //

DELIMITER ;
CALL EX3;
