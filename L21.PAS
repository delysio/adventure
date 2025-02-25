Writeln;
Get_Narration(current_location);

if Is_In_Inventory(ITEM_TORCH) then begin

    Get_Narration(211);

    Notify_On_Objects;

end;

Writeln ('You can go [S]outh');

repeat

    key_legal := FALSE;
    key_hit := UpCase(ReadKey);

    case key_hit of
        
        'S': begin
            current_location := LOCATION_ROCKS;
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
previous_location := LOCATION_CAVE;