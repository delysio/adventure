Writeln;
Print_Formatted_Text ('Narrow stone corridors lead to a subterranean chamber where the air is heavy with the smell of ' + 
                      'mustiness and ancient sacrifices.');
Print_Formatted_Text ('The walls are covered with frescoes depicting battles and rituals, and in ' +
                      'the centre of the room stands a stone sarcophagus, surrounded by flickering flames.');

if monsters[current_location].hit_points > 0 then begin

    Pre_Fight ('Night Preacher');

end;

if (monsters[current_location].hit_points = 0) then begin

    Print_Formatted_Text ('As the Night Preacher crumbles into dust and his last scream dies away, the chamber fills ' +
                          'with glee. On the walls, frescoes begin to flicker, revealing the history of those who ' +
                          'rest here.');
    Notify_On_Objects;

end;

Print_Formatted_Text ('You can go [S]outh');

key_hit := UpCase(ReadKey);

case key_hit of

    'S': begin
        current_location := LOCATION_MOUND;
    end;
    'F': begin
        Fight;
    end;
    'G': begin
        if (Item_Exists(current_location) = TRUE) and (monsters[current_location].hit_points = 0) then begin
            success := Add_To_Inventory(current_location);
        end;
    end;
    
end;

Process_Default_Keys(key_hit);
previous_location := LOCATION_MORANA_CIRCLE;