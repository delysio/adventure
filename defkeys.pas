procedure Print_Items(location_id: byte);
var item_index: byte;
    item_count: byte;
    item_id   : byte;
begin

    item_count := 0;

    Writeln;
    Print_Formatted_Text ('You look around.');
    Writeln;

    for item_index := 0 to MAX_ITEMS_IN_LOCATION - 1 do begin

        if location_items[location_id, item_index] <> ITEM_NONE then begin

            item_id := location_items[location_id, item_index];

            Print_Formatted_Text(' - ' + ITEM_DESCRIPTIONS[item_id]);
            item_count := item_count + 1;

        end;
    end;

    if item_count = 0 then begin

        Print_Formatted_Text ('There is nothing interesting here.');

    end;

end;


procedure Process_Default_Keys(key: char);
begin

    case key of
        'C': begin
            Print_Player_Stats;
            key_legal := TRUE;
        end;
        'I': begin
            Print_Inventory;
            key_legal := TRUE;
        end;
        'P': begin
            Drink_Potion;
            key_legal := TRUE;
        end;
        'X': begin
            Writeln;
            Print_Formatted_Text ('Are you sure? Press [Y]es or [N]o.');

            repeat

                key_legal := FALSE;
                key_hit := UpCase(ReadKey);

                case key_hit of
                    
                    'Y': begin

                        current_state := STATE_TITLE;
                        key_legal := TRUE;
                    end;
                    'N': begin
                        key_legal := TRUE;
                    end;

                end;

            until key_legal = TRUE;

        end;
        'H': begin
            Print_Keys;
            key_legal := TRUE;
        end;
        'L': begin
            Print_Items(current_location);
            key_legal := TRUE;
        end;
    end;

end;


Procedure Wait_For_key;
begin

    Writeln;
    Print_Formatted_Text('Press any key to continue.');

    while KeyPressed do key_hit := ReadKey;
    key_hit := ReadKey; 

end;