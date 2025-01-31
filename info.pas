{ Organises the array with the items, the empty spaces are always placed at the end of the array }
procedure Organise_Item_Array;
var inventory_index, secondary_index: byte;
begin
    secondary_index := 0;

    for inventory_index := 0 to MAX_INVENTORY do
    begin
        if inventory_items[inventory_index] <> ITEM_NONE then
        begin
            inventory_items[secondary_index] := inventory_items[inventory_index];
            if secondary_index <> inventory_index then inventory_items[inventory_index] := ITEM_NONE;
            secondary_index := secondary_index + 1;
        end;
    end;

end;


{ Procedure triggered when you hand over items to the Witch }
procedure Drop_Special_Item(item: byte);
var index: byte;
begin
    for index := 0 to MAX_INVENTORY do begin
        if inventory_items[index] = item then begin
            inventory_items[index] := ITEM_NONE; 
            Organise_Item_Array;
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
    defence := hero.defence + armory.shield + armory.shield_slot + armory.head + armory.body + armory.gloves + armory.boots;
    attack := hero.attack + armory.weapon + armory.weapon_slot;
    
    Write ('Hero stats: HP ', hit_points);
    Write (', DEF ', defence);
    Write (', ATT ', attack);
    Writeln (', DEX ', hero.dexterity);
    
end;


{ Prints monster stats }
procedure Print_Monster_Stats(monster_id: byte);
begin
    Write ('Monster stats: HP ', monsters[current_location].hit_points);
    Write (', DEF ', monsters[current_location].defence);
    Writeln (', ATT ', monsters[current_location].attack);
end;


{ Prints hero armory stats }
procedure Print_Player_Stats;
var
    value: byte;
begin
    
    Writeln;
    Print_Hero_Stats;
    Writeln;
    Writeln ('Your weapons and armory:');

    value := armory.weapon + armory.weapon_slot;
    Write ('SWORD: +', value); 
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


{ Items dropping, param: global item index }
procedure Drop_Item(item: byte);
var 
    location_index: byte;
    inventory_index: byte;
begin

    { Items with index >= 20 are weapons or armory }
    if item >= 20 then begin

        case item of

            20..29: begin 
                        armory.weapon := INITIAL_ARMORY; 
                        armory.weapon_name := INITIAL_DESCRIPTION; 
                    end;
            30..39: begin 
                        armory.shield := INITIAL_ARMORY; 
                        armory.shield_name := INITIAL_DESCRIPTION; 
                    end;
            40..49: begin 
                        armory.weapon_slot := INITIAL_ARMORY; 
                        armory.weapon_slot_name := INITIAL_DESCRIPTION; 
                    end;
            50..59: begin 
                        armory.shield_slot := INITIAL_ARMORY; 
                        armory.shield_slot_name := INITIAL_DESCRIPTION; 
                    end;
            60..69: begin 
                        armory.head := INITIAL_ARMORY; 
                        armory.head_name := INITIAL_DESCRIPTION; 
                    end;
            70..79: begin 
                        armory.body := INITIAL_ARMORY; 
                        armory.body_name := INITIAL_DESCRIPTION; 
                    end;
            80..89: begin 
                        armory.gloves := INITIAL_ARMORY; 
                        armory.gloves_name := INITIAL_DESCRIPTION; 
                    end;
            90..99: begin 
                        armory.boots := INITIAL_ARMORY; 
                        armory.boots_name := INITIAL_DESCRIPTION; 
                    end;
            
        end;

        { wstaw na mapę}
        for location_index := 0 to MAX_ITEMS_IN_LOCATION do begin

            if location_items[current_location, location_index] = ITEM_NONE then begin

                location_items[current_location, location_index] := item;

            end;
        
        end;

        Writeln;
        Writeln ('You have dropped ', ITEM_DESCRIPTIONS[item]);

    end else begin

        for location_index := 0 to MAX_ITEMS_IN_LOCATION do begin

            if location_items[current_location, location_index] = ITEM_NONE then begin

                for inventory_index := 0 to MAX_INVENTORY do begin

                    if inventory_items[inventory_index] = item then begin

                        { wyczyść w ekwipunku }
                        inventory_items[inventory_index] := ITEM_NONE;
                        { wstaw na mapę}
                        location_items[current_location, location_index] := item;
                        Writeln;
                        Writeln ('You have dropped ', ITEM_DESCRIPTIONS[item]);

                        Organise_Item_Array;
                        exit;

                    end;

                end;

            end;

        end;

    end;
    
end;


{ Displays the contents of your inventory and allows you to drop unnecessary items }
procedure Print_Inventory;
var
    items_index, descriptions_index, number_of_items, global_index: byte;
    count : byte;
    key: char;
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
        
            { indeks przedmiotu w ekwipunku}
            items_index := Ord(key) - Ord('0') - 1;
            { indeks przedmiotu globalny}
            global_index := inventory_items[items_index];
            Drop_Item(global_index);

        end;

    end else begin

        Writeln ('Inventory is empty.');

    end;

end;


{ Displays information about the encountered monster }
procedure Pre_Fight(mname: monster_name);
begin

    Writeln;
    Writeln (mname, ' appeared!');

    Print_Monster_Stats(current_location);
    Writeln;
    Writeln ('Press [F] to fight');
    Writeln;

end;