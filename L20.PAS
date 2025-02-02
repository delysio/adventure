Writeln;
Print_Formatted_Text ('A narrow stream meandering between the rocks whispers soothingly. The ' +
                   'water is crystal clear, and you can see the glittering stones at its bottom.');

Notify_On_Objects;

Print_Formatted_Text ('You can go [N]orth, [S]outh,' +
                      ' [W]est');

key_hit := UpCase(ReadKey);

case key_hit of

    'N': begin
        current_location := LOCATION_BUSHES;
    end;
    'S': begin
        current_location := LOCATION_SPRING;
    end;
    'W': begin
        current_location := LOCATION_FOREST_1;
    end;
    'G': begin
        if Item_Exists(current_location) = TRUE then begin
            success := Add_To_Inventory(current_location);
        end;
    end;

end;

Process_Default_Keys(key_hit);
previous_location := LOCATION_STREAM;