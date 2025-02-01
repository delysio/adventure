  Writeln;
  Print_Formatted_Text ('A peaceful forest clearing, surrounded by tall pine trees whose tops seem to ' +
                     'touch the sky. In its very centre stands a wooden chapel, carved with images ' +
                     'of guardian deities and spirits, and a small eternal sacrificial fire burns ' +
                     'in front of it.');

  if monsters[current_location].hit_points > 0 then begin
  
    Pre_Fight ('Planetnik');
  
  end;

  if (monsters[current_location].hit_points = 0) then begin

  Notify_On_Objects;

  end;

  Print_Formatted_Text ('You can go [S]outh');
  
  key_hit := UpCase(ReadKey);
  
  case key_hit of

  'S': begin
    current_location := LOCATION_STONE_THRESHOLD;
  end;
  'F': begin
    Fight;
  end;
  'G': begin
    if (monsters[current_location].hit_points = 0) and (Item_Exists(current_location) = TRUE) then begin
        success := Add_To_Inventory(current_location);
    end;
  end;

  end;

  Process_Default_Keys(key_hit);

  previous_location := LOCATION_SACRED_GROVE;