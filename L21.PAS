Writeln;
                            Writeln ('The cave is dark, you can barely see what is going on inside.');

                            if Is_In_Inventory(ITEM_TORCH) then begin

                                Writeln ('You light a torch and admire the engravings on the rocks of people paying');
                                Writeln ('homage to Perun.');

                                Notify_On_Objects;

                            end;

                            Writeln ('You can go [S]outh');
                            
                            key_hit := ReadKey;
                    
                            case Upcase(key_hit) of
                                
                                'S': begin
                                    current_location := LOCATION_ROCKS;
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
                            previous_location := LOCATION_CAVE;