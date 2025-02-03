{ Handling the player's battles with monsters }
procedure Fight;
var 
    damage: integer;
    player_run: boolean;
    tmp_string: string[3];
begin

    {current_monster := @monsters[current_location];}

    player_run := FALSE;

    if monsters[current_location].hit_points <= 0 then exit;

    Writeln;
    Print_Formatted_Text ('Fighting!');
    Writeln;
    
    repeat 

        Print_Hero_Stats;
        Print_Monster_Stats(current_location);
    
        { Player attack }

        damage := Random(hero.attack) + armory.weapon + armory.weapon_slot + Random(hero.dexterity);
        damage := damage - Random(monsters[current_location].defence);
        
        if damage <= 0 then begin

            Print_Formatted_Text ('Monster dodged your attack');
        
        end else begin
        
            monsters[current_location].hit_points := monsters[current_location].hit_points - damage;
            Str(damage, tmp_string);
            Print_Formatted_Text ('Your hit: ' + tmp_string);
            
        end;
        
        { Monster attack }
        
        if monsters[current_location].hit_points > 0 then begin
        
            damage := Random(monsters[current_location].attack) - Random(hero.defence) - armory.shield; 
            damage := damage - armory.shield_slot - armory.head - armory.body - armory.gloves - armory.boots;
            
            if damage <= 0 then begin
            
                Print_Formatted_Text ('You have blocked a monster attack');
            
            end else begin
            
                hero.hit_points := hero.hit_points - damage;
                Str(damage, tmp_string);
                Print_Formatted_Text ('Monster hits you: ' + tmp_string);
            
            end;
        
        end else begin

            Print_Formatted_Text ('Monster is dead.');
            monsters[current_location].hit_points := 0;

        end;

        Writeln;

        if (monsters[current_location].hit_points > 0) and (hero.hit_points > 0) then begin
        
            Print_Formatted_Text ('Continue [F]ighting or [R]un away');
            Writeln;
            
            repeat

                key_hit := UpCase(ReadKey);
                
                case key_hit of 
                
                    'R': begin
                    
                        Print_Formatted_Text ('You ran...');
                        player_run := TRUE;
                        current_location := previous_location;
                    
                    end;
                
                end;

            until (key_hit = 'R') or (key_hit = 'F')

        end;
    
    until (hero.hit_points <= 0) or (monsters[current_location].hit_points <= 0) or (player_run = TRUE);

    if hero.hit_points <= 0 then begin
        
        Print_Formatted_Text ('Monster killed you.');
        Writeln;
        Print_Formatted_Text ('Game over.');
        Writeln;
        Print_Formatted_Text ('Press any key to return to title screen.');

        repeat until KeyPressed;

        game_over := TRUE;
        
    end;
    
end;