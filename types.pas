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
        dexterity   : byte;
    end;

    Tarmor = record
        weapon      : byte;
        weapon_name : string[13];
        weapon_id   : byte;
        shield      : byte;
        shield_name : string[13];
        shield_id   : byte;
        weapon_slot : byte;
        weapon_slot_name : string[13];
        weapon_slot_id : byte;
        shield_slot : byte;
        shield_slot_name : string[13];
        shield_slot_id : byte;
        head        : byte;
        head_name   : string[13];
        head_id : byte;
        body        : byte;
        body_name   : string[13];
        body_id : byte;
        gloves      : byte;
        gloves_name : string[13];
        gloves_id : byte;
        boots       : byte;
        boots_name  : string[13];
        boots_id : byte;
    end;
    
    Titem = record
        id          : byte;         { ID is used to name the object }
        kind        : byte;         { kind }
        modifier    : byte;         { How many bonus points it adds }
    end;

    Tmonsters = array[0..36] of Tmonster;
    Tweapons  = array[0..99] of Titem;