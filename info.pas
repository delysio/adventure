{ Organises the array with the items, the empty spaces are always placed at the end of the array }
procedure Organise_Item_Array;
var i, j: byte;
begin
    j := 0;

    for i := 0 to MAX_INVENTORY do
    begin
        if inventory_items[i] <> ITEM_NONE then
        begin
            inventory_items[j] := inventory_items[i];
            if j <> i then inventory_items[i] := ITEM_NONE;
            j := j + 1;
        end;
    end;

end;


{ Prints hero stats }
procedure Print_Hero_Stats;
var 
    hit_points: byte;
    defence: byte;
    attack: byte;
begin
    
    hit_points := hero.hit_points;
    defence    := hero.defence + armory.shield + armory.shield_slot + armory.head + armory.gloves + armory.boots;
    attack     := hero.attack + armory.weapon + armory.weapon_slot;
    
    Write ('Hero stats: HP ', hit_points);
    Write (', DEF ', defence);
    Writeln (', ATT ', attack);
    
end;


{ Prints monster stats }
procedure Print_Monster_Stats(monster_id: byte);
begin
    Write ('Monster stats: HP ', monsters[current_location].hit_points);
    Write (', DEF ', monsters[current_location].defence);
    Writeln (', ATT ', monsters[current_location].attack);
end;


{ Prints hero armory stats }
procedure Print_Armory_Stats;
var
    value: byte;
begin
    
    Writeln;
    Writeln ('Your weapons and armory:');

    value := armory.weapon + armory.weapon_slot;
    Write ('WEAPON: +', value); 
    if armory.weapon > 0 then begin Writeln (' ', armory.weapon_name); end else begin Writeln end;   

    Write ('   weapon slot: +', armory.weapon_slot);
    if armory.weapon_slot > 0 then begin Writeln (' ', armory.weapon_slot_name); end else begin Writeln end; 

    value := armory.shield + armory.shield_slot;
    Write ('SHIELD: +', value);
    if armory.shield > 0 then begin Writeln (' ', armory.shield_name); end else begin Writeln end;

    Write ('   shield slot: +', armory.shield_slot);
    if armory.shield_slot > 0 then begin Writeln (' ', armory.shield_slot_name); end else begin Writeln end;

    value := armory.head + armory.body + armory.gloves + armory.boots;
    Writeln ('ARMORY: +', value);

    Write ('   helmet: +', armory.head);
    if armory.head > 0 then begin Writeln (' ', armory.head_name); end else begin Writeln end;

    Write ('   armour: +', armory.body);
    if armory.body > 0 then begin Writeln (' ', armory.body_name); end else begin Writeln end;

    Write ('   gloves: +', armory.gloves);
    if armory.gloves > 0 then begin Writeln (' ', armory.gloves_name); end else begin Writeln end;
    
    Write ('   boots:  +', armory.boots);
    if armory.boots > 0 then begin Writeln (' ', armory.boots_name); end else begin Writeln end;

end;


{ Displays the contents of your inventory and allows you to drop unnecessary items }
procedure Print_Inventory;
var
    items_index, descriptions_index, number_of_items, location_index : byte;
    count : byte;
    key: char;
    can_drop: boolean;
begin

    Writeln;

    count := 1;
    number_of_items := 0;

    { Print inventory contents }

    for items_index := 0 to MAX_INVENTORY do begin

        if inventory_items[items_index] <> ITEM_NONE then begin
            
            descriptions_index := inventory_items[items_index];
            Writeln ('[', count, '] ', ITEM_DESCRIPTIONS[descriptions_index]);
            count := count + 1;
            number_of_items := number_of_items + 1;
        
        end;

    end;

    { If the inventory is not empty, allow items to be dropped off }

    if number_of_items > 0 then begin

        Writeln;
        Writeln ('Press the corresponding number to drop the item or [X] to exit inventory');

        repeat
            key := ReadKey;
        until ((key >= '1') and (key <= Chr(Ord('0') + count - 1))) or (key = 'X') or (key = 'x');

        if (key <> 'x') and (key <> 'X') then begin
        
            items_index := Ord(key) - Ord('0') - 1;
            if inventory_items[items_index] <> ITEM_NONE then begin

                { Check if item can be dropped off }

                can_drop := FALSE;

                for location_index := 0 to MAX_ITEM_NUMBER do begin

                    if location_items[current_location, location_index] = ITEM_NONE then begin

                        descriptions_index := inventory_items[items_index];
                        inventory_items[items_index] := ITEM_NONE;
                        location_items[current_location, location_index] := descriptions_index;
                        Writeln;
                        Writeln ('You have dropped ', ITEM_DESCRIPTIONS[descriptions_index]);

                        can_drop := TRUE;

                        Organise_Item_Array;

                        exit;

                    end;

                end;

                if can_drop = FALSE then Writeln ('You can not drop this item here');
            
            end;

        end;

    end else begin

        Writeln ('Inventory is empty.');

    end;

end;