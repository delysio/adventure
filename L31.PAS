Writeln;
                            Writeln ('As you traverse one scrubland after another, you realise that this is a dense,');
                            Writeln ('ancient forest where trees whisper prayers to the gods and the souls of dead');
                            Writeln ('warriors hide in the roots.');

                            Notify_On_Objects;

                            Writeln ('You can go [N]orth, [E]ast');
                            
                            key_hit := ReadKey;
                    
                            case UpCase(key_hit) of
                                'E': begin
                                    current_location := SVAROGS_STONE_CIRCLE;
                                end;
                                'N': begin
                                    current_location := LOCATION_FOREST_2;
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
                            previous_location := LOCATION_FOREST_3;