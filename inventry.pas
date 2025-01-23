{ Adding found equipment to the armour worn and weapons used }
procedure Add_To_Armory(item: Titem);
begin

    case item.kind of
    
         0..9: armory.weapon := item.modifier;
       10..19: armory.shield := item.modifier;
       20..29: armory.weapon_slot := item.modifier;
       30..39: armory.shield_slot := item.modifier;
       40..49: armory.head := item.modifier;
       50..59: armory.body := item.modifier;
       60..69: armory.gloves := item.modifier;
       70..79: armory.boots := item.modifier;
    
    end;

end;


{ Adding items to inventory}
function Add_To_Inventory(location: byte): boolean;
var i, j, item: byte;
begin

    { iteracja po przedmiotach w lokacji }
    for j := 0 to MAX_ITEM_NUMBER do begin

        item := location_items[location, j];

        { sprawdz id przedmiotu }
        if item <> ITEM_NONE then begin

            { znajdz pierwszy wolny slot w ekwipunku }
            for i := 0 to MAX_INVENTORY do begin

                { znaleziono }
                if inventory_items[i] = ITEM_NONE then begin

                    inventory_items[i] := item;
                    location_items[location, j] := ITEM_NONE;
                    Writeln ('You took the ', ITEM_DESCRIPTIONS[item]);
                    Add_To_Inventory := TRUE;
                    exit;

                end;

            end;

        end;

    end;

    Add_To_Inventory := FALSE;
    Writeln ('Inventory is full');
    
end;


{ Checks whether the item is in the inventory }
function Is_In_Inventory(item: byte): boolean;
var i: byte;
begin

    Is_In_Inventory := FALSE;
    for i := 0 to MAX_INVENTORY do begin
        if inventory_items[i] = item then begin
            Is_In_Inventory := TRUE;
            exit;
        end;
    end;

end;


{ Checks whether there are any items in a particular location }
function Item_Exists(location: byte): boolean;
var i: byte;
begin
    Item_Exists := FALSE;
    for i := 0 to MAX_ITEM_NUMBER do begin
        if location_items[current_location, i] <> ITEM_NONE then begin
            Item_Exists := TRUE;
            exit;
        end;
    end;
end;


{ Notifies of visible objects }
procedure Notify_On_Objects;
var i: byte;
begin

    i := Random(3);

    case i of 
        0: Write('You see something lying on the ground.');
        1: Write('There is something shining next to you.');
        2: Write('Something on the ground caught your eye.');
    end;

    Writeln (' Press [G] to pick up.');     

end;