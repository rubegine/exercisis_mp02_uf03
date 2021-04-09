use videoclub;
drop procedure if exists act8;
delimiter //
create procedure act8()
begin
   declare recaptatacio bigint default 0;
   declare pressupost bigint default 0;
   declare titol varchar(30);
   declare rendibilitat varchar(15);
   declare final int default false;

   declare elcursor cursor for
      select titol_peli, recaudacio_peli, pressupost_peli from PELLICULES;

   declare continue handler for not found set final = 1;
   open elcursor;
   elbucle:loop
      fetch elcursor into titol, recaptatacio, pressupost;

      if final = 1 then
         leave elbucle;
      end if;

      if (pressupost>recaptatacio) then
         set rendibilitat = "Deficitari";
      elseif (pressupost*2 > recaptatacio) then
         set rendibilitat = "Suficient";
      else
         set rendibilitat = "Bona";
      end if;
      select titol, rendibilitat;
      end loop elbucle;
close elcursor;
end//
delimiter ;
call act8();
