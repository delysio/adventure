program Hello;

uses crt;

type 
    Tplayer = record
        hit_points  : smallint;
        defence     : byte;
        attack      : byte;
        dexterity   : byte;
    end;

    Tmonster = record
        hit_points  : smallint;
        defence     : byte;
        attack      : byte;
        dexterity   : byte;
    end;
    
    Tmonsters = array of Tmonster;
    
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
        id          : byte;
        kind        : byte;
        modifier    : byte;
    end;

const

    MAP_SIZE = 36;

    STATE_TITLE = 1;
    STATE_GAME  = 2;
    STATE_EXIT  = 3;
    
    LOCATION_LAKE   =  9;
    LOCATION_ISLAND = 10;
    LOCATION_START  = 15;
    
    STARTING_HIT_POINTS = 2;
    STARTING_DEFENCE    = 0;
    STARTING_ATTACK     = 5;
    STARTING_DEXTERITY  = 1;

var 
    current_state    : byte = STATE_TITLE;
    current_location : byte;
    previous_location: byte;
    key_hit          : char;
    game_over        : boolean = FALSE;
    user_exit        : boolean = FALSE;
    hero             : Tplayer;
    monster_3        : Tmonster;
    monster_9        : Tmonster;
    monsters         : Tmonsters;
    armory           : Tarmor;
    current_monster  : ^Tmonster;
    
    location_items   : array [0..MAP_SIZE-1] of boolean;
    
    dagger           : Titem;
    
    

procedure Print_Hero_Stats;
var 
    str_1, str_2, str_3: string;
    hit_points: byte;
    defence: byte;
    attack: byte;
    
begin
    
    hit_points := hero.hit_points;
    defence    := hero.defence;
    attack     := hero.attack + armory.weapon;
    
    Str(hit_points, str_1);
    Str(hero.defence, str_2);
    Str(attack, str_3);
    Writeln ('Hero stats: HP ' + str_1 + ', DEF ' + str_2 + ', ATT ' + str_3);
    
end;


procedure Print_Monster_Stats(monster_id: byte);
var str_1, str_2: string;
begin
    Str(monsters[monster_id].hit_points, str_1);
    Str(monsters[monster_id].defence, str_2);
    Writeln ('Monster stats: HP ' + str_1 + ', DEF ' + str_2);
end;


