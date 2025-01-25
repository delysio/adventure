'C', 'c': begin
    Print_Armory_Stats;
end;
'I', 'i': begin
    Print_Inventory;
end;
'P', 'p': begin
    Drink_Potion;
end;
'X', 'x': begin
    current_state := STATE_TITLE;
end;