Writeln;
Get_Narration(current_location);

if monsters[current_location].hit_points > 0 then begin

    Pre_Fight ('Striga');

end;

if (monsters[current_location].hit_points = 0) then begin

    Get_Narration(261);
    
    Notify_On_Objects;
    Print_Formatted_Text ('You can go [N]orth or [E]ast');

end else begin

    Print_Formatted_Text ('You can go [N]orth');

end;

repeat

    key_legal := FALSE;
    key_hit := UpCase(ReadKey);

    case key_hit of
        
        'N': begin
            current_location := LOCATION_STREAM;
            key_legal := TRUE;
        end;
        'E': begin
            if (monsters[current_location].hit_points = 0) then begin
                current_location := LOCATION_ROCKS;
                key_legal := TRUE;
            end;
        end;
        'F': begin
            if monsters[current_location].hit_points > 0 then begin
                Fight;
                key_legal := TRUE;
            end;
        end;
        'G': begin
            if (monsters[current_location].hit_points=0) and (Item_Exists=TRUE) 
            then begin
                success := Add_To_Inventory(current_location);
                key_legal := TRUE;
            end;
        end;
        
    end;

    Process_Default_Keys(key_hit);

until key_legal = TRUE;

previous_location := LOCATION_SPRING;