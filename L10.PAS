Writeln;
                            Writeln ('Paddling hard you reached the island.');
                            Writeln ('A mysterious darkness has shrouded the entire island.');

                            if Is_In_Inventory(ITEM_TORCH) = FALSE then begin

                                Writeln ('With absolutely nothing visible, it is better not to explore it in the dark.');

                            end else begin

                                Write ('It''s fortunate that you have a torch with you, which allows you ');
                                Writeln ('to at least look around.');
                                Notify_On_Objects;

                            end;

                            Writeln ('You can go [W]est, back to the lakeshore.');
                            
                            key_hit := UpCase(ReadKey);
                    
                            case key_hit of

                                'W': begin
                                    current_location := LOCATION_LAKE;
                                end;
                                'G': begin
                                    if (Is_In_Inventory(ITEM_TORCH) = TRUE) and (Item_Exists(current_location) = TRUE) then 
                                    begin
                                        success := Add_To_Inventory(current_location);
                                    end;
                                end;
                                
            
                            end;

                            Process_Default_Keys(key_hit);
                            previous_location := LOCATION_ISLAND;