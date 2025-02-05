Writeln;
Print_Formatted_Text ('A calm, almost motionless lake whose waters are a deep emerald hue. ' +
                      'Mists float on the surface and flickering lights can be seen in the ' +
                      'depths, as if the souls of the dead are dancing underwater.');
Print_Formatted_Text ('An old boat stands on the shore, and offerings of flowers and candles lie ' +
                      'around it. Legends say you can only cross with the help of the dead, ' +
                      'but they don''t trust everyone.');

if Is_In_Inventory(ITEM_BONE_TOKEN) then begin

    Print_Formatted_Text ('(The Dead) We know the sign of the bones... We offer a crossing, but ' +
                          'we do not promise that a return will be possible.');
                          
    Print_Formatted_Text ('You can go [N]orth, [S]outh');
    
end;

Notify_On_Objects;

key_hit := UpCase(ReadKey);

case key_hit of

    'S': begin
        if Is_In_Inventory(ITEM_BONE_TOKEN) then begin
            Drop_Special_Item(ITEM_BONE_TOKEN);
            current_location := LOCATION_DARK_HARBOUR;
        end;
    end;
    'N': begin
        
    end;
    'G': begin
        if Item_Exists = TRUE then begin
            success := Add_To_Inventory(current_location);
        end;
    end;

end;

Process_Default_Keys(key_hit);
previous_location := LOCATION_WIND_AND_BONE_PASS;