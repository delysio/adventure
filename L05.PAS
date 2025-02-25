Writeln;
Get_Narration(current_location);

if mystery_solved_5 = FALSE then begin

  Get_Narration(501);

  Writeln;
  Get_Narration(502);
  Get_Narration(503);
  Get_Narration(504);

  Writeln;
  Print_Formatted_Text ('Choose [1][2][3][4] to solve');
  Print_Formatted_Text ('or go [W]est')

end else begin

  Notify_On_Objects;
  Print_Formatted_Text ('You can go [W]est, [S]outh');
  
end;



repeat

  key_legal := FALSE;
  key_hit := UpCase(ReadKey);

  case key_hit of
    '1', '2', '3': begin
      if mystery_solved_5 = FALSE then begin
        Writeln;
        Print_Formatted_Text ('As you stand on the slab, the air vibrates and the tomb trembles. Suddenly the altar ' +
                              'cracks with a deafening bang, the stone blocks fall, burying the ancient artefact under ' +
                              'tons of rubble. Silence falls anew - you have survived.');
        mystery_solved_5 := TRUE;
        location_items[LOCATION_TOMB_OF_THE_GODS, 0] := ITEM_NONE;
        key_legal := TRUE;
      end;
    end;
    '4': begin
      if mystery_solved_5 = FALSE then begin
        Writeln;
        Print_Formatted_Text ('Your perspicacity is amazing, the correct answer is roots because they are the basis ' +
                              'of everything, although they remain hidden.');
        Print_Formatted_Text ('The reward is yours.');
        mystery_solved_5 := TRUE;
        success := Add_To_Inventory(current_location);
        key_legal := TRUE;
      end;
    end;
    'S': begin
      if mystery_solved_5 = TRUE then begin
        current_location := LOCATION_INFINITE_STAIRCASE;
        key_legal := TRUE;
      end;
    end;
    'W': begin
      current_location := LOCATION_CLIFF_OF_FORGETFULNESS;
      key_legal := TRUE;
    end;
    'G': begin
      if (Item_Exists = TRUE) and (mystery_solved_5 = TRUE) then begin
        success := Add_To_Inventory(current_location);
        key_legal := TRUE;
      end;
    end;
  end;

  Process_Default_Keys(key_hit);

until key_legal = TRUE;

previous_location := LOCATION_TOMB_OF_THE_GODS;