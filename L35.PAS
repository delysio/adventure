Writeln;
Get_Narration(current_location);

if Is_In_Inventory(ITEM_DAZHBOGS_DIAMOND) then begin

    Get_Narration(351);
    Get_Narration(352);
    Get_Narration(353);

    Print_Formatted_Text ('You can go [N]orth, [E]ast');

end else begin

    Print_Formatted_Text ('You can go [E]ast');

end;

Notify_On_Objects;

repeat

    key_legal := FALSE;
    key_hit := UpCase(ReadKey);

    case key_hit of
        'N': begin
            if Is_In_Inventory(ITEM_DAZHBOGS_DIAMOND) then begin
                current_location := LOCATION_WIND_AND_BONE_PASS;
                key_legal := TRUE;
            end;
        end;
        'E': begin
            current_location := LOCATION_BLOODY_ROOTS;
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

previous_location := LOCATION_DARK_HARBOUR;