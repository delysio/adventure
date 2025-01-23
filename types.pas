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
    
    Tmonsters = array[0..36] of Tmonster;
    
    Tarmor = record
        weapon      : byte;
        shield      : byte;
        weapon_slot : byte;
        shield_slot : byte;
        head        : byte;
        body        : byte;
        gloves      : byte;
        boots       : byte;
    end;
    
    Titem = record
        id          : byte;         { ID is used to name the object }
        kind        : byte;         { kind }
        modifier    : byte;         { How many bonus points it adds }
    end;