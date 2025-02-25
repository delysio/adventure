Writeln;
Get_Narration(current_location);

Notify_On_Objects;
Print_Formatted_Text ('You can go [W]est, [N]orth, [S]outh');

repeat

    key_legal := FALSE;
    key_hit := UpCase(ReadKey);

    case key_hit of

        'W': begin
            current_location := LOCATION_INFINITE_STAIRCASE;
            key_legal := TRUE;
        end;
        'N': begin
            current_location := LOCATION_FOREST_OF_WHISPERS;
            key_legal := TRUE;
        end;
        'S': begin
            current_location := LOCATION_FORGOTTEN_BASIN;
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

previous_location := LOCATION_CROSSROADS_OF_SHADOWS;