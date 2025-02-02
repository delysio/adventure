Writeln;
Print_Formatted_Text ('You see a lake with a boat next to it. An island is visible to the east.');

{current_monster := @monsters[current_location];}

if monsters[current_location].hit_points > 0 then begin

    Pre_Fight ('Drowner');

end;

if monsters[current_location].hit_points = 0 then Notify_On_Objects;

Print_Formatted_Text ('You can go [S]outh, or sail [E]ast ' + 
                     'to the island');

key_hit := UpCase(ReadKey);

case key_hit of
    
    'S': begin
        current_location := LOCATION_START;
    end;
    'E': begin
        current_location := LOCATION_ISLAND;
    end;
    'F': begin
        Fight;
    end;
    'G': begin
        if (monsters[current_location].hit_points=0) and (Item_Exists(current_location)=TRUE) 
        then 
        begin
            success := Add_To_Inventory(current_location);
        end;
    end;
                
end;

Process_Default_Keys(key_hit);
previous_location := LOCATION_LAKE;