Writeln;
Print_Formatted_Text ('A green valley where the trees move as if they were alive. A dense forest ' +
                      'surrounds you on all sides, and the trees seem to live a life of their own. ' +
                      'Their tangled branches form an impenetrable, magical barrier, whispering in ' +
                      'an unknown language.');
Print_Formatted_Text ('The air is heavy with moisture and the smell of moss, '+
                      'and the ominous hiss of wolves can be heard in the distance.');

if Is_In_Inventory(ITEM_BONDCUTTER) then begin

    Print_Formatted_Text ('All it took was a few cuts with the magic saw to open the way for further travel');
    Writeln;
    Print_Formatted_Text ('You can go [E]ast, [W]est');

end else begin

    Print_Formatted_Text ('It takes a magical act to move on.');
    Writeln;
    Print_Formatted_Text ('You can go [E]ast');

end;


key_hit := UpCase(ReadKey);

case key_hit of
    'W': begin
        if Is_In_Inventory(ITEM_BONDCUTTER) then begin
            current_location := LOCATION_SVAROGS_STONE_CIRCLE;
        end;
    end;
    'E': begin
            current_location := LOCATION_LAKE_NIGHT_DAY;
        end;
    'G': begin
        if Item_Exists = TRUE then begin
            success := Add_To_Inventory(current_location);
        end;
    end;
    
end;

Process_Default_Keys(key_hit);
previous_location := LOCATION_THE_LESHY_VALLEY;