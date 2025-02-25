procedure Print_Items(location_id: byte);
var a: byte;
begin
    a := location_items[location_id, 0];
    Writeln ('0 ' + ITEM_DESCRIPTIONS[a]);
    a := location_items[location_id, 1];
    Writeln ('1 ' + ITEM_DESCRIPTIONS[a]);
    a := location_items[location_id, 2];
    Writeln ('2 ' + ITEM_DESCRIPTIONS[a]);
    a := location_items[location_id, 3];
    Writeln ('3 ' + ITEM_DESCRIPTIONS[a]);
    a := location_items[location_id, 4];
    Writeln ('4 ' + ITEM_DESCRIPTIONS[a]);
    a := location_items[location_id, 5];
    Writeln ('5 ' + ITEM_DESCRIPTIONS[a]);
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