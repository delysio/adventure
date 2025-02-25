Writeln;
Get_Narration(current_location);

Notify_On_Objects;

Print_Formatted_Text ('You can go [W]est, [S]outh');

repeat

    key_legal := FALSE;
    key_hit := UpCase(ReadKey);

    case key_hit of

        'S': begin
            current_location := LOCATION_LAKE_OF_SOULS;
            key_legal := TRUE;
        end;
        'W': begin
            current_location := LOCATION_MOUND;
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

previous_location := LOCATION_WIND_AND_BONE_PASS;