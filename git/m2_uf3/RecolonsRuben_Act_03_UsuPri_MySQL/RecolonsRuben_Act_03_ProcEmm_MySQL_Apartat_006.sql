USE videoclub;

DELIMITER //

DROP PROCEDURE IF EXISTS  EX6//

CREATE PROCEDURE  EX6(
IN codi_peli smallint unsigned)
-- La clàusula BEGIN indica l'inici del procediment.
  BEGIN
  SELECT titol_peli,
  if(recaudacio_peli<pressupost_peli, "Deficitari",
  if(recaudacio_peli<(pressupost_peli/2), "Suficient",
  if(recaudacio_peli>(pressupost_peli*2), "Bona", ""))) as Rendabilitat

  FROM PELLICULES
  WHERE  id_peli = codi_peli;

  END //

DELIMITER ;
CALL EX6(8);
