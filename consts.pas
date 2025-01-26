const

    MAP_SIZE        = 35;        { size of map }
    MAX_ITEM_NUMBER =  4;        { maximum number of items in one location }
    MAX_INVENTORY   =  4;        { maximum number of items in backpack }
    MAX_ITEMS       = 98;        { number of items carried }
    MAX_STORAGE     =  9;        { number of items in storage }

    STATE_TITLE = 1;                { state ids }
    STATE_GAME  = 2;
    STATE_EXIT  = 3;
    
    LOCATION_LAKE   =  9;           { location ids }
    LOCATION_ISLAND = 10;
    LOCATION_BUSHES = 14;
    LOCATION_START  = 15;
    LOCATION_STREAM = 20;
    LOCATION_SPRING = 26;
    LOCATION_ROCKS  = 27;
    LOCATION_CAVE   = 21;
    
    INITIAL_HIT_POINTS = 50;       { configuration of hero starting stats }
    INITIAL_DEFENCE    = 1;
    INITIAL_ATTACK     = 5;
    INITIAL_DEXTERITY  = 1;

    INITIAL_DESCRIPTION = '';

    INITIAL_ARMORY     = 0;

    ITEM_TORCH          = 0;        { item ids }
    ITEM_MACHETE        = 1;
    ITEM_PERUNS_STONE   = 15;
    ITEM_POTION         = 19;
    ITEM_NONE           = 255;

    ITEM_POTION_VALUE   = 5;

    WEAPON_DAGGER           = 20;
    WEAPON_SHORT_SWORD      = 21;
    WEAPON_WOODEN_SHIELD    = 30;

    ITEM_DESCRIPTIONS: array [0..MAX_ITEMS] of string[13] = (
        'TORCH', 'MACHETE', '', '', '', '', '', '', '', '',
        '', '', '', '', '', 'PERUN''S STONE', '', '', '', 'POTION',
        'DAGGER', 'SHORT SWORD', '', '', '', '', '', '', '', '',
        'WOODEN SHIELD', '', '', '', '', '', '', '', '', '',
        '', '', '', '', '', '', '', '', '', '',
        '', '', '', '', '', '', '', '', '', '',
        '', '', '', '', '', '', '', '', '', '',
        '', '', '', '', '', '', '', '', '', '',
        '', '', '', '', '', '', '', '', '', '',
        '', '', '', '', '', '', '', '', ''
    ); { array with item names }