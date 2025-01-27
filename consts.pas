const

    MAP_SIZE        = 35;        { size of map }
    MAX_ITEM_NUMBER =  8;        { maximum number of items in one location }
    MAX_INVENTORY   =  4;        { maximum number of items in backpack }
    MAX_ITEMS       = 98;        { number of items carried }
    MAX_STORAGE     =  9;        { number of items in storage }

    STATE_TITLE = 1;                { state ids }
    STATE_GAME  = 2;
    STATE_EXIT  = 3;
    
    LOCATION_LAKE     =  9;           { location ids }
    LOCATION_ISLAND   = 10;
    LOCATION_BUSHES   = 14;
    LOCATION_START    = 15;
    LOCATION_FOREST_1 = 19;
    LOCATION_STREAM   = 20;
    LOCATION_FOREST_2 = 25;
    LOCATION_SPRING   = 26;
    LOCATION_ROCKS    = 27;
    LOCATION_CAVE     = 21;
    
    INITIAL_HIT_POINTS = 50;       { configuration of hero starting stats }
    INITIAL_DEFENCE    = 1;
    INITIAL_ATTACK     = 5;
    INITIAL_DEXTERITY  = 2;

    INITIAL_DESCRIPTION = '';

    INITIAL_ARMORY     = 0;

    ITEM_TORCH            = 0;        { item ids }
    ITEM_MACHETE          = 1;
    ITEM_PERUNS_STONE     = 15;
    ITEM_SVAROGS_HAMMER   = 16;
    ITEM_DAZHBOGS_DIAMOND = 17;
    ITEM_SVIATOVIDS_HORN  = 18;
    ITEM_POTION           = 19;
    ITEM_NONE             = 255;

    ITEM_POTION_VALUE   = 5;

    WEAPON_DAGGER           = 20;
    WEAPON_SHORT_SWORD      = 21;
    WEAPON_LONG_SWORD       = 22;
    WEAPON_ELITE_SWORD      = 23;
    WEAPON_WOODEN_SHIELD    = 30;
    WEAPON_STEEL_SHIELD     = 31;
    WEAPON_DRAGON_SHIELD    = 32;
    WEAPON_BRONZE_STONE     = 40;
    WEAPON_GOLD_STONE       = 41;
    WEAPON_DIAMOND_STONE    = 42;
    SHIELD_BRONZE_STONE     = 50;
    SHIELD_GOLD_STONE       = 51;
    SHIELD_DIAMOND_STONE    = 52;

    ITEM_DESCRIPTIONS: array [0..MAX_ITEMS] of string[17] = (
        'TORCH', 'MACHETE', '', '', '', '', '', '', '', '',
        '', '', '', '', '', 'PERUN''S STONE', 'SVAROG''S HAMMER', 'DAZHBOG''S DIAMOND', 'SVIATOVID''S HORN', 'POTION',
        'DAGGER', 'SHORT SWORD', 'LONG SWORD', 'ELITE SWORD', '', '', '', '', '', '',
        'WOODEN SHIELD', 'STEEL SHIELD', 'DRAGON SHIELD', '', '', '', '', '', '', '',
        'BRONZE STONE', 'GOLD STONE', 'DIAMOND STONE', '', '', '', '', '', '', '',
        'BRONZE STONE', 'GOLD STONE', 'DIAMOND STONE', '', '', '', '', '', '', '',
        '', '', '', '', '', '', '', '', '', '',
        '', '', '', '', '', '', '', '', '', '',
        '', '', '', '', '', '', '', '', '', '',
        '', '', '', '', '', '', '', '', ''
    ); { array with item names }