Writeln;
Print_Formatted_Text ('A narrow, rocky path leads through high mountains where the wind howls like ' +
                      'a man possessed and the ground is strewn with the bones of those who did not ' +
                      'survive the journey. It is said to be the place where the elements meet, and ' +
                      'every step could be the last. ');

Notify_On_Objects;

Print_Formatted_Text ('You can go [W]est, [S]outh');

key_hit := UpCase(ReadKey);

case key_hit of
    'S': begin
        current_location := LOCATION_LAKE_OF_SOULS;
    end;
    'W': begin
        current_location := LOCATION_MOUND;
    end;
    'G': begin
        if Item_Exists(current_location) = TRUE then begin
            success := Add_To_Inventory(current_location);
        end;
    end;

end;

Process_Default_Keys(key_hit);
previous_location := LOCATION_WIND_AND_BONE_PASS;