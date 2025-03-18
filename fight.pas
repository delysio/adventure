{ Handling the player's battles with monsters }
procedure Fight;
var 
    damage: integer;
    chance: integer;
    attack_type: integer;
    attack_success: boolean;
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

        Writeln;
        Print_Formatted_Text ('Select attack type:');
        Print_Formatted_Text ('[1] Charge, [2] Defensive');

        repeat

            key_hit := UpCase(ReadKey);
                
            case key_hit of 
            
                '1': begin
                
                    Writeln;
                    Print_Formatted_Text ('You attack with fury!');
                    attack_type := ATTACK_CHARGE;
                
                end;
                '2': begin
                
                    Writeln;
                    Print_Formatted_Text ('You attack');
                    attack_type := ATTACK_DEFENSIVE;
                
                end;
            
            end;

        until (key_hit = '1') or (key_hit = '2');
    
        { Player attack }

        if attack_type = ATTACK_CHARGE then begin

            chance := Random(5);

            if chance = 4 then begin

                damage := hero.attack + armory.weapon + armory.weapon_slot; 

                monsters[current_location].hit_points := monsters[current_location].hit_points - damage;
                Str(damage, tmp_string);
                Print_Formatted_Text ('Your hit: ' + tmp_string);

            end else begin

                damage := 0;
                Print_Formatted_Text ('Monster dodged your charge attack');

            end;

        end else begin

            damage := Random(hero.attack) + armory.weapon + armory.weapon_slot + Random(hero.dexterity);
            damage := damage - Random(monsters[current_location].defence);
            
            if damage <= 0 then begin

                Print_Formatted_Text ('Monster dodged your attack');
            
            end else begin
            
                monsters[current_location].hit_points := monsters[current_location].hit_points - damage;
                Str(damage, tmp_string);
                Print_Formatted_Text ('Your hit: ' + tmp_string);
                
            end;

        end;
        
        { Monster attack }
        
        if monsters[current_location].hit_points > 0 then begin

            if (attack_type = ATTACK_CHARGE) and (chance < 5) then begin

                damage := monsters[current_location].attack;

                hero.hit_points := hero.hit_points - damage;
                Str(damage, tmp_string);
                Print_Formatted_Text ('The monster took advantage of your failed charge and hits you: ' + tmp_string);

            end else begin
        
                damage := Random(monsters[current_location].attack) - Random(hero.defence) - armory.shield; 
                damage := damage - armory.shield_slot - armory.head - armory.body - armory.boots;
                
                if damage <= 0 then begin
                
                    Print_Formatted_Text ('You have blocked a monster attack');
                
                end else begin
                
                    hero.hit_points := hero.hit_points - damage;
                    Str(damage, tmp_string);
                    Print_Formatted_Text ('Monster hits you: ' + tmp_string);
                
                end;

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