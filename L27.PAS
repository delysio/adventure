Writeln;
                            Writeln ('Squeezing between the narrow rocks takes almost an eternity, fortunately');
                            Writeln ('a cave can be seen in the distance.');

                            Notify_On_Objects;

                            Writeln ('You can go [N]orth, [W]est');
                            
                            key_hit := UpCase(ReadKey);
                    
                            case key_hit of
                                
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
                                
                            end;

                            Process_Default_Keys(key_hit);
                            previous_location := LOCATION_ROCKS;