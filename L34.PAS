Writeln;
                            Writeln ('A mysterious lake of night and day, whose surface is perfectly smooth,');
                            Writeln ('reflecting the sky like a mirror. On one side of the shore, the water is as');
                            Writeln ('dark as night, and on the other, as bright and clear as morning. It is said');
                            Writeln ('to be the place where the forces of Blackbeard and Whitebeard meet, and an old,');
                            Writeln ('powerful being lurks in the depths, guarding the balance between light and');
                            Writeln ('darkness.');

                            Notify_On_Objects;

                            Writeln;
                            Writeln ('You can go [N]orth, [W]est');                          
                            
                            key_hit := UpCase(ReadKey);
                    
                            case key_hit of
                                'W': begin
                                    current_location := LOCATION_THE_LESHY_VALLEY;
                                end;
                                'N': begin
                                        current_location := LOCATION_MORANA_CIRCLE;
                                    end;
                                'G': begin
                                    if Item_Exists(current_location) = TRUE then begin
                                        success := Add_To_Inventory(current_location);
                                    end;
                                end;
                                
                            end;

                            Process_Default_Keys(key_hit);
                            previous_location := LOCATION_LAKE_NIGHT_DAY;