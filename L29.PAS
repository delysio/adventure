Writeln;
Get_Narration(current_location);

if Is_In_Inventory(ITEM_BONE_TOKEN) then begin

    Get_Narration(current_location);
                          
    Print_Formatted_Text ('You can go [N]orth, [S]outh');
    
end else begin

    Print_Formatted_Text ('You can go [N]orth');

end;

Notify_On_Objects;

repeat

    key_legal := FALSE;
    key_hit := UpCase(ReadKey);

    case key_hit of

        'S': begin
            if Is_In_Inventory(ITEM_BONE_TOKEN) then begin
                Drop_Special_Item(ITEM_BONE_TOKEN);
                current_location := LOCATION_DARK_HARBOUR;
                key_legal := TRUE;
            end;
        end;
        'N': begin
            current_location := LOCATION_WIND_AND_BONE_PASS;
            key_legal := TRUE;
        end;
        'G': begin
            if Item_Exists = TRUE then begin
                success := Add_To_Inventory(current_location);
                key_legal := TRUE;
            end;
        end;

    end;

    Process_Default_Keys(key_hit);

until key_legal = TRUE;

previous_location := LOCATION_WIND_AND_BONE_PASS;