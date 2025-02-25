  Writeln;
  Get_Narration(current_location);

  if monsters[current_location].hit_points > 0 then begin

    Get_Narration(181);

    Pre_Fight ('Stribog');
  
  end;

  if (monsters[current_location].hit_points = 0) then begin

    Get_Narration(182);

    Notify_On_Objects;

  end;

  if (monsters[current_location].hit_points = 0) and (Is_In_Inventory(ITEM_SVIATOVIDS_HORN) = TRUE) then begin

    Get_Narration(183);
    Get_Narration(184);
    Get_Narration(185);
    Writeln;
    Writeln ('Press [T] to teleport.')

  end;

repeat

    key_legal := FALSE;
    key_hit := UpCase(ReadKey);
  
    case key_hit of

      'T': begin
        if (monsters[current_location].hit_points = 0) and (Is_In_Inventory(ITEM_SVIATOVIDS_HORN) = TRUE) then begin
          current_location := LOCATION_START;
          key_legal := TRUE;
        end;
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

  previous_location := LOCATION_FORGOTTEN_BASIN;