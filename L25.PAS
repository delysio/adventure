Writeln;
Print_Formatted_Text ('The forest seems to stretch across the country, if it wasn''t for the good ' + 
                      'weather, the nutritious fruits of the forest, it would be difficult to get through.');

Notify_On_Objects;

Print_Formatted_Text ('You can go [N]orth, [S]outh');

key_hit := UpCase(ReadKey);

case key_hit of
    'S': begin
        current_location := LOCATION_FOREST_3;
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
previous_location := LOCATION_FOREST_2;