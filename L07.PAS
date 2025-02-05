Writeln;
Print_Formatted_Text ('A narrow path leads to a stone threshold, beyond which stretches a dense, damp ' + 
                   'forest. The stones are covered in moss and runes that glimmer in the moonlight, ' +
                   'and the air is heavy with the scent of earth and flowering herbs.');
Print_Formatted_Text ('It is said to be the place where Jarylo, the god of spring and youth, crosses ' +
                   'the boundary between the world of the living and the spirit world.');

Notify_On_Objects;

if target_items_number = 3 then begin

    Print_Formatted_Text ('You can go [N]orth, [S]outh, [E]ast');

end else begin

    Print_Formatted_Text ('You can go [N]orth, [S]outh');

end;

key_hit := UpCase(ReadKey);

case key_hit of

    'E': begin
        if target_items_number = 3 then begin
            current_location := LOCATION_SOUNDLESS_PASS;
        end;
    end;
    'N': begin
        current_location := LOCATION_SACRED_GROVE;
    end;
    'S': begin
        current_location := LOCATION_GOLDEN_FIELD;
    end;
    'G': begin
        if Item_Exists = TRUE then begin
            success := Add_To_Inventory(current_location);
        end;
    end;
                
end;

Process_Default_Keys(key_hit);
previous_location := LOCATION_STONE_THRESHOLD;