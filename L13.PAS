                            Writeln;
                            Writeln ('In front of you is a field of ripe grain, whose ears sway like a golden wave');
                            Writeln ('in the wind, hiding in its thicket the secrets of ancient rituals and the ');
                            Writeln ('whispers of the spirits of the crop''s guardians.');

                            Notify_On_Objects;

                            Writeln ('You can go [N]orth, [S]outh');
                            
                            key_hit := UpCase(ReadKey);
                    
                            case key_hit of

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
            
                            end;

                            Process_Default_Keys(key_hit);
                            previous_location := LOCATION_GOLDEN_FIELD;