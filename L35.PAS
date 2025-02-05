Writeln;
Print_Formatted_Text ('Dark silhouettes without faces stand silently on the shore, looking out into the infinite mist ' +
                      'hovering over the water. Their figures seem unreal, as if woven from shadow and cold air, ' +
                      'shivering with every gust of icy wind.');
Print_Formatted_Text ('They don''t move, they don''t breathe - they merely wait, silently and impatiently, as ' +
                      'if every moment were an eternity for them.');

Notify_On_Objects;

Print_Formatted_Text ('You can go [E]ast');

key_hit := UpCase(ReadKey);

case key_hit of

    'E': begin
        current_location := LOCATION_BLOODY_ROOTS;
    end;
    'G': begin
        if Item_Exists = TRUE then begin
            success := Add_To_Inventory(current_location);
        end;
    end;

end;

Process_Default_Keys(key_hit);
previous_location := LOCATION_DARK_HARBOUR;