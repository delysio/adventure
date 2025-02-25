Writeln;
Get_Narration(current_location);

if monsters[current_location].hit_points > 0 then begin

    Pre_Fight ('Morana');

end;

if (monsters[current_location].hit_points = 0) then begin

    Get_Narration(281);
    Get_Narration(282);
    
    Notify_On_Objects;
    Print_Formatted_Text ('You can go [N]orth, [S]outh');

end else begin

    Print_Formatted_Text ('You can go [S]outh');

end;

repeat

    key_legal := FALSE;
    key_hit := UpCase(ReadKey);

    case key_hit of
        'N': begin
            if monsters[current_location].hit_points = 0 then begin
                current_location := LOCATION_MOUND;
                key_legal := TRUE;
            end;
        end;
        'S': begin
            current_location := LOCATION_LAKE_NIGHT_DAY;
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

previous_location := LOCATION_MORANA_CIRCLE;