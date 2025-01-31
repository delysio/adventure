                Writeln;
                Writeln ('It is a place of worship, where the stone blocks arranged in a circle radiate');
                Writeln ('warmth and sparks of divine fire float above them at night.');

                if monsters[current_location].hit_points > 0 then begin
                
                    Pre_Fight ('Leshy');
                
                end;

                if (monsters[current_location].hit_points = 0) then begin

                    Writeln ('The Leshy''s corpse sprawled across the stone circles revealing a passage');
                    Writeln ('into the valley revealed a passage between them');
                    Notify_On_Objects;
                    Writeln ('You can go [E]ast or [N]orth');

                end else begin

                    Writeln ('You can go [E]ast');

                end;
                
                key_hit := UpCase(ReadKey);
        
                case key_hit of
                    'E': begin
                        current_location := LOCATION_THE_LESHY_VALLEY;
                    end;
                    'N': begin
                        current_location := LOCATION_SPRING;
                    end;
                    'F': begin
                        Fight;
                    end;
                    'G': begin
                        if (Item_Exists(current_location) = TRUE) and (monsters[current_location].hit_points = 0) then begin
                            success := Add_To_Inventory(current_location);
                        end;
                    end;
                    
                end;

                Process_Default_Keys(key_hit);
                previous_location := LOCATION_SVAROGS_STONE_CIRCLE;