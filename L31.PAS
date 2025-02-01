Writeln;
Print_Formatted_Text ('As you traverse one scrubland after another, you realise that this is a dense, ' +
                   'ancient forest where trees whisper prayers to the gods and the souls of dead ' +
                   'warriors hide in the roots.');

Notify_On_Objects;

Print_Formatted_Text ('You can go [N]orth, [E]ast');

key_hit := UpCase(ReadKey);

case key_hit of
    'E': begin
        current_location := LOCATION_SVAROGS_STONE_CIRCLE;
    end;
    'N': begin
        current_location := LOCATION_FOREST_2;
    end;
    'G': begin
        if Item_Exists(current_location) = TRUE then begin
            success := Add_To_Inventory(current_location);
        end;
    end;
    
end;

Process_Default_Keys(key_hit);
previous_location := LOCATION_FOREST_3;