                            Writeln;
                            Writeln ('In front of you is a field of ripe grain, whose ears sway like a golden wave');
                            Writeln ('in the wind, hiding in its thicket the secrets of ancient rituals and the ');
                            Writeln ('whispers of the spirits of the crop''s guardians.');

                            Notify_On_Objects;

                            Writeln ('You can go [N]orth, [S]outh');
                            
                            key_hit := ReadKey;
                    
                            case UpCase(key_hit) of

                                'N': begin
                                    current_location := LOCATION_STONE_THRESHOLD;
                                end;
                                'S': begin
                                    current_location := LOCATION_FOREST_1;
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
                            previous_location := LOCATION_GOLDEN_FIELD;