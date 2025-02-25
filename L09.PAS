Writeln;
Get_Narration(current_location);

{current_monster := @monsters[current_location];}

if monsters[current_location].hit_points > 0 then begin

    Pre_Fight ('Drowner');

end;

if monsters[current_location].hit_points = 0 then Notify_On_Objects;

Print_Formatted_Text ('You can go [S]outh, or sail [E]ast ' + 
                     'to the island');

repeat

    key_legal := FALSE;
    key_hit := UpCase(ReadKey);

    case key_hit of
        
        'S': begin
            current_location := LOCATION_START;
            key_legal := TRUE;
        end;
        'E': begin
            current_location := LOCATION_ISLAND;
            key_legal := TRUE;
        end;
        'F': begin
            if monsters[current_location].hit_points > 0 then begin
                Fight;
                key_legal := TRUE;
            end;
        end;
        'G': begin
            if (monsters[current_location].hit_points = 0) and (Item_Exists = TRUE) then begin
                success := Add_To_Inventory(current_location);
                key_legal := TRUE;
            end;
        end;
                    
    end;

    Process_Default_Keys(key_hit);

until key_legal = TRUE;

previous_location := LOCATION_LAKE;