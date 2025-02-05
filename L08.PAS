Writeln;
Print_Formatted_Text ('The world around you quiets unnaturally, as if sound never existed here. The air is still, ' +
                      'heavy as dried ash, and the ground beneath your feet resembles a cracked shell, dead and ' +
                      'lifeless.');
Print_Formatted_Text ('Pale, luminous silhouettes loom in the distance, their movements slow, almost drowsy, but ' +
                      'when you look at them, you feel that something invisible is watching you too.');

Notify_On_Objects;

Print_Formatted_Text ('You can go [W]est, [N]orth');

key_hit := UpCase(ReadKey);

case key_hit of
    'W': begin
        current_location := LOCATION_STONE_THRESHOLD;
    end;
    'N': begin
        current_location := LOCATION_FOREST_1;
    end;
    'G': begin
        if Item_Exists = TRUE then begin
            success := Add_To_Inventory(current_location);
        end;
    end;

end;

Process_Default_Keys(key_hit);
previous_location := LOCATION_SOUNDLESS_PASS;