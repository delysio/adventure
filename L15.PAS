                            Writeln;

                            if Is_In_Inventory(ITEM_PERUNS_STONE) then begin

                                Write ('(Witch) I see you managed to get the Stone of Perun, ');
                                Writeln ('that''s a big achievement!'); 
                                Writeln ('(Witch) I''m taking it away, but in return I''m giving you a reward.');
                                Write ('(Witch) I cast a spell of defence on you. ');
                                Writeln ('Your ability to defend yourself increases.');

                                hero.defence := hero.defence + 5;
                                target_items_number := target_items_number + 1;

                                { zabierz kamień peruna }
                                for index := 0 to MAX_INVENTORY do begin
                                    if inventory_items[index] = ITEM_PERUNS_STONE then begin
                                        inventory_items[index] := ITEM_NONE; 
                                        Organise_Item_Array;
                                    end;
                                end;

                            end;

                            Writeln ('You are in a forest clearing next to a witch''s hut.');

                            Notify_On_Objects;
                            
                            Writeln ('You can go [N]orth, [W]est.');

                            key_hit := ReadKey;

                            case UpCase(key_hit) of
                                
                                'N': begin
                                    current_location := LOCATION_LAKE;
                                end;
                                'W': begin
                                    current_location := LOCATION_BUSHES;
                                end;
                                'G': begin
                                    if Item_Exists(current_location) then begin
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

                            previous_location := LOCATION_START;