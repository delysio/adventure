Writeln;
                            Writeln ('Ahead of you is a thicket of bushes. The surrounding marshes are full of ');
                            Writeln ('mist and treacherous paths. You can hear the quiet chirps of the russets ');
                            Writeln ('as they try to lure you into the refuse.');

                            if Is_In_Inventory(ITEM_MACHETE) = FALSE then begin

                                Writeln ('There seems to be no passage here.');
                                Writeln ('The bushes are so dense that you can''t go any further...');
                                Writeln ('You can go [E]est');

                            end else begin

                                Writeln ('Using a machete you pave your way through the dense bushes.');
                                Writeln ('The plants grow back quickly, but you manage to get through.');

                                Notify_On_Objects;

                                Writeln ('You can go [S]outh or [E]ast');

                            end;
                            
                            key_hit := ReadKey;
                    
                            case UpCase(key_hit) of
                                
                                'E': begin
                                    current_location := LOCATION_START;
                                end;
                                'S': begin
                                    if Is_In_Inventory(ITEM_MACHETE) then begin
                                        current_location := LOCATION_STREAM;
                                    end;
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
                            previous_location := LOCATION_BUSHES;