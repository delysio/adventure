Writeln;
                            Writeln ('It is a place of worship, where the stone blocks arranged in a circle radiate');
                            Writeln ('warmth and sparks of divine fire float above them at night.');

                            if monsters[current_location].hit_points > 0 then begin
                            
                                Writeln;
                                Writeln ('Leshy appeared!');
                                Print_Monster_Stats(current_location);
                                Writeln;
                                Writeln ('Press [F] to fight');
                                Writeln;
                            
                            end;

                            if (monsters[current_location].hit_points = 0) then begin

                                Writeln ('The monster''s corpse sprawled across the stone circles revealing a passage');
                                Writeln ('into the valley revealed a passage between them');
                                Notify_On_Objects;
                                Writeln ('You can go [E]ast or [W]est');

                            end else begin

                                Writeln ('You can go [E]ast');

                            end;
                            
                            key_hit := ReadKey;
                    
                            case UpCase(key_hit) of
                                'E': begin
                                    current_location := LOCATION_FOREST_3;
                                end;
                                'W': begin
                                    current_location := THE_LESHY_VALLEY;
                                end;
                                'F': begin
                                    Fight;
                                end;
                                'G': begin
                                    if Item_Exists(current_location) = TRUE then begin
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
                            previous_location := SVAROGS_STONE_CIRCLE;