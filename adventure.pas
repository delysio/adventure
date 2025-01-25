program Adventure;

uses crt;

{$I TYPES.PAS}
{$I CONSTS.PAS}

var 
    current_state    : byte;
    current_location : byte;
    previous_location: byte;
    key_hit          : char;
    game_over        : boolean;
    success          : boolean;
    hero             : Tplayer;
    monsters         : Tmonsters;
    weapons          : Tweapons;
    armory           : Tarmor;
    
    location_items   : array [0..MAP_SIZE, 0..MAX_ITEM_NUMBER] of byte;
    inventory_items  : array [0..MAX_INVENTORY] of byte;
    
{$I READKEY.PAS} { This function is only for Turbo Pascal 3.0 }
{$I INFO.PAS}
{$I FIGHT.PAS}
{$I INIT.PAS}
{$I INVENTRY.PAS}

{ Main program}
begin

    current_state := STATE_TITLE;
  
    repeat 
    
        case current_state of
        
            STATE_TITLE:
            begin
            
                Randomize;
                Init_Monsters;
                Init_Weapons;
                Init_Armory;
                Init_Locations;
                Init_Inventory;
                Init_Hero;
            
                ClrScr;
                Writeln;
                Writeln ('Adventure by NG');
                Writeln;
                Writeln ('Press [S] to start');
                Writeln ('Press [Q] to exit');

                repeat
                
                    key_hit := ReadKey;

                until (key_hit = 'S') or (key_hit = 's') or (key_hit = 'Q') or (key_hit = 'q');

                case key_hit of
                    
                    'S', 's': current_state := STATE_GAME;
                    'Q', 'q': current_state := STATE_EXIT;
                
                end;

            end;
            STATE_GAME:
            begin
                
                current_location := LOCATION_START;
                game_over := FALSE;
            
                Writeln;
                Writeln ('Welcome in game!');
                Writeln;
                Writeln ('Press anytime [X] exit, [I] inventory, [C] weapon statistics');
                
                repeat
                
                    case current_location of 
                    
                        LOCATION_START:
                        begin

                            Writeln;
                            Writeln ('You are in a forest clearing.');

                            if Item_Exists(current_location) = TRUE then begin

                                Notify_On_Objects;

                            end;
                            
                            Writeln ('You can go [N]orth, [E]ast.');
                            
                            key_hit := ReadKey;
                    
                            case key_hit of
                                
                                'N', 'n': begin
                                    current_location := LOCATION_LAKE;
                                end;
                                'E', 'e': begin
                                    current_location := LOCATION_BUSHES;
                                end;
                                'G', 'g': begin
                                    if Item_Exists(current_location) then begin
                                        success := Add_To_Inventory(current_location);
                                    end;
                                end;
                                {$I DEFKEYS.PAS}
            
                            end;
                            previous_location := LOCATION_START;
                            
                        end;
                        
                        LOCATION_LAKE:
                        begin
                            Writeln;
                            Writeln ('You see a lake with a boat next to it. An island is visible to the east.');

                            {current_monster := @monsters[current_location];}
                            
                            if monsters[current_location].hit_points > 0 then begin
                            
                                Writeln;
                                Writeln ('Monster appeared!');
                                Print_Monster_Stats(current_location);
                                Writeln;
                                Writeln ('Press [F] to fight');
                                Writeln;
                            
                            end;

                            if (monsters[current_location].hit_points = 0) and (Item_Exists(current_location) = TRUE) then 
                            begin

                                Notify_On_Objects;

                            end;

                            Writeln ('You can go [S]outh, or sail [E]ast to the island');
                            
                            key_hit := ReadKey;
                    
                            case key_hit of
                                
                                'S', 's': begin
                                    current_location := LOCATION_START;
                                end;
                                'E', 'e': begin
                                    current_location := LOCATION_ISLAND;
                                end;
                                'F', 'f': begin
                                    Fight;
                                end;
                                'G', 'g': begin
                                    if (monsters[current_location].hit_points=0) and (Item_Exists(current_location)=TRUE) then 
                                    begin
                                        success := Add_To_Inventory(current_location);
                                    end;
                                end;
                                {$I DEFKEYS.PAS}
            
                            end;
                        
                            previous_location := LOCATION_LAKE;
                            
                        end;

                        LOCATION_ISLAND:
                        begin

                            Writeln;
                            Writeln ('Paddling hard you reached the island.');

                            if Is_In_Inventory(ITEM_TORCH) = FALSE then begin

                                Writeln ('Darkness, nothing to see here...');

                            end else begin

                                Writeln ('A torch illuminates part of the island.');
                                
                                if Item_Exists(current_location) = TRUE then begin
                                
                                    Notify_On_Objects;

                                end;

                            end;

                            Writeln ('You can go [W]est, back to the lakeshore.');
                            
                            key_hit := ReadKey;
                    
                            case key_hit of

                                'W', 'w': begin
                                    current_location := LOCATION_LAKE;
                                end;
                                'G', 'g': begin
                                    if (Is_In_Inventory(ITEM_TORCH) = TRUE) and (Item_Exists(current_location) = TRUE) then 
                                    begin
                                        success := Add_To_Inventory(current_location);
                                    end;
                                end;
                                {$I DEFKEYS.PAS}
            
                            end;
                            previous_location := LOCATION_ISLAND;
                            
                        end;

                        LOCATION_BUSHES:
                        begin

                            Writeln;
                            Writeln ('Ahead of you is a thicket of bushes');

                            if Is_In_Inventory(ITEM_MACHETE) = FALSE then begin

                                Writeln ('There seems to be no passage here.');
                                Writeln ('The bushes are so dense that you can not go any further...');
                                Writeln ('You can go [W]est');

                            end else begin

                                Writeln ('Using a machete you pave your way through the dense bushes.');
                                Writeln ('The plants grow back quickly, but you manage to get through.');

                                if Item_Exists(current_location) = TRUE then begin

                                    Notify_On_Objects;

                                end;

                                Writeln ('You can go [S]outh or [W]est');

                            end;
                            
                            key_hit := ReadKey;
                    
                            case key_hit of
                                
                                'W', 'w': begin
                                    current_location := LOCATION_START;
                                end;
                                'S', 's': begin
                                    current_location := LOCATION_STREAM;
                                end;
                                'G', 'g': begin
                                    if Item_Exists(current_location) = TRUE then begin
                                        success := Add_To_Inventory(current_location);
                                    end;
                                end;
                                {$I DEFKEYS.PAS}
            
                            end;
                            previous_location := LOCATION_BUSHES;
                            
                        end;
                        LOCATION_STREAM:
                        begin

                            Writeln;
                            Writeln ('A small stream runs through the forest. ');
                            Writeln ('You can go [N]orth');
                            
                            key_hit := ReadKey;
                    
                            case key_hit of
                                
                                'N', 'n': begin
                                    current_location := LOCATION_BUSHES;
                                end;
                                'G', 'g': begin
                                    if Item_Exists(current_location) = TRUE then begin
                                        success := Add_To_Inventory(current_location);
                                    end;
                                end;
                                {$I DEFKEYS.PAS}
            
                            end;
                            previous_location := LOCATION_STREAM;
                            
                        end;
                    
                    end;

                until (game_over = TRUE) or (current_state <> STATE_GAME); {* REPEAT THROUGH LOCATIONS *}
                
                current_state := STATE_TITLE;
            
            end;
        
        end; {* CASE GAME STATE *}
  
    until current_state = STATE_EXIT;
  
end.