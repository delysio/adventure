                            Writeln;
                            Writeln ('A peaceful forest clearing, surrounded by tall pine trees whose tops seem to');
                            Writeln ('touch the sky. In its very centre stands a wooden chapel, carved with images'); 
                            Writeln ('of guardian deities and spirits, and a small eternal sacrificial fire burns');
                            Writeln ('in front of it');

                            if monsters[current_location].hit_points > 0 then begin
                            
                                Writeln;
                                Writeln ('Planetnik appeared!');
                                Print_Monster_Stats(current_location);
                                Writeln;
                                Writeln ('Press [F] to fight');
                                Writeln;
                            
                            end;

                            if (monsters[current_location].hit_points = 0) then begin

                                Notify_On_Objects;

                            end;

                            Writeln ('You can go [S]outh');
                            
                            key_hit := ReadKey;
                    
                            case UpCase(key_hit) of

                                'S': begin
                                    current_location := LOCATION_STONE_THRESHOLD;
                                end;
                                'F': begin
                                    Fight;
                                end;
                                'G': begin
                                    if (monsters[current_location].hit_points=0) and (Item_Exists(current_location)=TRUE) 
                                    then begin
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
                            previous_location := LOCATION_SACRED_GROVE;