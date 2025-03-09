const

    MAP_SIZE                = 36;   { size of map }
    MAX_ITEMS_IN_LOCATION   =  6;   { maximum number of items in one location }
    MAX_INVENTORY           =  3;   { maximum number of items in backpack }
    MAX_ITEMS               = 98;   { number of different items }

    STATE_TITLE = 1;                { state ids }
    STATE_GAME  = 2;
    STATE_EXIT  = 3;
    
    LOCATION_SACRED_GROVE           =  1;           { location ids }
    LOCATION_ETERNAL_WHISPER        =  2;
    LOCATION_CROSSROADS_OF_THORNS   =  3;
    LOCATION_CLIFF_OF_FORGETFULNESS =  4;
    LOCATION_TOMB_OF_THE_GODS       =  5;
    LOCATION_FOREST_OF_WHISPERS     =  6;
    LOCATION_STONE_THRESHOLD        =  7;
    LOCATION_LAKE                   =  9;           
    LOCATION_SOUNDLESS_PASS         =  8;
    LOCATION_ISLAND                 = 10;
    LOCATION_INFINITE_STAIRCASE     = 11;
    LOCATION_CROSSROADS_OF_SHADOWS  = 12;
    LOCATION_GOLDEN_FIELD           = 13;
    LOCATION_BUSHES                 = 14;
    LOCATION_START                  = 15;
    LOCATION_MOUND_INSIDE           = 16;
    LOCATION_ECHOES_OF_THE_ANCIENTS = 17;
    LOCATION_FORGOTTEN_BASIN        = 18;
    LOCATION_FOREST_1               = 19;
    LOCATION_STREAM                 = 20;
    LOCATION_MOUND                  = 22;
    LOCATION_CAVE                   = 21;
    LOCATION_WIND_AND_BONE_PASS     = 23;
    LOCATION_FOREST_2               = 25;
    LOCATION_SPRING                 = 26;
    LOCATION_ROCKS                  = 27;
    LOCATION_MORANA_CIRCLE          = 28;
    LOCATION_LAKE_OF_SOULS          = 29;
    LOCATION_MELT_SWAMP             = 30;
    LOCATION_FOREST_3               = 31;
    LOCATION_SVAROGS_STONE_CIRCLE   = 32;
    LOCATION_THE_LESHY_VALLEY       = 33;
    LOCATION_LAKE_NIGHT_DAY         = 34;
    LOCATION_DARK_HARBOUR           = 35;
    LOCATION_BLOODY_ROOTS           = 36;
    
    INITIAL_HIT_POINTS              = 50;       { configuration of hero starting stats }
    INITIAL_DEFENCE                 = 5;
    INITIAL_ATTACK                  = 5;
    INITIAL_DEXTERITY               = 2;

    INITIAL_DESCRIPTION             = '';

    INITIAL_ARMORY                  = 0;

    ITEM_TORCH                      = 0;        { item ids }
    ITEM_MACHETE                    = 1;
    ITEM_BONDCUTTER                 = 2;
    ITEM_BONE_TOKEN                 = 3;
    ITEM_PERUNS_STONE               = 15;
    ITEM_SVAROGS_HAMMER             = 16;
    ITEM_DAZHBOGS_DIAMOND           = 17;
    ITEM_SVIATOVIDS_HORN            = 18;
    ITEM_POTION                     = 19;
    ITEM_NONE                       = 255;

    ITEM_POTION_VALUE               = 5;

    WEAPON_NIGHT_THORN              = 20;
    WEAPON_BLOOD_HARVEST            = 21;
    WEAPON_SOUL_VANQUISHER          = 22;
    WEAPON_THUNDERSTRIKE            = 23;
    SHIELD_WOODEN_SHIELD            = 30;
    SHIELD_IRON_STRONGHOLD          = 31;
    SHIELD_DIAMOND_SEAL             = 32;
    WEAPON_BRONZE_STONE             = 40;
    WEAPON_PERUNS_FLASH             = 41;
    WEAPON_MOKOSHS_TEARS            = 42;
    SHIELD_STONE_OF_DZIVOGON        = 50;
    SHIELD_JAROVITS_BEDROCK         = 51;
    SHIELD_RUSALKAS_EYE             = 52;
    HEAD_SOUTHERN_SUN               = 60;
    HEAD_THUNDERER                  = 61;
    HEAD_SVAROG_CROWN               = 62;
    BODY_CLOAK_OF_WELES             = 70;
    BODY_WINTER_WHIRLWIND           = 71;
    BODY_THUNDERER_ARMOR            = 72;
    BOOTS_WINGS_OF_THE_WIND         = 90;
    BOOTS_WOLF_FEET                 = 91;
    BOOTS_THUNDEBOLT_CLOGS          = 92;

    ITEM_DESCRIPTIONS: array [0..MAX_ITEMS] of string[17] = (
        'TORCH', 'MACHETE', 'BONDCUTTER', 'BONE TOKEN', '', '', '', '', '', '',
        '', '', '', '', '', 'PERUN''S STONE', 'SVAROG''S HAMMER', 'DAZHBOG''S DIAMOND', 'SVIATOVID''S HORN', 'POTION',
        'Night Thorn', 'Blood Harvest', 'Soul Vanquisher', 'Thunderstrike', '', '', '', '', '', '',
        'Wooden shield', 'Iron Stronghold', 'Diamond Seal', '', '', '', '', '', '', '',
        'Bronze stone', 'Perun''s Flash', 'Mokosh''s Tears', '', '', '', '', '', '', '',
        'Stone of Dzivogon', 'Jarovit''s Bedrock', 'Rusalka''s Eye', '', '', '', '', '', '', '',
        'Southern Sun', 'Thunderer', 'Svarog Crown', '', '', '', '', '', '', '',
        'Cloak of Weles', 'Winter Whirlwind', 'Thunderer Armor', '', '', '', '', '', '', '',
        '', '', '', '', '', '', '', '', '', '',
        'Wings of the Wind', 'Wolf Feet', 'Thunderbolt clogs', '', '', '', '', '', ''
    ); { array with item names }

    REVERSE_START_VT52 = #27'p';
    REVERSE_EXIT_VT52  = #27'q';
    REVERSE_START_BOSMAN = #27'S';
    REVERSE_EXIT_BOSMAN = #27'T';
    REVERSE_START_ANSI = #27'[7m';
    REVERSE_EXIT_ANSI = #27'[0m';
    REVERSE_START_ADM31 = #27'G4';
    REVERSE_EXIT_ADM31 = #27'G0';
    REVERSE_START_TIMEX = #27'L';
    REVERSE_EXIT_TIMEX = #27'M';
    REVERSE_NONE = '';

    CLR_VT52    = #27'H'#27'J';
    CLR_BOSMAN  = #27'H'#27'J';
    CLR_ANSI    = #27'c';
    CLR_ADM31   = #27'*'; 
    CLR_TIMEX   = #27'H'#27'J';
    CLR_NONE    = '';