{ Handling the player's battles with monsters }
procedure Fight;
var 
    damage_dealt: byte;
    str_1: string;
    player_run: boolean = FALSE;
begin
    Writeln('Fighting!');
    Writeln;
    
    repeat 
    
        { Player attack }
        
        current_monster := @monsters[current_location];
    
        damage_dealt := Random(hero.attack) + armory.weapon + armory.weapon_slot - Random(current_monster^.defence);
        
        if damage_dealt <= 0 then begin

            Writeln ('Monster dodged');
        
        end else begin
        
            current_monster^.hit_points := current_monster^.hit_points - damage_dealt;
            Str(damage_dealt, str_1);
            Writeln ('Your hit: ', str_1);
            
        end;
        
        { Monster attack }
        
        if current_monster^.hit_points > 0 then begin
        
            damage_dealt := Random(current_monster^.attack) - Random(hero.defence) - armory.shield - armory.shield_slot - armory.head - armory.body - armory.gloves - armory.boots;
            
            if damage_dealt <= 0 then begin
            
                Writeln ('Monster missed...');
            
            end else begin
            
                hero.hit_points := hero.hit_points - damage_dealt;
                Str(damage_dealt, str_1);
                Writeln ('Monster hit: ', str_1);
            
            end;
        
        end else begin

            Writeln ('Monster is dead.');

        end;

        Writeln;

        if (current_monster^.hit_points > 0) and (hero.hit_points > 0) then begin
        
            Writeln ('Continue [F]ighting or [R]un away');
            
            key_hit := ReadKey;
            
            case key_hit of 
            
                'R', 'r': begin
                
                    Writeln ('You ran...');
                    player_run := TRUE;
                    current_location := previous_location;
                
                end;
            
            end;

        end;
    
    until (hero.hit_points <= 0) or (current_monster^.hit_points <= 0) or (player_run = TRUE);

    if hero.hit_points <= 0 then begin
        
        Writeln ('Monster killed you.');
        Writeln;
        Writeln ('Game over.');
        Writeln;
        Writeln ('Press any key to return to title screen.');

        repeat until KeyPressed;

        game_over := TRUE;
        
    end;
    
end;


{ Initialisation of monster characteristics }
procedure Init_Monsters;
begin
    SetLength(monsters, 36);
    
    monsters[9].hit_points := 9;
    monsters[9].defence := 0;
    monsters[9].attack := 3;
    monsters[9].dexterity := 0;
    
    monsters[3].hit_points := 9;
    monsters[3].defence := 0;
    monsters[3].attack := 3;
    monsters[3].dexterity := 0;
end;


procedure Init_Armory;
begin

    armory.weapon := 0;
    armory.shield := 0;
    armory.weapon_slot := 0;
    armory.shield_slot := 0;
    armory.head := 0;
    armory.body := 0;
    armory.gloves := 0;
    armory.boots := 0;
    
end;

procedure Init_Items;
begin

    dagger.id := 1;
    dagger.kind := 0;
    dagger.modifier := 1;

end;


procedure Init_Locations;
var
    i: byte;
begin

    for i := 0 to MAP_SIZE-1 do begin

        location_items[i] := TRUE;

    end;

end;


procedure Add_To_Inventory(item: Titem);
begin

    case item.kind of
    
         0..9: armory.weapon := armory.weapon + item.modifier;
       10..19: armory.shield := armory.shield + item.modifier;
       20..29: armory.weapon_slot := armory.weapon_slot + item.modifier;
       30..39: armory.shield_slot := armory.shield_slot + item.modifier;
       40..49: armory.head := armory.head + item.modifier;
       50..59: armory.body := armory.body + item.modifier;
       60..69: armory.gloves := armory.gloves + item.modifier;
       70..79: armory.boots := armory.boots + item.modifier;
    
    end;

end;

begin
  
    repeat 
    
        case current_state of
        
            STATE_TITLE:
            begin
            
                Randomize;
                Init_Monsters;
                Init_Items;
                Init_Armory;
                Init_Locations;
            
                ClrScr;
                Writeln;
                Writeln ('Adventure by NG');
                Writeln;
                Writeln ('Press [S] to start');
                Writeln ('Press [Q] to exit');
                
                key_hit := ReadKey;
                
                case key_hit of
                
                    'S', 's': begin
                        current_state := STATE_GAME;
                    end;
                    'Q', 'q': begin
                        current_state := STATE_EXIT;
                    end;
                
                end;

            end;
            STATE_GAME:
            begin
            
                hero.hit_points := STARTING_HIT_POINTS;
                hero.defence := STARTING_DEFENCE;
                hero.attack  := STARTING_ATTACK;
                hero.dexterity := STARTING_DEXTERITY;
            
                current_location := LOCATION_START;
            
                Writeln;
                Writeln ('Welcome in game!');
                Writeln;
                Writeln ('Press [X] anytime to exit');
                
                repeat
                
                    case current_location of 
                    
                        LOCATION_START:
                        begin

                            Writeln;
                            Print_Hero_Stats;
                            Writeln ('This is starting location.');
                            
                            if location_items[current_location] = TRUE then begin

                                Writeln ('There is a item.');

                            end;
                            
                            Write ('You can go [N]orth, [E]ast');

                            if location_items[current_location] = TRUE then begin

                                Writeln (' or [G]et item');

                            end;
                            
                            key_hit := ReadKey;
                    
                            case key_hit of
                                'X', 'x': begin
                                    current_state := STATE_TITLE;
                                end;
                                'N', 'n': begin
                                    current_location := LOCATION_LAKE;
                                end;
                                'G', 'g': begin
                                    if location_items[current_location] = TRUE then begin
                                        Add_To_Inventory(dagger);
                                        location_items[LOCATION_START] := FALSE;
                                    end;
                                end;
                                'E', 'e': begin
                                end;
            
                            end;
                            previous_location := LOCATION_START;
                            
                        end;
                        
                        
                        LOCATION_LAKE:
                        begin
                            Writeln;
                            Print_Hero_Stats;
                            Writeln ('This is lake.');
                            
                            if monsters[current_location].hit_points > 0 then begin
                            
                                Writeln ('Monster appeared!');
                                Print_Monster_Stats(current_location);
                            
                            end;
                            
                            Writeln ('You can [F]ight or go [S]outh, [E]est');
                            
                            key_hit := ReadKey;
                    
                            case key_hit of
                            
                                'F', 'f': begin
                                    Fight;
                                end;
                                'X', 'x': begin
                                    current_state := STATE_TITLE;
                                end;
                                'S', 's': begin
                                    current_location := LOCATION_START;
                                end;
                                'E', 'e': begin
                                    current_location := LOCATION_ISLAND;
                                end;
            
                            end;
                        
                            previous_location := LOCATION_LAKE;
                            
                        end;


                        LOCATION_ISLAND:
                        begin

                            Writeln;
                            Print_Hero_Stats;
                            Writeln ('This is island');
                            
                            Write ('You can go [W]est');
                            
                            key_hit := ReadKey;
                    
                            case key_hit of
                                'X', 'x': begin
                                    current_state := STATE_TITLE;
                                end;
                                'W', 'w': begin
                                    current_location := LOCATION_LAKE;
                                end;
                                'G', 'g': begin

                                end;
            
                            end;
                            previous_location := LOCATION_ISLAND;
                            
                        end;
                    
                    end;

                until (game_over = TRUE) or (current_state <> STATE_GAME);
                
                current_state := STATE_TITLE;
            
            end;
        
        end;
  
    until current_state = STATE_EXIT;
  
end.