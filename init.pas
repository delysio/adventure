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

    monsters[LOCATION_SVAROGS_STONE_CIRCLE].hit_points := 15;
    monsters[LOCATION_SVAROGS_STONE_CIRCLE].defence := 4;
    monsters[LOCATION_SVAROGS_STONE_CIRCLE].attack := 8;

    monsters[LOCATION_SACRED_GROVE].hit_points := 10;
    monsters[LOCATION_SACRED_GROVE].defence := 5;
    monsters[LOCATION_SACRED_GROVE].attack := 5;
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

    weapons[WEAPON_NIGHT_THORN].id := 20;                            { dagger }
    weapons[WEAPON_NIGHT_THORN].kind := 0;
    weapons[WEAPON_NIGHT_THORN].modifier := 1;

    weapons[WEAPON_BLOOD_HARVEST].id := 21;                       { short sword }
    weapons[WEAPON_BLOOD_HARVEST].kind := 0;
    weapons[WEAPON_BLOOD_HARVEST].modifier := 3;

    weapons[WEAPON_SOUL_VANQUISHER].id := 22;                        { long sword }
    weapons[WEAPON_SOUL_VANQUISHER].kind := 0;
    weapons[WEAPON_SOUL_VANQUISHER].modifier := 5;

    weapons[WEAPON_SOUL_THUNDERSTRIKE].id := 23;                       { elite sword }
    weapons[WEAPON_SOUL_THUNDERSTRIKE].kind := 0;
    weapons[WEAPON_SOUL_THUNDERSTRIKE].modifier := 7;

    { shields }

    weapons[WEAPON_WOODEN_SHIELD].id := 30;                     { wooden shield }
    weapons[WEAPON_WOODEN_SHIELD].kind := 1;
    weapons[WEAPON_WOODEN_SHIELD].modifier := 1;

    weapons[WEAPON_IRON_STRONGHOLD].id := 31;                      { steel shield }
    weapons[WEAPON_IRON_STRONGHOLD].kind := 1;
    weapons[WEAPON_IRON_STRONGHOLD].modifier := 3;

    weapons[WEAPON_DIAMOND_SEAL].id := 32;                     { dragon shield }
    weapons[WEAPON_DIAMOND_SEAL].kind := 1;
    weapons[WEAPON_DIAMOND_SEAL].modifier := 5;

    { weapon magic stones }

    weapons[WEAPON_BRONZE_STONE].id := 40;                    { bronze stone }
    weapons[WEAPON_BRONZE_STONE].kind := 2;
    weapons[WEAPON_BRONZE_STONE].modifier := 2;

    weapons[WEAPON_PERUNS_FLASH].id := 41;                      { gold stone }
    weapons[WEAPON_PERUNS_FLASH].kind := 2;
    weapons[WEAPON_PERUNS_FLASH].modifier := 5;

    weapons[WEAPON_MOKOSHS_TEARS].id := 42;                   { diamond stone }
    weapons[WEAPON_MOKOSHS_TEARS].kind := 2;
    weapons[WEAPON_MOKOSHS_TEARS].modifier := 10;

    { shield magic stones }

    weapons[SHIELD_STONE_OF_DZIVOGON].id := 50;                    { bronze stone}
    weapons[SHIELD_STONE_OF_DZIVOGON].kind := 3;
    weapons[SHIELD_STONE_OF_DZIVOGON].modifier := 2;

    weapons[SHIELD_JAROVITS_BEDROCK].id := 51;                      { gold stone }
    weapons[SHIELD_JAROVITS_BEDROCK].kind := 3;
    weapons[SHIELD_JAROVITS_BEDROCK].modifier := 5;

    weapons[SHIELD_RUSALKAS_EYE].id := 52;                   { diamond stone }
    weapons[SHIELD_RUSALKAS_EYE].kind := 3;
    weapons[SHIELD_RUSALKAS_EYE].modifier := 10;

    { armory - boots }

    weapons[BOOTS_WINGS_OF_THE_WIND].id := 90;
    weapons[BOOTS_WINGS_OF_THE_WIND].kind := 7;
    weapons[BOOTS_WINGS_OF_THE_WIND].modifier := 2;
    
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
    location_items[LOCATION_START, 0] := WEAPON_NIGHT_THORN;
    location_items[LOCATION_START, 1] := WEAPON_WOODEN_SHIELD;
    location_items[LOCATION_START, 2] := ITEM_POTION;
    location_items[LOCATION_SPRING, 0] := ITEM_POTION;
    location_items[LOCATION_CAVE, 0] := WEAPON_BLOOD_HARVEST;
    location_items[LOCATION_CAVE, 1] := ITEM_PERUNS_STONE;
    location_items[LOCATION_GOLDEN_FIELD, 0] := BOOTS_WINGS_OF_THE_WIND;
    location_items[LOCATION_SACRED_GROVE, 0] := SHIELD_STONE_OF_DZIVOGON;

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