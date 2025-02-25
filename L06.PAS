Writeln;
Get_Narration(current_location);

if mystery_solved_6 = FALSE then begin

  Get_Narration(601);
  Get_Narration(602);
  Get_Narration(603);

  Writeln;
  Get_Narration(604);
  Get_Narration(605);
  Get_Narration(606);

  Writeln;
  Print_Formatted_Text ('Choose [1][2][3] to solve');
  Print_Formatted_Text ('or go [S]outh')

end else begin

  Notify_On_Objects;
  Print_Formatted_Text ('You can go [S]outh');
  
end;

repeat

  key_legal := FALSE;
  key_hit := UpCase(ReadKey);

  case key_hit of
    '1', '3': begin
      if mystery_solved_6 = FALSE then begin
        Print_Formatted_Text ('The stone circle bursts into flames and knocks you to the ground.');
        mystery_solved_6 := TRUE;
        location_items[LOCATION_FOREST_OF_WHISPERS, 0] := ITEM_NONE;
        key_legal := TRUE;
      end;
    end;
    '2': begin
      if mystery_solved_6 = FALSE then begin
        Print_Formatted_Text ('Swarog is the god of fire (and smithing), which gives heat and ' +
                              'determines the order of the world.');
        Print_Formatted_Text ('The reward is yours.');
        mystery_solved_6 := TRUE;
        success := Add_To_Inventory(current_location);
        key_legal := TRUE;
      end;
    end;
    'S': begin
      current_location := LOCATION_CROSSROADS_OF_SHADOWS;
      key_legal := TRUE;
    end;
    'G': begin
      if (Item_Exists = TRUE) and (mystery_solved_6 = TRUE) then begin
        success := Add_To_Inventory(current_location);
        key_legal := TRUE;
      end;
    end;
  end;

  Process_Default_Keys(key_hit);

until key_legal = TRUE;

previous_location := LOCATION_FOREST_OF_WHISPERS;