Writeln;
Get_Narration(current_location);
Get_Narration(301);
Get_Narration(302);
Get_Narration(303);

Notify_On_Objects;

Writeln;
Print_Formatted_Text ('You can go [E]ast or take the path [1][2][3]');

repeat

  key_legal := FALSE;
  key_hit := UpCase(ReadKey);

  case key_hit of
    '1': begin
      Writeln;
      Print_Formatted_Text ('You walk ahead, listening to the gentle sound of the wind that seems to guide you ' +
                          'forward. Your steps echo, though the ground beneath your feet is soft and quiet.');
      Print_Formatted_Text ('Before you have time to turn back, the mist engulfs you completely and the world ' +
                          'around you blurs into darkness. When you regain your orientation, you are once again ' +
                          'standing in front of the Stone Threshold.');
      current_location := LOCATION_STONE_THRESHOLD;
      key_legal := TRUE;
    end;
    '2': begin
      current_location := LOCATION_CLIFF_OF_FORGETFULNESS;
      key_legal := TRUE;
    end;
    '3': begin
      Writeln;
      Print_Formatted_Text ('A gentle light in the distance pulses softly, twinkling like a star in the gloom. ' +
                          'With each step it seems to get closer and closer and an unexpected relief ' +
                          'sprouts in your heart - as if you instinctively know that this is the right path.');
      Print_Formatted_Text ('Suddenly, the ground beneath your feet begins to yield and the air thickens like ' +
                          'thick smoke. The glow bursts into thousands of tiny lights that swirl around you ' +
                          'like swarms of insects.');
      Print_Formatted_Text ('Before you have time to step back, you feel a burning sting on your skin - ' +
                          'it is not the light, but the Skylights of Darkness, hungry creatures that ' +
                          'suck the strength and life out of you.');

      Writeln;
      Print_Formatted_Text ('You are dead. Press [X] twice to exit to title screen.');

      while KeyPressed do key_hit := ReadKey;
      key_hit := ReadKey;  
      game_over := true;
        
    end;
    'E': begin
      current_location := LOCATION_ETERNAL_WHISPER;
      key_legal := TRUE;
    end;
    'G': begin
      if Item_Exists = TRUE then begin
        success := Add_To_Inventory(current_location);
        key_legal := TRUE;
      end;
    end;

  end;

  Process_Default_Keys(key_hit);

until key_legal = TRUE;

previous_location := LOCATION_CROSSROADS_OF_THORNS;