const

    MAP_SIZE        = 35;        { size of map }
    MAX_ITEMS_IN_LOCATION = 6;   { maximum number of items in one location }
    MAX_INVENTORY   =  4;        { maximum number of items in backpack }
    MAX_ITEMS       = 98;        { number of items carried }

    STATE_TITLE = 1;                { state ids }
    STATE_GAME  = 2;
    STATE_EXIT  = 3;
    
    LOCATION_SACRED_GROVE =  1;           { location ids }
    LOCATION_LAKE         =  9;           
    LOCATION_ISLAND       = 10;
    LOCATION_GOLDEN_FIELD = 13;
    LOCATION_BUSHES       = 14;
    LOCATION_START        = 15;
    LOCATION_FOREST_1     = 19;
    LOCATION_STREAM       = 20;
    LOCATION_FOREST_2     = 25;
    LOCATION_SPRING       = 26;
    LOCATION_ROCKS        = 27;
    LOCATION_CAVE         = 21;
    LOCATION_FOREST_3     = 31;
    LOCATION_SVAROGS_STONE_CIRCLE  = 32;
    LOCATION_THE_LESHY_VALLEY      = 33;
    LOCATION_STONE_THRESHOLD       = 7;
    
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

    ITEM_POTION_VALUE = 5;

    WEAPON_NIGHT_THORN      = 20;
    WEAPON_BLOOD_HARVEST      = 21;
    WEAPON_SOUL_VANQUISHER       = 22;
    WEAPON_SOUL_THUNDERSTRIKE      = 23;
    WEAPON_WOODEN_SHIELD    = 30;
    WEAPON_IRON_STRONGHOLD     = 31;
    WEAPON_DIAMOND_SEAL    = 32;
    WEAPON_BRONZE_STONE     = 40;
    WEAPON_PERUNS_FLASH       = 41;
    WEAPON_MOKOSHS_TEARS    = 42;
    SHIELD_STONE_OF_DZIVOGON     = 50;
    SHIELD_JAROVITS_BEDROCK     = 51;
    SHIELD_RUSALKAS_EYE    = 52;
    BOOTS_WINGS_OF_THE_WIND = 90;

    ITEM_DESCRIPTIONS: array [0..MAX_ITEMS] of string[17] = (
        'TORCH', 'MACHETE', '', '', '', '', '', '', '', '',
        '', '', '', '', '', 'PERUN''S STONE', 'SVAROG''S HAMMER', 'DAZHBOG''S DIAMOND', 'SVIATOVID''S HORN', 'POTION',
        'Night Thorn', 'Blood Harvest', 'Soul Vanquisher', 'Thunderstrike', '', '', '', '', '', '',
        'Wooden shield', 'Iron Stronghold', 'Diamond Seal', '', '', '', '', '', '', '',
        'Bronze stone', 'Perun''s Flash', 'Mokosh''s Tears', '', '', '', '', '', '', '',
        'Stone of Dzivogon', 'Jarovit''s Bedrock', 'Rusalka''s Eye', '', '', '', '', '', '', '',
        '', '', '', '', '', '', '', '', '', '',
        '', '', '', '', '', '', '', '', '', '',
        '', '', '', '', '', '', '', '', '', '',
        'Wings of the Wind', '', '', '', '', '', '', '', ''
    ); { array with item names }