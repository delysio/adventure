Writeln;
Print_Formatted_Text ('The cave is dark, you can barely see what is going on inside.');

if Is_In_Inventory(ITEM_TORCH) then begin

    Print_Formatted_Text ('You light a torch and admire the engravings on the rocks of people paying homage to Perun.');

    Notify_On_Objects;

end;

Writeln ('You can go [S]outh');

key_hit := UpCase(ReadKey);

case key_hit of
    
    'S': begin
        current_location := LOCATION_ROCKS;
    end;
    'G': begin
        if Item_Exists(current_location) = TRUE then begin
            success := Add_To_Inventory(current_location);
        end;
    end;

end;

Process_Default_Keys(key_hit);
previous_location := LOCATION_CAVE;