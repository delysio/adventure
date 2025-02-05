Writeln;
Print_Formatted_Text ('Dark silhouettes without faces stand silently on the shore, looking out into the infinite ' +
                      'mist hovering over the water. Their figures seem unreal, as if woven from shadow and cold ' +
                      'air, shivering with every gust of icy wind.');
Print_Formatted_Text ('They don''t move, they don''t breathe - they merely wait, silently and impatiently, as ' +
                      'if every moment were an eternity for them.');

if Is_In_Inventory(ITEM_DAZHBOGS_DIAMOND) then begin

    Print_Formatted_Text ('The Dead, seeing the Diamond of the Dadzhbog, paused for a moment, their shapeless ' +
                          'figures seeming to tremble in the pale light of the jewel.');
    Print_Formatted_Text ('(The Dead) The Dazhbog speaks through you. Cross the waters safely, but remember - ' +
                          'not everything that is given up can be recovered.');
    Print_Formatted_Text ('The shadows part and the black boat emerges from the mist, ready to cross the Lake of Souls.');
    Print_Formatted_Text ('You can go [N]orth, [E]ast');

end else begin

    Print_Formatted_Text ('You can go [E]ast');

end;

Notify_On_Objects;


key_hit := UpCase(ReadKey);

case key_hit of
    'N': begin
        if Is_In_Inventory(ITEM_DAZHBOGS_DIAMOND) then begin
            current_location := LOCATION_WIND_AND_BONE_PASS;
        end;
    end;
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