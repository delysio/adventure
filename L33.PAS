Writeln;
Get_Narration(current_location);

if Is_In_Inventory(ITEM_BONDCUTTER) then begin

    Get_Narration(331);
    Writeln;
    Print_Formatted_Text ('You can go [E]ast, [W]est');

end else begin

    Get_Narration(332);
    Writeln;
    Print_Formatted_Text ('You can go [E]ast');

end;

repeat

    key_legal := FALSE;
    key_hit := UpCase(ReadKey);

    case key_hit of
        'W': begin
            if Is_In_Inventory(ITEM_BONDCUTTER) then begin
                current_location := LOCATION_SVAROGS_STONE_CIRCLE;
                key_legal := TRUE;
            end;
        end;
        'E': begin
                current_location := LOCATION_LAKE_NIGHT_DAY;
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

previous_location := LOCATION_THE_LESHY_VALLEY;