Writeln;
Get_Narration(current_location);

Notify_On_Objects;

Writeln;
Print_Formatted_Text ('You can go [N]orth, [W]est');                          

repeat

    key_legal := FALSE;
    key_hit := UpCase(ReadKey);

    case key_hit of
        'W': begin
            current_location := LOCATION_THE_LESHY_VALLEY;
            key_legal := TRUE;
        end;
        'N': begin
                current_location := LOCATION_MORANA_CIRCLE;
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

previous_location := LOCATION_LAKE_NIGHT_DAY;