Writeln;
Get_Narration(current_location);

if monsters[current_location].hit_points > 0 then begin

    Get_Narration(202);

    Pre_Fight ('The Bane');

    Print_Formatted_Text ('You can go [S]outh');

end else begin

    Print_Formatted_Text ('You can go [S]outh, [E]ast');

end;

if monsters[current_location].hit_points = 0 then Notify_On_Objects;

repeat

    key_legal := FALSE;
    key_hit := UpCase(ReadKey);

    case key_hit of
        'S': begin
            current_location := LOCATION_SOUNDLESS_PASS;
            key_legal := TRUE;
        end;
        'E': begin
            if monsters[current_location].hit_points = 0 then begin
                current_location := LOCATION_CROSSROADS_OF_THORNS;
                key_legal := TRUE;
            end;
        end;
        'F': begin
            if monsters[current_location].hit_points > 0 then begin
                Fight;
                key_legal := TRUE;
            end;
        end;
        'G': begin
            if (Item_Exists = TRUE) and (monsters[current_location].hit_points = 0) then begin
                success := Add_To_Inventory(current_location);
                key_legal := TRUE;
            end;
        end;

    end;

    Process_Default_Keys(key_hit);

until key_legal = TRUE;

previous_location := LOCATION_ETERNAL_WHISPER;