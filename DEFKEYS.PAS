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
            current_state := STATE_TITLE;
            key_legal := TRUE;
        end;
        'H': begin
            Print_Keys;
            key_legal := TRUE;
        end;
    end;

end;