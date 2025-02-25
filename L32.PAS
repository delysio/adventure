Writeln;
Get_Narration(current_location);

if monsters[current_location].hit_points > 0 then begin

    Pre_Fight ('Leshy');

end;

if (monsters[current_location].hit_points = 0) then begin

    Get_Narration(321);
    
    Notify_On_Objects;
    Print_Formatted_Text ('You can go [E]ast or [W]est');

end else begin

    Print_Formatted_Text ('You can go [E]ast');

end;

repeat

    key_legal := FALSE;
    key_hit := UpCase(ReadKey);

    case key_hit of
        'E': begin
            current_location := LOCATION_THE_LESHY_VALLEY;
            key_legal := TRUE;
        end;
        'W': begin
            current_location := LOCATION_FOREST_3;
            key_legal := TRUE;
        end;
        'F': begin
            if monsters[current_location].hit_points > 0 then begin
                Fight;
                key_legal := TRUE;
            end;
        end;
        'G': begin
            if (Item_Exists = TRUE) and (monsters[current_location].hit_points = 0) then begin
                success := Add_To_Inventory(current_location);
                key_legal := TRUE;
            end;
        end;
        
    end;

    Process_Default_Keys(key_hit);

until key_legal = TRUE;

previous_location := LOCATION_SVAROGS_STONE_CIRCLE;