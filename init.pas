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