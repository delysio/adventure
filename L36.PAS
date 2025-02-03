Writeln;
Print_Formatted_Text ('An ancient grove where the trees weave into twisted shapes and their roots seem to pulsate ' +
                      'like living veins. The ground here is saturated with a dark red substance reminiscent ' +
                      'of blood, and the air is permeated with the smell of dampness and decay.');
Print_Formatted_Text ('In the silence of the forest, a quiet whispering can be heard - is it the wind among the boughs, ' +
                      'or perhaps the voices of those who died here?');

Notify_On_Objects;

Print_Formatted_Text ('You can go [W]est');

key_hit := UpCase(ReadKey);

case key_hit of

    'W': begin
        current_location := LOCATION_DARK_HARBOUR;
    end;
    'G': begin
        if (Item_Exists = TRUE) then begin
            success := Add_To_Inventory(current_location);
        end;
    end;

end;

Process_Default_Keys(key_hit);
previous_location := LOCATION_BLOODY_ROOTS;