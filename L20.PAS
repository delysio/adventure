Writeln;
Get_Narration(current_location);

Notify_On_Objects;

Print_Formatted_Text ('You can go [N]orth, [S]outh,' +
                      ' [W]est');

repeat

    key_legal := FALSE;
    key_hit := UpCase(ReadKey);

    case key_hit of

        'N': begin
            current_location := LOCATION_BUSHES;
            key_legal := TRUE;
        end;
        'S': begin
            current_location := LOCATION_SPRING;
            key_legal := TRUE;
        end;
        'W': begin
            current_location := LOCATION_FOREST_1;
            key_legal := TRUE;
        end;
        'G': begin
            if Item_Exists = TRUE then begin
                success := Add_To_Inventory(current_location);
                key_legal := TRUE;
            end;
        end;

    end;

until key_legal = TRUE;

Process_Default_Keys(key_hit);
previous_location := LOCATION_STREAM;