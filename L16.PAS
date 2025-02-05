Writeln;
Print_Formatted_Text ('Narrow stone corridors lead to a subterranean chamber where the air is heavy with the ' + 
                      'smell of mustiness and ancient sacrifices.');
Print_Formatted_Text ('The walls are covered with frescoes depicting battles and rituals, and in ' +
                      'the centre of the room stands a stone sarcophagus, surrounded by flickering flames.');

if monsters[current_location].hit_points > 0 then begin

  Pre_Fight ('Night Preacher');

end;

if (monsters[current_location].hit_points = 0) then begin

  Print_Formatted_Text ('As the Night Preacher crumbles into dust and his last scream dies away, the chamber fills ' +
                        'with glee. On the walls, frescoes begin to flicker, revealing the history of those who ' +
                        'rest here.');

  if Is_In_Inventory(ITEM_TORCH) then begin

    Print_Formatted_Text ('Shining your torch, you noticed that a dark breach had opened up among the tangled ' + 
                          'roots and weathered boulders - a tunnel whose interior seemed to absorb the light.');
    Print_Formatted_Text ('A cold, damp breeze wafted from within, carrying the smell of mustiness and something ' +
                          'unnamed... something waiting for the daredevil ready to cross the threshold of an ' +
                          'unknown world.');

    Notify_On_Objects;

    Print_Formatted_Text ('You can go [S]outh, [E]ast');

  end else begin

    Notify_On_Objects;

    Print_Formatted_Text ('You can go [S]outh');

  end;                   

  

end;

key_hit := UpCase(ReadKey);

case key_hit of

    'E': begin
      if Is_In_Inventory(ITEM_TORCH) then begin
        current_location := LOCATION_ECHOES_OF_THE_ANCIENTS;
      end;
    end;
    'S': begin
      current_location := LOCATION_MOUND;
    end;
    'F': begin
      Fight;
    end;
    'G': begin
      if (Item_Exists = TRUE) and (monsters[current_location].hit_points = 0) then begin
        success := Add_To_Inventory(current_location);
      end;
    end;
    
end;

Process_Default_Keys(key_hit);
previous_location := LOCATION_MOUND_INSIDE;