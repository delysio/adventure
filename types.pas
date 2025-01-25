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
        shield      : byte;
        shield_name : string[13];
        weapon_slot : byte;
        weapon_slot_name : string[13];
        shield_slot : byte;
        shield_slot_name : string[13];
        head        : byte;
        head_name   : string[13];
        body        : byte;
        body_name   : string[13];
        gloves      : byte;
        gloves_name : string[13];
        boots       : byte;
        boots_name  : string[13];
    end;
    
    Titem = record
        id          : byte;         { ID is used to name the object }
        kind        : byte;         { kind }
        modifier    : byte;         { How many bonus points it adds }
    end;

    Tmonsters = array[0..36] of Tmonster;
    Tweapons  = array[0..99] of Titem;