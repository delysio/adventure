Writeln;
Get_Narration(current_location);

if monsters[current_location].hit_points > 0 then begin

  Get_Narration(304);
  Get_Narration(305);

  Pre_Fight ('King of Drowners');

end;

if (monsters[current_location].hit_points = 0) then begin

    Notify_On_Objects;   

end;   

Print_Formatted_Text ('You can go [S]outh');

repeat

  key_legal := FALSE;
  key_hit := UpCase(ReadKey);

  case key_hit of

      'S': begin
        current_location := LOCATION_BLOODY_ROOTS;
        key_legal := TRUE;
      end;
      'F': begin
        if monsters[current_location].hit_points > 0 then begin
          Fight;
          key_legal := TRUE;
        end;
      end;
      'G': begin
        if (Item_Exists = TRUE) and (monsters[current_location].hit_points = 0) then begin
          success := Add_To_Inventory(current_location);
          key_legal := TRUE;
        end;
      end;
      
  end;

  Process_Default_Keys(key_hit);

until key_legal = TRUE;

previous_location := LOCATION_MELT_SWAMP;