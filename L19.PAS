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

                            Writeln ('You can go [E]ast, [N]orth, [S]outh');
                            
                            key_hit := ReadKey;
                    
                            case UpCase(key_hit) of
                                
                                'N': begin
                                    current_location := LOCATION_GOLDEN_FIELD;
                                end;
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
                                'C': begin
                                    Print_Player_Stats;
                                    key_legal := TRUE;
                                end;
                                'I': begin
                                    Print_Inventory;
                                    key_legal := TRUE;
                                end;
                                'P': begin
                                    Drink_Potion;
                                    key_legal := TRUE;
                                end;
                                'X': begin
                                    current_state := STATE_TITLE;
                                    key_legal := TRUE;
                                end;
            
                            end;
                            previous_location := LOCATION_FOREST_1;