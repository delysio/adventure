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
                        
                            previous_location := LOCATION_LAKE;