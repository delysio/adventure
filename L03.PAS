Writeln;
Get_Narration(current_location);
Get_Narration(301);

Notify_On_Objects;

Writeln;
Print_Formatted_Text ('You can go [W]est or take the path [1][2][3]');

repeat

  key_legal := FALSE;
  key_hit := UpCase(ReadKey);

  case key_hit of
    '1': begin
      Writeln;
      Get_Narration(302);
      current_location := LOCATION_STONE_THRESHOLD;
      key_legal := TRUE;
    end;
    '2': begin
      current_location := LOCATION_CLIFF_OF_FORGETFULNESS;
      key_legal := TRUE;
    end;
    '3': begin
      Writeln;
      Get_Narration(303);
      Writeln;
      Print_Formatted_Text ('You are dead. Press [X] twice to exit to title screen.');

      while KeyPressed do key_hit := ReadKey;
      key_hit := ReadKey;  
      game_over := true;
        
    end;
    'W': begin
      current_location := LOCATION_ETERNAL_WHISPER;
      key_legal := TRUE;
    end;
    'G': begin
      if Item_Exists = TRUE then begin
        success := Add_To_Inventory(current_location);
        key_legal := TRUE;
      end;
    end;

  end;

  Process_Default_Keys(key_hit);

until key_legal = TRUE;

previous_location := LOCATION_CROSSROADS_OF_THORNS;