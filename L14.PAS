Writeln;
Get_Narration(current_location);

if Is_In_Inventory(ITEM_MACHETE) = FALSE then begin

    Get_Narration(141);
    Print_Formatted_Text ('You can go [E]ast');

end else begin

    Get_Narration(142);
    Notify_On_Objects;

    Print_Formatted_Text ('You can go [S]outh or [E]ast');

end;

repeat

    key_legal := FALSE;
    key_hit := UpCase(ReadKey);

    case key_hit of
        
        'E': begin
            current_location := LOCATION_START;
            key_legal := TRUE;
        end;
        'S': begin
            if Is_In_Inventory(ITEM_MACHETE) then begin
                current_location := LOCATION_STREAM;
                key_legal := TRUE;
            end;
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

previous_location := LOCATION_BUSHES;