Writeln;
Print_Formatted_Text ('Ahead of you is a thicket of bushes. The surrounding marshes are full of ' +
                   'mist and treacherous paths. You can hear the quiet chirps of the russets ' +
                   'as they try to lure you into the refuse.');

if Is_In_Inventory(ITEM_MACHETE) = FALSE then begin

    Print_Formatted_Text ('There seems to be no passage here. ' +
                       'The bushes are so dense that you can''t go any further...');
    Print_Formatted_Text ('You can go [E]est');

end else begin

    Print_Formatted_Text ('Using a machete you pave your way through the dense bushes. ' +
                       'The plants grow back quickly, but you manage to get through.');

    Notify_On_Objects;

    Print_Formatted_Text ('You can go [S]outh or [E]ast');

end;

key_hit := UpCase(ReadKey);

case key_hit of
    
    'E': begin
        current_location := LOCATION_START;
    end;
    'S': begin
        if Is_In_Inventory(ITEM_MACHETE) then begin
            current_location := LOCATION_STREAM;
        end;
    end;
    'G': begin
        if Item_Exists(current_location) = TRUE then begin
            success := Add_To_Inventory(current_location);
        end;
    end;

end;

Process_Default_Keys(key_hit);
previous_location := LOCATION_BUSHES;