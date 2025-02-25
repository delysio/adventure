Writeln;
Get_Narration(current_location);

if Is_In_Inventory(ITEM_TORCH) = FALSE then begin

    Get_Narration(101);

end else begin

    Get_Narration(102);
    Notify_On_Objects;

end;

Print_Formatted_Text ('You can go [W]est, back to the lakeshore.');

repeat

    key_legal := FALSE;
    key_hit := UpCase(ReadKey);

    case key_hit of

        'W': begin
            current_location := LOCATION_LAKE;
            key_legal := TRUE;
        end;
        'G': begin
            if (Is_In_Inventory(ITEM_TORCH) = TRUE) and (Item_Exists = TRUE) then 
            begin
                success := Add_To_Inventory(current_location);
                key_legal := TRUE;
            end;
        end;

    end;

    Process_Default_Keys(key_hit);

until key_legal = TRUE;

previous_location := LOCATION_ISLAND;