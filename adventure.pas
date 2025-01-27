program Adventure;

uses crt;

{$I TYPES.PAS}
{$I CONSTS.PAS}

var 
    current_state       : byte;
    current_location    : byte;
    previous_location   : byte;
    key_hit             : char;
    game_over           : boolean;
    success             : boolean;
    hero                : Tplayer;
    monsters            : Tmonsters;
    weapons             : Tweapons;
    armory              : Tarmor;
    key_legal           : boolean;
    target_items_number : byte;
    index               : byte;
    
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
                Writeln ('Press [S] to start, [Q] to exit to OS.');

                repeat
                
                    key_hit := Upcase(ReadKey);

                until (key_hit = 'S') or (key_hit = 'Q');

                case key_hit of
                    
                    'S': current_state := STATE_GAME;
                    'Q': current_state := STATE_EXIT;
                
                end;

            end;

            STATE_GAME:
            begin
                
                current_location := LOCATION_START;
                game_over := FALSE;
            
                {$I INTRO.PAS }
                
                repeat
                
                    case current_location of 
                    
                        LOCATION_START:
                        begin

                            Writeln;

                            if Is_In_Inventory(ITEM_PERUNS_STONE) then begin

                                Write ('(Witch) I see you managed to get the Stone of Perun, ');
                                Writeln ('that''s a big achievement!'); 
                                Writeln ('(Witch) I''m taking it away, but in return I''m giving you a reward.');
                                Write ('(Witch) I cast a spell of defence on you. ');
                                Writeln ('Your ability to defend yourself increases.');

                                hero.defence := hero.defence + 5;
                                target_items_number := target_items_number + 1;

                                { zabierz kamień peruna }
                                for index := 0 to MAX_INVENTORY do begin
                                    if inventory_items[index] = ITEM_PERUNS_STONE then begin
                                        inventory_items[index] := ITEM_NONE; 
                                        Organise_Item_Array;
                                    end;
                                end;

                            end;

                            Writeln ('You are in a forest clearing next to a witch''s hut.');

                            Notify_On_Objects;
                            
                            Writeln ('You can go [N]orth, [W]est.');

                            key_hit := ReadKey;

                            case UpCase(key_hit) of
                                
                                'N': begin
                                    current_location := LOCATION_LAKE;
                                end;
                                'W': begin
                                    current_location := LOCATION_BUSHES;
                                end;
                                'G': begin
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
                                Writeln ('Drowner appeared!');
                                Print_Monster_Stats(current_location);
                                Writeln;
                                Writeln ('Press [F] to fight');
                                Writeln;
                            
                            end;

                            if monsters[current_location].hit_points = 0 then Notify_On_Objects;

                            Writeln ('You can go [S]outh, or sail [E]ast to the island');
                            
                            key_hit := ReadKey;
                    
                            case UpCase(key_hit) of
                                
                                'S': begin
                                    current_location := LOCATION_START;
                                end;
                                'E': begin
                                    current_location := LOCATION_ISLAND;
                                end;
                                'F': begin
                                    Fight;
                                end;
                                'G': begin
                                    if (monsters[current_location].hit_points=0) and (Item_Exists(current_location)=TRUE) 
                                    then 
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
                            Writeln ('A mysterious darkness has shrouded the entire island.');

                            if Is_In_Inventory(ITEM_TORCH) = FALSE then begin

                                Writeln ('With absolutely nothing visible, it is better not to explore it in the dark.');

                            end else begin

                                Write ('It''s fortunate that you have a torch with you, which allows you ');
                                Writeln ('to at least look around.');
                                Notify_On_Objects;

                            end;

                            Writeln ('You can go [W]est, back to the lakeshore.');
                            
                            key_hit := ReadKey;
                    
                            case UpCase(key_hit) of

                                'W': begin
                                    current_location := LOCATION_LAKE;
                                end;
                                'G': begin
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
                            Writeln ('Ahead of you is a thicket of bushes. The surrounding marshes are full of ');
                            Writeln ('mist and treacherous paths. You can hear the quiet chirps of the russets ');
                            Writeln ('as they try to lure you into the refuse.');

                            if Is_In_Inventory(ITEM_MACHETE) = FALSE then begin

                                Writeln ('There seems to be no passage here.');
                                Writeln ('The bushes are so dense that you can''t go any further...');
                                Writeln ('You can go [E]est');

                            end else begin

                                Writeln ('Using a machete you pave your way through the dense bushes.');
                                Writeln ('The plants grow back quickly, but you manage to get through.');

                                Notify_On_Objects;

                                Writeln ('You can go [S]outh or [E]ast');

                            end;
                            
                            key_hit := ReadKey;
                    
                            case UpCase(key_hit) of
                                
                                'E': begin
                                    current_location := LOCATION_START;
                                end;
                                'S': begin
                                    if Is_In_Inventory(ITEM_MACHETE) then begin
                                        current_location := LOCATION_STREAM;
                                    end;
                                end;
                                'G': begin
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
                            Writeln ('A narrow stream meandering between the rocks whispers soothingly. The');
                            Writeln ('water is crystal clear, and you can see the glittering stones at its bottom.');

                            Notify_On_Objects;

                            Writeln ('You can go [N]orth, [S]outh, [E]ast');
                            
                            key_hit := ReadKey;
                    
                            case UpCase(key_hit) of

                                'N': begin
                                    current_location := LOCATION_BUSHES;
                                end;
                                'S': begin
                                    current_location := LOCATION_SPRING;
                                end;
                                'E': begin
                                    current_location := LOCATION_FOREST_1;
                                end;
                                'G': begin
                                    if Item_Exists(current_location) = TRUE then begin
                                        success := Add_To_Inventory(current_location);
                                    end;
                                end;
                                {$I DEFKEYS.PAS}
            
                            end;
                            previous_location := LOCATION_STREAM;
                            
                        end;

                        LOCATION_SPRING:
                        begin

                            Writeln;
                            Writeln ('You see a rock from which a stream of water flows. The sun shines brightly');
                            Writeln ('and the wind carries the scent of flowers.');

                            if monsters[current_location].hit_points > 0 then begin
                            
                                Writeln;
                                Writeln ('Striga appeared!');
                                Print_Monster_Stats(current_location);
                                Writeln;
                                Writeln ('Press [F] to fight');
                                Writeln;
                            
                            end;

                            if (monsters[current_location].hit_points = 0) then begin

                                Writeln ('The defeated striga fell on the rocks and, splitting them open, ');
                                Writeln ('revealed a passage between them');
                                Notify_On_Objects;
                                Writeln ('You can go [N]orth or [E]ast');

                            end else begin

                                Writeln ('You can go [N]orth');

                            end;
                            
                            key_hit := ReadKey;
                    
                            case UpCase(key_hit) of
                                
                                'N': begin
                                    current_location := LOCATION_STREAM;
                                end;
                                'E': begin
                                    if (monsters[current_location].hit_points = 0) then begin
                                        current_location := LOCATION_ROCKS;
                                    end;
                                end;
                                'F': begin
                                    Fight;
                                end;
                                'G': begin
                                    if (monsters[current_location].hit_points=0) and (Item_Exists(current_location)=TRUE) 
                                    then begin
                                        success := Add_To_Inventory(current_location);
                                    end;
                                end;
                                {$I DEFKEYS.PAS}
            
                            end;
                            previous_location := LOCATION_SPRING;
                            
                        end;

                        LOCATION_FOREST_1:
                        begin

                            Writeln;
                            Writeln ('The dark forest surrounds you on almost all sides. You hear wolves howling');
                            Writeln ('and leaves rustling.');

                            if monsters[current_location].hit_points > 0 then begin
                            
                                Writeln;
                                Writeln ('Bies appeared!');
                                Print_Monster_Stats(current_location);
                                Writeln;
                                Writeln ('Press [F] to fight');
                                Writeln;
                            
                            end;

                            if (monsters[current_location].hit_points = 0) then begin

                                Notify_On_Objects;

                            end;

                            Writeln ('You can go [E]ast, [S]outh');
                            
                            key_hit := ReadKey;
                    
                            case UpCase(key_hit) of
                                
                                'E': begin
                                    current_location := LOCATION_STREAM;
                                end;
                                'S': begin
                                    current_location := LOCATION_FOREST_2;
                                end;
                                'F': begin
                                    Fight;
                                end;
                                'G': begin
                                    if (monsters[current_location].hit_points=0) and (Item_Exists(current_location)=TRUE) 
                                    then begin
                                        success := Add_To_Inventory(current_location);
                                    end;
                                end;
                                {$I DEFKEYS.PAS}
            
                            end;
                            previous_location := LOCATION_FOREST_1;
                            
                        end;

                        LOCATION_FOREST_2:
                        begin

                            Writeln;
                            Writeln ('The forest seems to stretch across the country, if it wasn''t for the good');
                            Writeln ('weather, the nutritious fruits of the forest, it would be difficult to get');
                            Writeln ('through.');

                            Notify_On_Objects;

                            Writeln ('You can go [N]orth');
                            
                            key_hit := ReadKey;
                    
                            case UpCase(key_hit) of

                                'N': begin
                                    current_location := LOCATION_FOREST_1;
                                end;
                                'G': begin
                                    if Item_Exists(current_location) = TRUE then begin
                                        success := Add_To_Inventory(current_location);
                                    end;
                                end;
                                {$I DEFKEYS.PAS}
            
                            end;
                            previous_location := LOCATION_FOREST_2;
                            
                        end;

                        LOCATION_ROCKS:
                        begin

                            Writeln;
                            Writeln ('Squeezing between the narrow rocks takes almost an eternity, fortunately');
                            Writeln ('a cave can be seen in the distance.');

                            Notify_On_Objects;

                            Writeln ('You can go [N]orth, [W]est');
                            
                            key_hit := ReadKey;
                    
                            case UpCase(key_hit) of
                                
                                'W': begin
                                    current_location := LOCATION_SPRING;
                                end;
                                'N': begin
                                    current_location := LOCATION_CAVE;
                                end;
                                'G': begin
                                    if Item_Exists(current_location) = TRUE then begin
                                        success := Add_To_Inventory(current_location);
                                    end;
                                end;
                                {$I DEFKEYS.PAS}
            
                            end;
                            previous_location := LOCATION_ROCKS;
                            
                        end;

                        LOCATION_CAVE:
                        begin

                            Writeln;
                            Writeln ('The cave is dark, you can barely see what is going on inside.');

                            if Is_In_Inventory(ITEM_TORCH) then begin

                                Writeln ('You light a torch and admire the engravings on the rocks of people paying');
                                Writeln ('homage to Perun.');

                                Notify_On_Objects;

                            end;

                            Writeln ('You can go [S]outh');
                            
                            key_hit := ReadKey;
                    
                            case Upcase(key_hit) of
                                
                                'S': begin
                                    current_location := LOCATION_ROCKS;
                                end;
                                'G': begin
                                    if Item_Exists(current_location) = TRUE then begin
                                        success := Add_To_Inventory(current_location);
                                    end;
                                end;
                                {$I DEFKEYS.PAS}
            
                            end;
                            previous_location := LOCATION_CAVE;
                            
                        end;
                    
                    end;

                until (game_over = TRUE) or (current_state <> STATE_GAME); {* REPEAT THROUGH LOCATIONS *}
                
                current_state := STATE_TITLE;
            
            end;
        
        end; {* CASE GAME STATE *}
  
    until current_state = STATE_EXIT;
  
end.