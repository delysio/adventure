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

    monsters[LOCATION_MORANA_CIRCLE].hit_points := 15;
    monsters[LOCATION_MORANA_CIRCLE].defence := 7;
    monsters[LOCATION_MORANA_CIRCLE].attack := 6;

    monsters[LOCATION_MOUND_INSIDE].hit_points := 20;
    monsters[LOCATION_MOUND_INSIDE].defence := 9;
    monsters[LOCATION_MOUND_INSIDE].attack := 8;

    monsters[LOCATION_MELT_SWAMP].hit_points := 25;
    monsters[LOCATION_MELT_SWAMP].defence := 11;
    monsters[LOCATION_MELT_SWAMP].attack := 11;

    monsters[LOCATION_ETERNAL_WHISPER].hit_points := 25;
    monsters[LOCATION_ETERNAL_WHISPER].defence := 11;
    monsters[LOCATION_ETERNAL_WHISPER].attack := 11;

    monsters[LOCATION_INFINITE_STAIRCASE].hit_points := 30;
    monsters[LOCATION_INFINITE_STAIRCASE].defence := 8;
    monsters[LOCATION_INFINITE_STAIRCASE].attack := 8;
    
    monsters[LOCATION_FORGOTTEN_BASIN].hit_points := 40;
    monsters[LOCATION_FORGOTTEN_BASIN].defence := 8;
    monsters[LOCATION_FORGOTTEN_BASIN].attack := 8;

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

    weapons[WEAPON_THUNDERSTRIKE].id := 23;                       { elite sword }
    weapons[WEAPON_THUNDERSTRIKE].kind := 0;
    weapons[WEAPON_THUNDERSTRIKE].modifier := 7;

    { shields }

    weapons[SHIELD_WOODEN_SHIELD].id := 30;                     { wooden shield }
    weapons[SHIELD_WOODEN_SHIELD].kind := 1;
    weapons[SHIELD_WOODEN_SHIELD].modifier := 1;

    weapons[SHIELD_IRON_STRONGHOLD].id := 31;                      { steel shield }
    weapons[SHIELD_IRON_STRONGHOLD].kind := 1;
    weapons[SHIELD_IRON_STRONGHOLD].modifier := 3;

    weapons[SHIELD_DIAMOND_SEAL].id := 32;                     { dragon shield }
    weapons[SHIELD_DIAMOND_SEAL].kind := 1;
    weapons[SHIELD_DIAMOND_SEAL].modifier := 5;

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

    { armory - head }

    weapons[HEAD_SOUTHERN_SUN].id := 60;
    weapons[HEAD_SOUTHERN_SUN].kind := 4;
    weapons[HEAD_SOUTHERN_SUN].modifier := 2;

    weapons[HEAD_THUNDERER].id := 61;
    weapons[HEAD_THUNDERER].kind := 4;
    weapons[HEAD_THUNDERER].modifier := 5;

    weapons[HEAD_SVAROG_CROWN].id := 62;
    weapons[HEAD_SVAROG_CROWN].kind := 4;
    weapons[HEAD_SVAROG_CROWN].modifier := 10;

    { armory - body }

    weapons[BODY_CLOAK_OF_WELES].id := 70;
    weapons[BODY_CLOAK_OF_WELES].kind := 5;
    weapons[BODY_CLOAK_OF_WELES].modifier := 2;

    weapons[BODY_WINTER_WHIRLWIND].id := 71;
    weapons[BODY_WINTER_WHIRLWIND].kind := 5;
    weapons[BODY_WINTER_WHIRLWIND].modifier := 5;

    weapons[BODY_THUNDERER_ARMOR].id := 72;
    weapons[BODY_THUNDERER_ARMOR].kind := 5;
    weapons[BODY_THUNDERER_ARMOR].modifier := 10;

    { armory - boots }

    weapons[BOOTS_WINGS_OF_THE_WIND].id := 90;
    weapons[BOOTS_WINGS_OF_THE_WIND].kind := 7;
    weapons[BOOTS_WINGS_OF_THE_WIND].modifier := 2;
    
    weapons[BOOTS_WOLF_FEET].id := 91;
    weapons[BOOTS_WOLF_FEET].kind := 7;
    weapons[BOOTS_WOLF_FEET].modifier := 5;
    
    weapons[BOOTS_THUNDEBOLT_CLOGS].id := 92;
    weapons[BOOTS_THUNDEBOLT_CLOGS].kind := 7;
    weapons[BOOTS_THUNDEBOLT_CLOGS].modifier := 10;
    
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

    { Clear mysteries status }

    mystery_solved_5 := false;
    mystery_solved_6 := false;

    { Set items }

    location_items[LOCATION_LAKE, 0] := ITEM_TORCH;
    location_items[LOCATION_ISLAND, 0] := ITEM_MACHETE;
    location_items[LOCATION_START, 0] := WEAPON_NIGHT_THORN;
    location_items[LOCATION_START, 1] := SHIELD_WOODEN_SHIELD;
    location_items[LOCATION_START, 2] := ITEM_POTION;
    location_items[LOCATION_SPRING, 0] := ITEM_POTION;
    location_items[LOCATION_CAVE, 0] := WEAPON_BLOOD_HARVEST;
    location_items[LOCATION_CAVE, 1] := ITEM_PERUNS_STONE;
    location_items[LOCATION_GOLDEN_FIELD, 0] := BOOTS_WINGS_OF_THE_WIND;
    location_items[LOCATION_SVAROGS_STONE_CIRCLE, 0] := WEAPON_BRONZE_STONE;
    location_items[LOCATION_SACRED_GROVE, 0] := SHIELD_STONE_OF_DZIVOGON;
    location_items[LOCATION_SACRED_GROVE, 1] := ITEM_BONDCUTTER;
    location_items[LOCATION_LAKE_NIGHT_DAY, 0] := BODY_CLOAK_OF_WELES;
    location_items[LOCATION_MORANA_CIRCLE, 0] := ITEM_SVAROGS_HAMMER;
    location_items[LOCATION_MORANA_CIRCLE, 1] := SHIELD_IRON_STRONGHOLD;
    location_items[LOCATION_MOUND_INSIDE, 0] := HEAD_SOUTHERN_SUN;
    location_items[LOCATION_ECHOES_OF_THE_ANCIENTS, 0] := ITEM_BONE_TOKEN;
    location_items[LOCATION_WIND_AND_BONE_PASS, 0] := ITEM_POTION;
    location_items[LOCATION_ECHOES_OF_THE_ANCIENTS, 1] := SHIELD_JAROVITS_BEDROCK;
    location_items[LOCATION_MELT_SWAMP, 0] := ITEM_DAZHBOGS_DIAMOND;
    location_items[LOCATION_MELT_SWAMP, 1] := WEAPON_PERUNS_FLASH;
    location_items[LOCATION_ETERNAL_WHISPER, 0] := ITEM_POTION;
    location_items[LOCATION_TOMB_OF_THE_GODS, 0] := BODY_THUNDERER_ARMOR;
    location_items[LOCATION_FOREST_OF_WHISPERS, 0] := HEAD_SVAROG_CROWN;
    location_items[LOCATION_FORGOTTEN_BASIN, 0] := ITEM_SVIATOVIDS_HORN;

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