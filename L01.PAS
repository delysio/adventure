  Writeln;
  Get_Narration(current_location);

  if monsters[current_location].hit_points > 0 then begin
  
    Pre_Fight ('Planetnik');
  
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
    current_location := LOCATION_STONE_THRESHOLD;
    key_legal := TRUE;
  end;
  'F': begin
    if monsters[current_location].hit_points > 0 then begin
      Fight;
      key_legal := TRUE;
    end;
  end;
  'G': begin
    if (monsters[current_location].hit_points = 0) and (Item_Exists = TRUE) then begin
      success := Add_To_Inventory(current_location);
      key_legal := TRUE;
    end;
  end;

  end;

  Process_Default_Keys(key_hit);

until key_legal = TRUE;

previous_location := LOCATION_SACRED_GROVE;