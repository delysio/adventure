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
    end;

    Tarmor = record
        weapon      : byte;
        weapon_name : string[17];
        weapon_id   : byte;
        shield      : byte;
        shield_name : string[17];
        shield_id   : byte;
        weapon_slot : byte;
        weapon_slot_name : string[17];
        weapon_slot_id : byte;
        shield_slot : byte;
        shield_slot_name : string[17];
        shield_slot_id : byte;
        head        : byte;
        head_name   : string[17];
        head_id : byte;
        body        : byte;
        body_name   : string[17];
        body_id : byte;
        boots       : byte;
        boots_name  : string[17];
        boots_id : byte;
    end;
    
    Titem = record
        id          : byte;         { ID is used to name the object }
        kind        : byte;         { kind }
        modifier    : byte;         { How many bonus points it adds }
    end;

    monster_name = string[16];

    Tmonsters = array[0..36] of Tmonster;
    Tweapons  = array[0..99] of Titem;

    unformatted_text = String[255];