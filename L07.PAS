                            Writeln;
                            Writeln ('A narrow path leads to a stone threshold, beyond which stretches a dense, damp'); 
                            Writeln ('forest. The stones are covered in moss and runes that glimmer in the moonlight,'); 
                            Writeln ('and the air is heavy with the scent of earth and flowering herbs. It is said');
                            Writeln ('to be the place where Jarylo, the god of spring and youth, crosses the');
                            Writeln ('boundary between the world of the living and the spirit world.');

                            Notify_On_Objects;

                            Writeln ('You can go [N]orth, [S]outh');
                            
                            key_hit := UpCase(ReadKey);
                    
                            case key_hit of

                                'N': begin
                                    current_location := LOCATION_SACRED_GROVE;
                                end;
                                'S': begin
                                    current_location := LOCATION_GOLDEN_FIELD;
                                end;
                                'G': begin
                                    if Item_Exists(current_location) = TRUE then begin
                                        success := Add_To_Inventory(current_location);
                                    end;
                                end;
                                            
                            end;

                            Process_Default_Keys(key_hit);
                            previous_location := LOCATION_STONE_THRESHOLD;