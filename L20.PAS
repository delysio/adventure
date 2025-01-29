Writeln;
                            Writeln ('A narrow stream meandering between the rocks whispers soothingly. The');
                            Writeln ('water is crystal clear, and you can see the glittering stones at its bottom.');

                            Notify_On_Objects;

                            Writeln ('You can go [N]orth, [S]outh, [W]est');
                            
                            key_hit := ReadKey;
                    
                            case UpCase(key_hit) of

                                'N': begin
                                    current_location := LOCATION_BUSHES;
                                end;
                                'S': begin
                                    current_location := LOCATION_SPRING;
                                end;
                                'W': begin
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
                            previous_location := LOCATION_STREAM;