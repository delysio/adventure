Writeln;
Get_Narration(current_location);

if monsters[current_location].hit_points > 0 then begin

  Pre_Fight ('Night Preacher');

end;

if (monsters[current_location].hit_points = 0) then begin

  Get_Narration(161);

  if Is_In_Inventory(ITEM_TORCH) then begin

    Get_Narration(162);
    Get_Narration(163);

    Notify_On_Objects;

    Print_Formatted_Text ('You can go [S]outh, [E]ast');

  end else begin

    Notify_On_Objects;

    Print_Formatted_Text ('You can go [S]outh');

  end;                   

end;

repeat

    key_legal := FALSE;
    key_hit := UpCase(ReadKey);

  case key_hit of

      'E': begin
        if Is_In_Inventory(ITEM_TORCH) then begin
          current_location := LOCATION_ECHOES_OF_THE_ANCIENTS;
          key_legal := TRUE;
        end;
      end;
      'S': begin
        current_location := LOCATION_MOUND;
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

previous_location := LOCATION_MOUND_INSIDE;