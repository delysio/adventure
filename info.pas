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

{ Organises the array with the items in location, the empty spaces are always placed at the end of the array }
procedure Organise_Location_Array(location_id: byte);
var location_item_index, item_to_shift: byte;
begin

    for location_item_index := 1 to MAX_ITEMS_IN_LOCATION do
    begin
        item_to_shift := location_items[location_id, location_item_index];
        location_items[location_id, location_item_index - 1] := item_to_shift;
        location_items[location_id, location_item_index] := ITEM_NONE;
    end;

end;


{ Procedure triggered when you hand over items to the Witch or NPC }
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
    s_hit_points: string[3];
    s_defence: string[3];
    s_attack: string[3];
    s_dexterity: string[3];
begin
    
    hit_points := hero.hit_points;
    defence := hero.defence + armory.shield + armory.shield_slot + armory.head + armory.body + armory.boots;
    attack := hero.attack + armory.weapon + armory.weapon_slot;

    Str(hit_points, s_hit_points);
    Str(defence, s_defence);
    Str(attack, s_attack);
    Str(hero.dexterity, s_dexterity);
   
    Print_Formatted_Text ('Hero stats: HP ' + s_hit_points + ', DEF ' + s_defence + ', ATT ' + 
                          s_attack + ', DEX ' + s_dexterity);
    
end;


{ Prints monster stats }
procedure Print_Monster_Stats(monster_id: byte);
var s_hit_points, s_defence, s_attack: string[3];
begin
    Str(monsters[current_location].hit_points, s_hit_points);
    Str(monsters[current_location].defence, s_defence);
    Str(monsters[current_location].attack, s_attack);

    Print_Formatted_Text ('Monster stats: HP ' + s_hit_points + ', DEF ' + s_defence + ', ATT ' + s_attack);
end;


{ Prints hero armory stats }
procedure Print_Player_Stats;
var
    value: byte;
    s_value: string[3];
    tmp_string: string[80];
begin
    
    Writeln;
    Print_Hero_Stats;
    Writeln;
    Print_Formatted_Text ('Your weapons and armour:');

    value := armory.weapon + armory.weapon_slot;
    Str(value, s_value);
    tmp_string := Concat('SWORD: +', s_value);

    if armory.weapon > 0 then begin tmp_string := Concat(tmp_string, ' ', armory.weapon_name); end; 
    Print_Formatted_Text (tmp_string);

    Write ('     weapon slot: +', armory.weapon_slot);
    if armory.weapon_slot > 0 then begin Writeln (' ', armory.weapon_slot_name); end else begin Writeln end; 

    value := armory.shield + armory.shield_slot;
    Str(value, s_value);
    tmp_string := Concat('SHIELD: +', s_value);

    if armory.shield > 0 then begin tmp_string := Concat(tmp_string, ' ', armory.shield_name); end;
    Print_Formatted_Text (tmp_string);

    Write ('     shield slot: +', armory.shield_slot);
    if armory.shield_slot > 0 then begin Writeln (' ', armory.shield_slot_name); end else begin Writeln end;

    value := armory.head + armory.body + armory.boots;
    Str(value, s_value);
    Print_Formatted_Text ('ARMOUR: +' + s_value);

    Write ('     helmet: +', armory.head);
    if armory.head > 0 then begin Writeln (' ', armory.head_name); end else begin Writeln end;

    Write ('     armour: +', armory.body);
    if armory.body > 0 then begin Writeln (' ', armory.body_name); end else begin Writeln end;
    
    Write ('     boots:  +', armory.boots);
    if armory.boots > 0 then begin Writeln (' ', armory.boots_name); end else begin Writeln end;

    Writeln;
    Print_Formatted_Text('Press any key to continue.');

    while KeyPressed do key_hit := ReadKey;
    key_hit := ReadKey; 

end;


{ Items dropping, param: global item index }
procedure Drop_Item(item: byte);
var 
    location_index: byte;
    inventory_index: byte;
    succ: boolean;
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
            90..99: begin 
                        armory.boots := INITIAL_ARMORY; 
                        armory.boots_name := INITIAL_DESCRIPTION; 
                    end;
            
        end;

        { wstaw na mapę}

        location_index := 0;
        succ := FALSE;

        repeat

            if location_items[current_location, location_index] = ITEM_NONE then begin

                location_items[current_location, location_index] := item;
                succ := TRUE;

            end;

            location_index := location_index + 1;

        until succ = TRUE;

        Writeln;
        Print_Formatted_Text ('You have dropped ' + ITEM_DESCRIPTIONS[item]);

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
                        Print_Formatted_Text ('You have dropped ' + ITEM_DESCRIPTIONS[item]);

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
    tmp_string: string[2];
begin

    Writeln;

    count := 1;
    number_of_items := 0;

    { Print inventory contents }

    for items_index := 0 to MAX_INVENTORY do begin

        Str(count, tmp_string);

        if inventory_items[items_index] <> ITEM_NONE then begin
            
            descriptions_index := inventory_items[items_index];
            Print_Formatted_Text ('[' + tmp_string + '] ' + ITEM_DESCRIPTIONS[descriptions_index]);
            count := count + 1;
            number_of_items := number_of_items + 1;
        
        end;

    end;

    { If the inventory is not empty, allow items to be dropped off }

    if number_of_items > 0 then begin

        Writeln;
        Print_Formatted_Text ('Press key to drop the item or [X] to exit inventory');

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

        Print_Formatted_Text ('Inventory is empty.');

    end;

end;


{ Displays information about the encountered monster }
procedure Pre_Fight(mname: monster_name);
begin

    Writeln;
    Print_Formatted_Text (mname + ' appeared!');

    Print_Monster_Stats(current_location);
    Writeln;
    Print_Formatted_Text ('Press [F] to fight');
    Writeln;

end;


{ Displays a list of keys available at any time }
Procedure Print_Keys;
begin
    Writeln;
    Print_Formatted_Text ('Press anytime: ');
    Print_Formatted_Text ('[X] - exit,  [I] - inventory, [L] - look around');
    Print_Formatted_Text ('[C] - stats, [P] - potion, [H] - this help');
end;