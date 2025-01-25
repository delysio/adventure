{ Initialisation of monster characteristics }
procedure Init_Monsters;
begin

    monsters[LOCATION_LAKE].hit_points := 5;
    monsters[LOCATION_LAKE].defence := 2;
    monsters[LOCATION_LAKE].attack := 5;
    monsters[LOCATION_LAKE].dexterity := 0;
    
    monsters[9].hit_points := 9;
    monsters[9].defence := 2;
    monsters[9].attack := 3;
    monsters[9].dexterity := 0;
end;


{ Initialisation of hero's equipment}
procedure Init_Armory;
begin

    armory.weapon := STARTING_ARMORY;
    armory.weapon_name := '';
    armory.shield := STARTING_ARMORY;
    armory.shield_name := '';
    armory.weapon_slot := STARTING_ARMORY;
    armory.weapon_slot_name := '';
    armory.shield_slot := STARTING_ARMORY;
    armory.shield_slot_name := '';
    armory.head := STARTING_ARMORY;
    armory.head_name := '';
    armory.body := STARTING_ARMORY;
    armory.body_name := '';
    armory.gloves := STARTING_ARMORY;
    armory.gloves_name := '';
    armory.boots := STARTING_ARMORY;
    armory.boots_name := '';
    
end;


{ Initialisation of weapon characteristics}
procedure Init_Weapons;
begin

    { weapons }

    weapons[20].id := 20;                            { dagger }
    weapons[20].kind := 0;
    weapons[20].modifier := 1;

    weapons[21].id := 21;                       { short sword }
    weapons[21].kind := 0;
    weapons[21].modifier := 3;

    weapons[22].id := 22;                        { long sword }
    weapons[22].kind := 0;
    weapons[22].modifier := 5;

    weapons[23].id := 23;                       { elite sword }
    weapons[23].kind := 0;
    weapons[23].modifier := 7;

    { shields }

    weapons[30].id := 30;                     { wooden shield }
    weapons[30].kind := 10;
    weapons[30].modifier := 1;

    weapons[31].id := 31;                      { steel shield }
    weapons[31].kind := 10;
    weapons[31].modifier := 3;

    weapons[32].id := 32;                     { dragon shield }
    weapons[32].kind := 10;
    weapons[32].modifier := 5;

    { weapon magic stones }

    weapons[40].id := 40;                    { bronze stone }
    weapons[40].kind := 20;
    weapons[40].modifier := 2;

    weapons[41].id := 41;                      { gold stone }
    weapons[41].kind := 20;
    weapons[41].modifier := 5;

    weapons[42].id := 42;                   { diamond stone }
    weapons[42].kind := 20;
    weapons[42].modifier := 10;

    { shield magic stones }

    weapons[50].id := 50;                    { bronze stone}
    weapons[50].kind := 20;
    weapons[50].modifier := 2;

    weapons[51].id := 51;                      { gold stone }
    weapons[51].kind := 20;
    weapons[51].modifier := 5;

    weapons[52].id := 52;                   { diamond stone }
    weapons[52].kind := 20;
    weapons[52].modifier := 10;

end;


{ Initialisation of locations, contains information on whether or not items have been taken.}
procedure Init_Locations;
var
    i, j: byte;
begin

    { Clear map }

    for i := 0 to MAP_SIZE do begin
        for j := 0 to MAX_ITEM_NUMBER do begin
            location_items[i,j] := ITEM_NONE;
        end;
    end;

    { Set items }

    location_items[LOCATION_LAKE, 0] := ITEM_TORCH;
    location_items[LOCATION_ISLAND, 0] := ITEM_MACHETE;
    location_items[LOCATION_START, 0] := WEAPON_DAGGER;
    location_items[LOCATION_START, 1] := WEAPON_WOODEN_SHIELD;
    location_items[LOCATION_START, 2] := ITEM_POTION;

end;


{ Initialisation of items carried }
procedure Init_Inventory;
var 
    i: byte;
begin
    for i := 0 to MAX_INVENTORY do inventory_items[i] := ITEM_NONE;
end;


{ Initialises the hero's statistics }
procedure Init_Hero;
begin
    hero.hit_points := STARTING_HIT_POINTS;
    hero.defence := STARTING_DEFENCE;
    hero.attack  := STARTING_ATTACK;
    hero.dexterity := STARTING_DEXTERITY;
end;