{ Adding items to inventory}
function Add_To_Inventory(location: byte): boolean;
var i, j, item: byte;
    success: boolean;
begin

    Writeln;

    { iterating on objects in a location }
    for j := 0 to MAX_ITEMS_IN_LOCATION do begin

        item := location_items[location, j];

        { check item id }
        if item <> ITEM_NONE then begin

            { if id >= 20, it is a weapon or armour }
            if item >= 20 then begin

                success := TRUE;

                { najpierw wyrzuć, jeśli coś tej samej klasy jest niesione }

                if (weapons[item].kind = 0) and (armory.weapon > 0) then Drop_Item(armory.weapon_id);
                if (weapons[item].kind = 1) and (armory.shield > 0) then Drop_Item(armory.shield_id);
                if (weapons[item].kind = 2) and (armory.weapon_slot > 0) then Drop_Item(armory.weapon_slot_id);
                if (weapons[item].kind = 3) and (armory.shield_slot > 0) then Drop_Item(armory.shield_slot_id);
                if (weapons[item].kind = 4) and (armory.head > 0) then Drop_Item(armory.head_id);
                if (weapons[item].kind = 5) and (armory.body > 0) then Drop_Item(armory.body_id);
                if (weapons[item].kind = 7) and (armory.boots > 0) then Drop_Item(armory.boots_id);

                case item of

                    20..29: begin 
                                armory.weapon_id := item;
                                armory.weapon := weapons[item].modifier; 
                                armory.weapon_name := ITEM_DESCRIPTIONS[item]; 
                            end;
                    30..39: begin 
                                armory.shield_id := item;
                                armory.shield := weapons[item].modifier; 
                                armory.shield_name := ITEM_DESCRIPTIONS[item]; 
                            end;
                    40..49: begin 
                                if armory.weapon > 0 then begin
                                    armory.weapon_slot_id := item;
                                    armory.weapon_slot := weapons[item].modifier; 
                                    armory.weapon_slot_name := ITEM_DESCRIPTIONS[item]; 
                                end else begin
                                  Print_Formatted_Text ('You can''t take the magic stone because you don''t have ' +
                                                        'a weapon to put it on.');
                                success := FALSE;
                                end;
                            end;
                    50..59: begin 
                                if armory.shield > 0 then begin
                                    armory.shield_slot_id := item;
                                    armory.shield_slot := weapons[item].modifier; 
                                    armory.shield_slot_name := ITEM_DESCRIPTIONS[item]; 
                                end else begin
                                  Print_Formatted_Text ('You can''t take the magic stone because you don''t have a ' + 
                                                        'shield to put it on.');
                                success := FALSE;
                                end;
                            end;
                    60..69: begin 
                                armory.head_id := item;
                                armory.head := weapons[item].modifier; 
                                armory.head_name := ITEM_DESCRIPTIONS[item]; 
                            end;
                    70..79: begin 
                                armory.body_id := item;
                                armory.body := weapons[item].modifier; 
                                armory.body_name := ITEM_DESCRIPTIONS[item]; 
                            end;
                    90..99: begin 
                                armory.boots_id := item;
                                armory.boots := weapons[item].modifier; 
                                armory.boots_name := ITEM_DESCRIPTIONS[item]; 
                            end;
                    
                end;

                if success = true then begin

                    location_items[location, j] := ITEM_NONE;
                    Print_Formatted_Text ('You equipped the ' + ITEM_DESCRIPTIONS[item]);
                    Add_To_Inventory := TRUE;

                end;

                exit;

            { and if not, it is an action item }
            end else begin

                { find the first free slot in inventory }
                for i := 0 to MAX_INVENTORY do begin

                    { found }
                    if inventory_items[i] = ITEM_NONE then begin

                        inventory_items[i] := item;
                        location_items[location, j] := ITEM_NONE;

                        Print_Formatted_Text ('You took the ' + ITEM_DESCRIPTIONS[item]);
                        Add_To_Inventory := TRUE;
                        exit;

                    end;

                end;

            end;

        end;

    end;

    Add_To_Inventory := FALSE;
    Print_Formatted_Text ('Inventory is full');
    
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
function Item_Exists: boolean;
var i: byte;
begin
    Item_Exists := FALSE;
    for i := 0 to MAX_ITEMS_IN_LOCATION do begin
        if location_items[current_location, i] <> ITEM_NONE then begin
            Item_Exists := TRUE;
            exit;
        end;
    end;
end;


{ Uses potion }
procedure Drink_Potion;
var 
    inventory_counter: byte;
    potion_found: boolean;
begin
  Writeln;

  if Is_In_Inventory(ITEM_POTION) = TRUE then begin

    hero.hit_points := hero.hit_points + ITEM_POTION_VALUE;
    inventory_counter := 0;
    potion_found := FALSE;

    repeat

      if inventory_items[inventory_counter] = ITEM_POTION then begin
        inventory_items[inventory_counter] := ITEM_NONE;
        Print_Formatted_Text ('You feel a sudden wave of strength');              
        Organise_Item_Array;
        potion_found := TRUE;
      end;

      inventory_counter := inventory_counter + 1;

    until (inventory_counter = MAX_INVENTORY + 1) or (potion_found = TRUE);
      
  end else begin
      Print_Formatted_Text ('You don''t have a strength potion in your inventory.');
  end;
end;


{ Notifies of visible objects }
procedure Notify_On_Objects;
var i: byte;
const press_string = ' Press [G] to pick up.';
begin

  if Item_Exists = TRUE then begin

    i := Random(3);

    case i of 
      0: Print_Formatted_Text ('You see something lying on the ground.' + press_string);
      1: Print_Formatted_Text ('There is something shining next to you.' + press_string);
      2: Print_Formatted_Text ('Something on the ground caught your eye.' + press_string);
    end;

  end;
end;