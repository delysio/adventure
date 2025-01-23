{ Organises the array with the items, the empty spaces are always placed at the end of the array }
procedure Organise_Item_Array;
var i, j: byte;
begin
    j := 0;

    for i := 0 to MAX_ITEMS do
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
    Writeln ('WEAPON: +', value);
    Writeln ('   weapon slot: +', armory.weapon_slot);
    value := armory.shield + armory.shield_slot;
    Writeln ('SHIELD: +', value);
    Writeln ('   shield slot: +', armory.shield_slot);
    value := armory.head + armory.body + armory.gloves + armory.boots;
    Writeln ('ARMORY: +', value);
    Writeln ('   helmet: +', armory.head);
    Writeln ('   armour: +', armory.body);
    Writeln ('   gloves: +', armory.gloves);
    Writeln ('   boots:  +', armory.boots);

end;


{ Displays the contents of your inventory and allows you to drop unnecessary items }
procedure Print_Inventory;
var
    i, j, k, m : byte;
    count : byte;
    key: char;
    can_drop: boolean;
begin

    Writeln;

    count := 1;
    k := 0;

    { Print inventory contents }

    for i := 0 to MAX_INVENTORY do begin

        if inventory_items[i] <> ITEM_NONE then begin
            
            j := inventory_items[i];
            Writeln ('[', count, '] ', ITEM_DESCRIPTIONS[j]);
            count := count + 1;
            k := k + 1;
        
        end;

    end;

    Writeln;

    { If the inventory is not empty, allow items to be dropped off }

    if k > 0 then begin

        Writeln ('Press the corresponding number to drop the item or [X] to exit inventory');

        repeat
            key := ReadKey;
        until ((key >= '1') and (key <= Chr(Ord('0') + count - 1))) or (key = 'X') or (key = 'x');

        if (key <> 'x') and (key <> 'X') then begin
        
            i := Ord(key) - Ord('0') - 1;
            if inventory_items[i] <> ITEM_NONE then begin

                { Check if item can be dropped off }

                can_drop := FALSE;

                for m := 0 to MAX_ITEM_NUMBER do begin

                    if location_items[current_location, m] = ITEM_NONE then begin

                        j := inventory_items[i];
                        inventory_items[i] := ITEM_NONE;
                        location_items[current_location, m] := j;
                        Writeln ('You have dropped ', ITEM_DESCRIPTIONS[j]);

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