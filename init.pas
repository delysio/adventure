{ Initialisation of monster characteristics }
procedure Init_Monsters;
begin
    monsters[LOCATION_LAKE].hit_points := 5;
    monsters[LOCATION_LAKE].defence := 2;
    monsters[LOCATION_LAKE].attack := 5;
    
    monsters[LOCATION_SPRING].hit_points := 9;
    monsters[LOCATION_SPRING].defence := 5;
    monsters[LOCATION_SPRING].attack := 9;

    monsters[LOCATION_FOREST_1].hit_points := 6;
    monsters[LOCATION_FOREST_1].defence := 2;
    monsters[LOCATION_FOREST_1].attack := 2;

    monsters[SVAROGS_STONE_CIRCLE].hit_points := 15;
    monsters[SVAROGS_STONE_CIRCLE].defence := 4;
    monsters[SVAROGS_STONE_CIRCLE].attack := 8;
end;


{ Initialisation of hero's equipment}
procedure Init_Armory;
begin

    armory.weapon := INITIAL_ARMORY;
    armory.weapon_name := INITIAL_DESCRIPTION;
    armory.shield := INITIAL_ARMORY;
    armory.shield_name := INITIAL_DESCRIPTION;
    armory.weapon_slot := INITIAL_ARMORY;
    armory.weapon_slot_name := INITIAL_DESCRIPTION;
    armory.shield_slot := INITIAL_ARMORY;
    armory.shield_slot_name := INITIAL_DESCRIPTION;
    armory.head := INITIAL_ARMORY;
    armory.head_name := INITIAL_DESCRIPTION;
    armory.body := INITIAL_ARMORY;
    armory.body_name := INITIAL_DESCRIPTION;
    armory.gloves := INITIAL_ARMORY;
    armory.gloves_name := INITIAL_DESCRIPTION;
    armory.boots := INITIAL_ARMORY;
    armory.boots_name := INITIAL_DESCRIPTION;
    
end;


{ Initialisation of weapon characteristics}
procedure Init_Weapons;
begin

    { weapons }

    weapons[WEAPON_DAGGER].id := 20;                            { dagger }
    weapons[WEAPON_DAGGER].kind := 0;
    weapons[WEAPON_DAGGER].modifier := 1;

    weapons[WEAPON_SHORT_SWORD].id := 21;                       { short sword }
    weapons[WEAPON_SHORT_SWORD].kind := 0;
    weapons[WEAPON_SHORT_SWORD].modifier := 3;

    weapons[WEAPON_LONG_SWORD].id := 22;                        { long sword }
    weapons[WEAPON_LONG_SWORD].kind := 0;
    weapons[WEAPON_LONG_SWORD].modifier := 5;

    weapons[WEAPON_ELITE_SWORD].id := 23;                       { elite sword }
    weapons[WEAPON_ELITE_SWORD].kind := 0;
    weapons[WEAPON_ELITE_SWORD].modifier := 7;

    { shields }

    weapons[WEAPON_WOODEN_SHIELD].id := 30;                     { wooden shield }
    weapons[WEAPON_WOODEN_SHIELD].kind := 10;
    weapons[WEAPON_WOODEN_SHIELD].modifier := 1;

    weapons[WEAPON_STEEL_SHIELD].id := 31;                      { steel shield }
    weapons[WEAPON_STEEL_SHIELD].kind := 10;
    weapons[WEAPON_STEEL_SHIELD].modifier := 3;

    weapons[WEAPON_DRAGON_SHIELD].id := 32;                     { dragon shield }
    weapons[WEAPON_DRAGON_SHIELD].kind := 10;
    weapons[WEAPON_DRAGON_SHIELD].modifier := 5;

    { weapon magic stones }

    weapons[WEAPON_BRONZE_STONE].id := 40;                    { bronze stone }
    weapons[WEAPON_BRONZE_STONE].kind := 20;
    weapons[WEAPON_BRONZE_STONE].modifier := 2;

    weapons[WEAPON_GOLD_STONE].id := 41;                      { gold stone }
    weapons[WEAPON_GOLD_STONE].kind := 20;
    weapons[WEAPON_GOLD_STONE].modifier := 5;

    weapons[WEAPON_DIAMOND_STONE].id := 42;                   { diamond stone }
    weapons[WEAPON_DIAMOND_STONE].kind := 20;
    weapons[WEAPON_DIAMOND_STONE].modifier := 10;

    { shield magic stones }

    weapons[SHIELD_BRONZE_STONE].id := 50;                    { bronze stone}
    weapons[SHIELD_BRONZE_STONE].kind := 20;
    weapons[SHIELD_BRONZE_STONE].modifier := 2;

    weapons[SHIELD_GOLD_STONE].id := 51;                      { gold stone }
    weapons[SHIELD_GOLD_STONE].kind := 20;
    weapons[SHIELD_GOLD_STONE].modifier := 5;

    weapons[SHIELD_DIAMOND_STONE].id := 52;                   { diamond stone }
    weapons[SHIELD_DIAMOND_STONE].kind := 20;
    weapons[SHIELD_DIAMOND_STONE].modifier := 10;

end;


{ Initialisation of locations, contains information on whether or not items have been taken.}
procedure Init_Locations;
var
    map_index, item_index: byte;
begin

    { Clear map }

    for map_index := 0 to MAP_SIZE do begin
        for item_index := 0 to MAX_ITEMS_IN_LOCATION do begin
            location_items[map_index, item_index] := ITEM_NONE;
        end;
    end;

    { Set items }

    location_items[LOCATION_LAKE, 0] := ITEM_TORCH;
    location_items[LOCATION_ISLAND, 0] := ITEM_MACHETE;
    location_items[LOCATION_START, 0] := WEAPON_DAGGER;
    location_items[LOCATION_START, 1] := WEAPON_WOODEN_SHIELD;
    location_items[LOCATION_START, 2] := ITEM_POTION;
    location_items[LOCATION_SPRING, 0] := ITEM_POTION;
    location_items[LOCATION_CAVE, 0] := WEAPON_SHORT_SWORD;
    location_items[LOCATION_CAVE, 1] := ITEM_PERUNS_STONE;

end;


{ Initialisation of items carried }
procedure Init_Inventory;
var 
    inventory_index: byte;
begin
    target_items_number := 0;
    for inventory_index := 0 to MAX_INVENTORY do inventory_items[inventory_index] := ITEM_NONE;
end;


{ Initialises the hero's statistics }
procedure Init_Hero;
begin
    hero.hit_points := INITIAL_HIT_POINTS;
    hero.defence := INITIAL_DEFENCE;
    hero.attack  := INITIAL_ATTACK;
    hero.dexterity := INITIAL_DEXTERITY;
end;