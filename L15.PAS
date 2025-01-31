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
                                Drop_Special_Item(ITEM_PERUNS_STONE);

                            end;
                            if Is_In_Inventory(ITEM_SVAROGS_HAMMER) then begin

                                Writeln ('(Witch) Ah, the Svarog''s Hammer. I haven''t seen it for a long time, there''s a');
                                Writeln ('(Witch) lot of power and magic in it. Leave it with me, it will be safe here.');
                                Writeln ('(Witch) Meanwhile, I will transfer some of its power to you - your attacks will');
                                Writeln ('(Witch) be stronger!'); 
                                Writeln ('You feel the growing strength.');

                                hero.attack := hero.attack + 5;
                                target_items_number := target_items_number + 1;

                                { zabierz młot Swaroga }
                                Drop_Special_Item(ITEM_SVAROGS_HAMMER);

                            end;
                            if Is_In_Inventory(ITEM_DAZHBOGS_DIAMOND) then begin

                                Writeln ('(Witch) You never cease to amaze me traveller! Until now, no one has managed to'); 
                                Writeln ('(Witch) acquire so many artefacts. I''ll keep the Dadagod Diamond with me and');
                                Writeln ('(Witch) improve your dexterity as a reward.');
                                Writeln ('You can feel your weapons suddenly becoming lighter and handier.');

                                hero.dexterity := hero.dexterity + 5;
                                target_items_number := target_items_number + 1;

                                { zabierz diament Dadźbboga }
                                Drop_Special_Item(ITEM_DAZHBOGS_DIAMOND);

                            end;

                            Writeln ('You are in a forest clearing next to a witch''s hut.');

                            Notify_On_Objects;
                            
                            Writeln ('You can go [N]orth, [W]est.');

                            key_hit := UpCase(ReadKey);

                            case key_hit of
                                
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
            
                            end;

                            Process_Default_Keys(key_hit);
                            previous_location := LOCATION_START;