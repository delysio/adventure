Writeln;
Print_Formatted_Text ('A mysterious lake of night and day, whose surface is perfectly smooth, ' +
                      'reflecting the sky like a mirror. On one side of the shore, the water is as ' +
                      'dark as night, and on the other, as bright and clear as morning.');
Print_Formatted_Text ('It is said to be the place where the forces of Blackbeard and Whitebeard meet, ' +
                      'and an old, powerful being lurks in the depths, guarding the balance between light and ' +
                      'darkness.');

Notify_On_Objects;

Writeln;
Print_Formatted_Text ('You can go [N]orth, [W]est');                          

key_hit := UpCase(ReadKey);

case key_hit of
    'W': begin
        current_location := LOCATION_THE_LESHY_VALLEY;
    end;
    'N': begin
            current_location := LOCATION_MORANA_CIRCLE;
        end;
    'G': begin
        if Item_Exists = TRUE then begin
            success := Add_To_Inventory(current_location);
        end;
    end;
    
end;

Process_Default_Keys(key_hit);
previous_location := LOCATION_LAKE_NIGHT_DAY;