Writeln;
                            Writeln ('The forest seems to stretch across the country, if it wasn''t for the good');
                            Writeln ('weather, the nutritious fruits of the forest, it would be difficult to get');
                            Writeln ('through.');

                            Notify_On_Objects;

                            Writeln ('You can go [N]orth, [S]outh');
                            
                            key_hit := UpCase(ReadKey);
                    
                            case key_hit of
                                'S': begin
                                    current_location := LOCATION_FOREST_3;
                                end;
                                'N': begin
                                    current_location := LOCATION_FOREST_1;
                                end;
                                'G': begin
                                    if Item_Exists(current_location) = TRUE then begin
                                        success := Add_To_Inventory(current_location);
                                    end;
                                end;
            
                            end;

                            Process_Default_Keys(key_hit);
                            previous_location := LOCATION_FOREST_2;