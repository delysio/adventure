Writeln;
                            Writeln ('A green valley where the trees move as if they were alive and the guardians of'); 
                            Writeln ('the forest - the reins - watch the hikers from hiding.');

                            Writeln ('You can go [E]ast');
                            
                            key_hit := ReadKey;
                    
                            case UpCase(key_hit) of
                                'E': begin
                                    current_location := LOCATION_SVAROGS_STONE_CIRCLE;
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
                            previous_location := LOCATION_THE_LESHY_VALLEY;