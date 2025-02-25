Writeln;
Get_Narration(current_location);

Notify_On_Objects;

Print_Formatted_Text ('You can go [E]ast, [W]est');

repeat

    key_legal := FALSE;
    key_hit := UpCase(ReadKey);

    case key_hit of
        'W': begin
            current_location := LOCATION_CROSSROADS_OF_THORNS;
            key_legal := TRUE;
        end;
        'E': begin
            current_location := LOCATION_TOMB_OF_THE_GODS;
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

previous_location := LOCATION_CLIFF_OF_FORGETFULNESS;