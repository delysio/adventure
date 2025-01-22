program Hello;

uses crt;

type 
    Tplayer = record
        hit_points  : integer;
        defence     : byte;
        attack      : byte;
        dexterity   : byte;
    end;

    Tmonster = record
        hit_points  : integer;
        defence     : byte;
        attack      : byte;
        dexterity   : byte;
    end;
    
    Tmonsters = array[0..36] of ^Tmonster;
    
    Tarmor = record
        weapon      : byte;
        shield      : byte;
        weapon_slot : byte;
        shield_slot : byte;
        head        : byte;
        body        : byte;
        gloves      : byte;
        boots       : byte;
    end;
    
    Titem = record
        id          : byte;         { ID is used to name the object }
        kind        : byte;         { kind }
        modifier    : byte;         { How many bonus points it adds }
    end;

const

    MAP_SIZE = 36;                  { size of map }
    MAX_INVENTORY = 5;              { maximum number of items in backpack }
    MAX_ITEMS = 2;                  { number of items in game }

    STATE_TITLE = 1;                { state ids }
    STATE_GAME  = 2;
    STATE_EXIT  = 3;
    
    LOCATION_LAKE   =  9;           { location ids }
    LOCATION_ISLAND = 10;
    LOCATION_THICKED_OF_BUSHES = 14;
    LOCATION_START  = 15;
    
    STARTING_HIT_POINTS = 20;       { configuration of hero starting stats }
    STARTING_DEFENCE    = 1;
    STARTING_ATTACK     = 5;
    STARTING_DEXTERITY  = 1;

    STARTING_ARMORY     = 0;

    ITEM_TORCH          = 0;        { item ids }
    ITEM_MACHETE        = 1;
    ITEM_NONE           = 255;

    ITEM_DESCRIPTIONS: array [0..MAX_ITEMS-1] of string = ('TORCH', 'MACHETE'); { array with item names }

var 
    current_state    : byte = STATE_TITLE;
    current_location : byte;
    previous_location: byte;
    key_hit          : char;
    game_over        : boolean = FALSE;
    success          : boolean;
    hero             : Tplayer;
    monsters         : Tmonsters;
    armory           : Tarmor;
    current_monster  : ^Tmonster;
    
    location_items   : array [0..MAP_SIZE-1] of boolean;
    inventory_items  : array [0..MAX_INVENTORY-1] of byte;
    
    dagger           : Titem;
    
    
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
    
    Writeln ('Hero stats: HP ', hit_points, ', DEF ', defence, ', ATT ', attack);
    
end;


{ Prints monster stats }
procedure Print_Monster_Stats(monster_id: byte);
begin
    current_monster := @monsters[current_location];
    Writeln ('Monster stats: HP ', current_monster^.hit_points, ', DEF ', current_monster^.defence, ' ATT ', current_monster^.attack);
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
    value := armory.shield + armory.shield_slot;
    Writeln ('SHIELD: +', value);
    value := armory.head + armory.body + armory.gloves + armory.boots;
    Writeln ('ARMORY: +', value);

end;


{ Organises the array with the items, the empty spaces are always placed at the end of the array }
procedure Organise_Item_Array;
var i, j: byte;
begin
    j := 0;

    for i := 0 to MAX_ITEMS-1 do
    begin
        if inventory_items[i] <> ITEM_NONE then
        begin
            inventory_items[j] := inventory_items[i];
            if j <> i then inventory_items[i] := ITEM_NONE;
            j := j + 1;
        end;
    end;

end;


{ Displays the contents of your inventory and allows you to discard unnecessary items }
procedure Print_Inventory;
var
    i, j, k : byte;
    count : byte;
    key: char;
