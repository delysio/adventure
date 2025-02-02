Writeln;
Print_Formatted_Text ('The dark forest surrounds you on almost all sides. You hear wolves howling and leaves rustling.');

if monsters[current_location].hit_points > 0 then begin

    Pre_Fight ('Bies');

end;

if (monsters[current_location].hit_points = 0) then begin

    Notify_On_Objects;

end;

Print_Formatted_Text ('You can go [E]ast, [N]orth,' + 
                      ' [S]outh');

key_hit := UpCase(ReadKey);

case key_hit of
    
    'N': begin
        current_location := LOCATION_GOLDEN_FIELD;
    end;
    'E': begin
        current_location := LOCATION_STREAM;
    end;
    'S': begin
        current_location := LOCATION_FOREST_2;
    end;
    'F': begin
        Fight;
    end;
    'G': begin
        if (monsters[current_location].hit_points=0) and (Item_Exists(current_location)=TRUE) 
        then begin
            success := Add_To_Inventory(current_location);
        end;
    end;

end;

Process_Default_Keys(key_hit);
previous_location := LOCATION_FOREST_1;