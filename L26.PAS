Writeln;
                            Writeln ('You see a rock from which a stream of water flows. The sun shines brightly');
                            Writeln ('and the wind carries the scent of flowers.');

                            if monsters[current_location].hit_points > 0 then begin
                            
                                Writeln;
                                Writeln ('Striga appeared!');
                                Print_Monster_Stats(current_location);
                                Writeln;
                                Writeln ('Press [F] to fight');
                                Writeln;
                            
                            end;

                            if (monsters[current_location].hit_points = 0) then begin

                                Writeln ('The defeated striga fell on the rocks and, splitting them open, ');
                                Writeln ('revealed a passage between them');
                                Notify_On_Objects;
                                Writeln ('You can go [N]orth or [E]ast');

                            end else begin

                                Writeln ('You can go [N]orth');

                            end;
                            
                            key_hit := UpCase(ReadKey);
                    
                            case key_hit of
                                
                                'N': begin
                                    current_location := LOCATION_STREAM;
                                end;
                                'E': begin
                                    if (monsters[current_location].hit_points = 0) then begin
                                        current_location := LOCATION_ROCKS;
                                    end;
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
                                
                            end;

                            Process_Default_Keys(key_hit);
                            previous_location := LOCATION_SPRING;