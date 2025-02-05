Writeln;
Print_Formatted_Text ('It is a place of worship, where the stone blocks arranged in a circle radiate ' +
                      'warmth and sparks of divine fire float above them at night.');

if monsters[current_location].hit_points > 0 then begin

    Pre_Fight ('Leshy');

end;

if (monsters[current_location].hit_points = 0) then begin

    Print_Formatted_Text ('The Leshy''s corpse sprawled across the stone circles revealing a passage ' +
                          'into the valley revealed a passage between them.');
    Notify_On_Objects;
    Print_Formatted_Text ('You can go [E]ast or [W]est');

end else begin

    Print_Formatted_Text ('You can go [E]ast');

end;

key_hit := UpCase(ReadKey);

case key_hit of
    'E': begin
        current_location := LOCATION_THE_LESHY_VALLEY;
    end;
    'W': begin
        current_location := LOCATION_FOREST_3;
    end;
    'F': begin
        Fight;
    end;
    'G': begin
        if (Item_Exists = TRUE) and (monsters[current_location].hit_points = 0) then begin
            success := Add_To_Inventory(current_location);
        end;
    end;
    
end;

Process_Default_Keys(key_hit);
previous_location := LOCATION_SVAROGS_STONE_CIRCLE;