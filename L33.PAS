Writeln;
                            Writeln ('A green valley where the trees move as if they were alive. A dense forest');
                            Writeln ('surrounds you on all sides, and the trees seem to live a life of their own.');
                            Writeln ('Their tangled branches form an impenetrable, magical barrier, whispering in');
                            Writeln ('an unknown language. The air is heavy with moisture and the smell of moss,');
                            Writeln ('and the ominous hiss of wolves can be heard in the distance.');

                            if Is_In_Inventory(ITEM_BONDCUTTER) then begin

                                Writeln ('All it took was a few cuts with the magic saw to open the way for'); 
                                Writeln ('further travel');
                                Writeln;
                                Writeln ('You can go [E]ast, [W]est')

                            end else begin

                                Writeln ('It takes a magical act to move on.');
                                Writeln ('You can go [E]ast')

                            end;
                            
                            
                            key_hit := UpCase(ReadKey);
                    
                            case key_hit of
                                'E': begin
                                    if Is_In_Inventory(ITEM_BONDCUTTER) then begin
                                        current_location := LOCATION_SVAROGS_STONE_CIRCLE;
                                    end;
                                end;
                                'W': begin
                                        current_location := LOCATION_SVAROGS_STONE_CIRCLE;
                                    end;
                                end;
                                'G': begin
                                    if Item_Exists(current_location) = TRUE then begin
                                        success := Add_To_Inventory(current_location);
                                    end;
                                end;
                                
                            end;

                            Process_Default_Keys(key_hit);
                            previous_location := LOCATION_THE_LESHY_VALLEY;