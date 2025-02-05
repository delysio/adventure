Writeln;
Print_Formatted_Text ('A dense mist hovers over the black water, and the ground beneath your feet crests with ' +
                      'every step, as if the mud wants to engulf any intruder.');
Print_Formatted_Text ('The air is saturated with the  smell of rotting plants and dampness, and a bubbling sound ' + 
                      'can be heard in the distance, as if something large is lurking just below the surface.');

if monsters[current_location].hit_points > 0 then begin

  Print_Formatted_Text ('Among the entwined roots and fallen trees, there is suddenly a snarling, inhuman laughter ' +
                        '- it is the King of Drowners, the bruised phantom of the marshes, lurking for unwary ' +
                        'wanderers.');
  Print_Formatted_Text ('Its dead eyes glisten in the gloom and its bony fingers, covered in watery slime, ' +
                        'slowly emerge from the water, ready to drag its next victim into the depths of no return.');

  Pre_Fight ('King of Drowners');

end;

if (monsters[current_location].hit_points = 0) then begin

    Notify_On_Objects;   

end;   

Print_Formatted_Text ('You can go [S]outh');

key_hit := UpCase(ReadKey);

case key_hit of

    'S': begin
      current_location := LOCATION_BLOODY_ROOTS;
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
previous_location := LOCATION_MELT_SWAMP;