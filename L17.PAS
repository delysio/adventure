Writeln;
Print_Formatted_Text ('A vast, misty valley where the air vibrates with the whispers of long-forgotten voices. Ruins ' +
                      'buried in the ground seem to pulsate with ancient power, and shadows of the past flit between ' +
                      'crumbling stone pillars. Every step echoes, as if the place remembers every word and deed of ' +
                      'those who were once here... and never left. ');

Notify_On_Objects;

Print_Formatted_Text ('You can go [W]est');

key_hit := UpCase(ReadKey);

case key_hit of

    'W': begin
        current_location := LOCATION_MOUND_INSIDE;
    end;
    'G': begin
        if Item_Exists = TRUE then begin
            success := Add_To_Inventory(current_location);
        end;
    end;

end;

Process_Default_Keys(key_hit);
previous_location := LOCATION_ECHOES_OF_THE_ANCIENTS;