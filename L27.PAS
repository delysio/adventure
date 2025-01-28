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
                            previous_location := LOCATION_ROCKS;