begin

    count := 1;
    k := 0;

    for i := 0 to MAX_INVENTORY-1 do begin

        if inventory_items[i] <> ITEM_NONE then begin
            
            j := inventory_items[i];
            Writeln (count, ' ', ITEM_DESCRIPTIONS[j]);
            count := count + 1;
            k := k + 1;
        
        end;

    end;

    Writeln;

    if k > 0 then begin

        Writeln ('Press the corresponding number to drop the item or [X] to exit inventory');

        repeat
            key := ReadKey;
        until ((key >= '1') and (key <= Chr(Ord('0') + count - 1))) or (key = 'X') or (key = 'x');

        if (key <> 'x') and (key <> 'X') then begin
        
            i := Ord(key) - Ord('0') - 1;
            if inventory_items[i] <> ITEM_NONE then begin

                    j := inventory_items[i];
                    inventory_items[i] := ITEM_NONE;
                    Writeln ('You have dropped ', ITEM_DESCRIPTIONS[j]);
                    Organise_Item_Array;
            
            end;

        end;

    end else begin

        Writeln ('Inventory is empty.');

    end;

end;


{ Handling the player's battles with monsters }
procedure Fight;
var 
    damage: integer;
    player_run: boolean = FALSE;
begin
    Writeln;
    Writeln('Fighting!');
    Writeln;
    
    repeat 

        Print_Hero_Stats;
        Print_Monster_Stats(current_location);
    
        { Player attack }
        
        current_monster := @monsters[current_location];

        damage := Random(hero.attack) + armory.weapon + armory.weapon_slot - current_monster^.defence;
        
        if damage <= 0 then begin

            Writeln ('Monster dodged');
        
        end else begin
        
            current_monster^.hit_points := current_monster^.hit_points - damage;
            Writeln ('Your hit: ', damage);
            
        end;
        
        { Monster attack }
        
        if current_monster^.hit_points > 0 then begin
        
            damage := Random(current_monster^.attack) - Random(hero.defence) - armory.shield - armory.shield_slot - armory.head - armory.body - armory.gloves - armory.boots;
            
            if damage <= 0 then begin
            
                Writeln ('Monster missed... ');
            
            end else begin
            
                hero.hit_points := hero.hit_points - damage;
                Writeln ('Monster hits you: ', damage);
            
            end;
        
        end else begin

            Writeln ('Monster is dead.');
            current_monster^.hit_points := 0;

        end;

        Writeln;

        if (current_monster^.hit_points > 0) and (hero.hit_points > 0) then begin
        
            Writeln ('Continue [F]ighting or [R]un away');
            Writeln;
            
            key_hit := ReadKey;
            
            case key_hit of 
            
                'R', 'r': begin
                
                    Writeln ('You ran...');
                    player_run := TRUE;
                    current_location := previous_location;
                
                end;
            
            end;

        end;
    
    until (hero.hit_points <= 0) or (current_monster^.hit_points <= 0) or (player_run = TRUE);

    if hero.hit_points <= 0 then begin
        
        Writeln ('Monster killed you.');
        Writeln;
        Writeln ('Game over.');
        Writeln;
        Writeln ('Press any key to return to title screen.');

        repeat until KeyPressed;

        game_over := TRUE;
        
    end;
    
end;


{ Initialisation of monster characteristics }
procedure Init_Monsters;
begin

    current_monster := @monsters[9];    { Lake }

    current_monster^.hit_points := 50;
    current_monster^.defence := 2;
    current_monster^.attack := 5;
    current_monster^.dexterity := 0;

    current_monster := @monsters[3];
    
    current_monster^.hit_points := 9;
    current_monster^.defence := 2;
    current_monster^.attack := 3;
    current_monster^.dexterity := 0;
end;


{ Initialisation of hero's equipment}
procedure Init_Armory;
begin

    armory.weapon := STARTING_ARMORY;
    armory.shield := STARTING_ARMORY;
    armory.weapon_slot := STARTING_ARMORY;
    armory.shield_slot := STARTING_ARMORY;
    armory.head := STARTING_ARMORY;
    armory.body := STARTING_ARMORY;
    armory.gloves := STARTING_ARMORY;
    armory.boots := STARTING_ARMORY;
    
end;


{ Initialisation of weapon characteristics}
procedure Init_Weapons;
begin

    dagger.id := 0;
    dagger.kind := 0;
    dagger.modifier := 1;

end;


{ Initialisation of locations, contains information on whether or not items have been taken.}
procedure Init_Locations;
var
    i: byte;
begin

    for i := 0 to MAP_SIZE-1 do location_items[i] := TRUE;

end;


{ Initialisation of items carried }
procedure Init_Items;
var 
    i: byte;
begin
    for i := 0 to MAX_INVENTORY-1 do inventory_items[i] := ITEM_NONE;
end;


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
function Add_To_Inventory(item: byte): boolean;
var i: byte;
begin

    result := FALSE;

    for i := 0 to MAX_INVENTORY-1 do begin
        if inventory_items[i] = ITEM_NONE then begin
            inventory_items[i] := item;
            Writeln ('You took the ', ITEM_DESCRIPTIONS[item]);
            result := TRUE;
            exit;
        end;
    end;

    if result = FALSE then Writeln ('Inventory is full');
    
end;


{ Checks whether the item is in the inventory }
function Is_In_Inventory(item: byte): boolean;
var i: byte;
begin

    result := false;
    for i := 0 to MAX_INVENTORY-1 do begin
        if inventory_items[i] = item then begin
            result := true;
            exit;
        end;
    end;

end;


{ Main program}
begin
  
    repeat 
    
        case current_state of
        
            STATE_TITLE:
            begin
            
                Randomize;
                Init_Monsters;
                Init_Weapons;
                Init_Armory;
                Init_Locations;
                Init_Items;
            
                ClrScr;
                Writeln;
                Writeln ('Adventure by NG');
                Writeln;
                Writeln ('Press [S] to start');
                Writeln ('Press [Q] to exit');

                repeat
                
                    key_hit := ReadKey;

                until (key_hit = 'S') or (key_hit = 's') or (key_hit = 'Q') or (key_hit = 'q');

                case key_hit of
                    
                    'S', 's': current_state := STATE_GAME;
                    'Q', 'q': current_state := STATE_EXIT;
                
                end;

            end;
            STATE_GAME:
            begin
            
                hero.hit_points := STARTING_HIT_POINTS;
                hero.defence := STARTING_DEFENCE;
                hero.attack  := STARTING_ATTACK;
                hero.dexterity := STARTING_DEXTERITY;
            
                current_location := LOCATION_START;
            
                Writeln;
                Writeln ('Welcome in game!');
                Writeln;
                Writeln ('Press [X] anytime to exit');
                Writeln ('Press [I] anytime to show your inventory');
                Writeln ('Press [C] anytime to show your weapon statistics');
                
                repeat
                
                    case current_location of 
                    
                        LOCATION_START:
                        begin

                            Writeln;
                            Writeln ('This is starting location.');
                            
                            if location_items[current_location] = TRUE then begin

                                Writeln ('There is a item.');

                            end;
                            
                            Write ('You can go [N]orth, [E]ast');

                            if location_items[current_location] = TRUE then begin

                                Writeln (' or [G]et item');

                            end;
                            
                            key_hit := ReadKey;
                    
                            case key_hit of
                                
                                'N', 'n': begin
                                    current_location := LOCATION_LAKE;
                                end;
                                'G', 'g': begin
                                    if location_items[current_location] = TRUE then begin
                                        Add_To_Armory(dagger);
                                        location_items[LOCATION_START] := FALSE;
                                    end;
                                end;
                                'E', 'e': begin
                                    current_location := LOCATION_THICKED_OF_BUSHES;
                                end;
                                'C', 'c': begin
                                    Print_Armory_Stats;
                                end;
                                'I', 'i': begin
                                    Print_Inventory;
                                end;
                                'X', 'x': begin
                                    current_state := STATE_TITLE;
                                end;
            
                            end;
                            previous_location := LOCATION_START;
                            
                        end;
                        
                        LOCATION_LAKE:
                        begin
                            Writeln;
                            Writeln ('You see a lake with a boat next to it. An island is visible to the east.');

                            current_monster := @monsters[current_location];
                            
                            if current_monster^.hit_points > 0 then begin
                            
                                Writeln ('Monster appeared!');
                                Print_Monster_Stats(current_location);
                                Writeln ('You can [F]ight or go [S]outh, [E]est');
                            
                            end;

                            if (current_monster^.hit_points = 0) and (location_items[current_location] = TRUE) then begin

                                Writeln ('There is an item');
                                Writeln ('You can [G]et an item or go [S]outh, [E]est');

                            end;

                            if (current_monster^.hit_points = 0) and (location_items[current_location] = FALSE) then begin

                                Writeln ('You can go [S]outh, [E]est');

                            end;
                            
                            key_hit := ReadKey;
                    
                            case key_hit of
                                
                                'G', 'g': begin
                                    if (current_monster^.hit_points = 0) and (location_items[current_location] = TRUE) then begin
                                        success := Add_To_Inventory(ITEM_TORCH);
                                        if success = TRUE then location_items[current_location] := FALSE;
                                    end;
                                end;
                                'F', 'f': begin
                                    Fight;
                                end;
                                'S', 's': begin
                                    current_location := LOCATION_START;
                                end;
                                'E', 'e': begin
                                    current_location := LOCATION_ISLAND;
                                end;
                                'C', 'c': begin
                                    Print_Armory_Stats;
                                end;
                                'I', 'i': begin
                                    Print_Inventory;
                                end;
                                'X', 'x': begin
                                    current_state := STATE_TITLE;
                                end;
            
                            end;
                        
                            previous_location := LOCATION_LAKE;
                            
                        end;

                        LOCATION_ISLAND:
                        begin

                            Writeln;
                            Writeln ('This is island');

                            if Is_In_Inventory(ITEM_TORCH) = FALSE then begin

                                Writeln ('Darkness, nothing to see here...');
                                Writeln ('You can go [W]est');

                            end else begin

                                Writeln ('A torch illuminates part of the island.');
                                
                                if location_items[current_location] = TRUE then begin
                                
                                    Writeln ('There is an item.');
                                    Writeln ('You can [G]et item or go [W]est');

                                end else begin

                                    Writeln ('You can go [W]est');

                                end;

                            end;
                            
                            key_hit := ReadKey;
                    
                            case key_hit of

                                'G', 'g': begin
                                    if (Is_In_Inventory(ITEM_TORCH) = TRUE) and (location_items[current_location] = TRUE) then begin
                                        success := Add_To_Inventory(ITEM_MACHETE);
                                        if success = TRUE then location_items[current_location] := FALSE;
                                    end;
                                end;
                                'W', 'w': begin
                                    current_location := LOCATION_LAKE;
                                end;
                                 'C', 'c': begin
                                    Print_Armory_Stats;
                                end;
                                'I', 'i': begin
                                    Print_Inventory;
                                end;
                                'X', 'x': begin
                                    current_state := STATE_TITLE;
                                end;
            
                            end;
                            previous_location := LOCATION_ISLAND;
                            
                        end;

                        LOCATION_THICKED_OF_BUSHES:
                        begin

                            Writeln;
                            Writeln ('This is thicked of bushes');

                            if Is_In_Inventory(ITEM_MACHETE) = FALSE then begin

                                Writeln ('There seems to be no passage here. The bushes are so dense that you can not go any further...');
                                Writeln ('You can go [W]est');

                            end else begin

                                Writeln ('Using a machete, you tear through the area.');
                                Writeln ('You can go [E]ast or [W]est');

                            end;
                            
                            key_hit := ReadKey;
                    
                            case key_hit of

                                'W', 'w': begin
                                    current_location := LOCATION_START;
                                end;
                                'C', 'c': begin
                                    Print_Armory_Stats;
                                end;
                                'I', 'i': begin
                                    Print_Inventory;
                                end;
                                'X', 'x': begin
                                    current_state := STATE_TITLE;
                                end;
            
                            end;
                            previous_location := LOCATION_THICKED_OF_BUSHES;
                            
                        end;
                    
                    end;

                until (game_over = TRUE) or (current_state <> STATE_GAME); {* REPEAT THROUGH LOCATIONS *}
                
                current_state := STATE_TITLE;
            
            end;
        
        end; {* CASE GAME STATE *}
  
    until current_state = STATE_EXIT;
  
end.