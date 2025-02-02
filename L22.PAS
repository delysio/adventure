Writeln;
Print_Formatted_Text ('A huge earthen mound, overgrown with grass and flowers, hides the graves of ancient warriors ' + 
                      'inside. Wooden totems, carved with images of the gods, stand around the barrow, and echoes ' +
                      'of ancient battle songs can be heard at night.');
Print_Formatted_Text ('It is said that anyone who dares to go inside will be tested by the spirits of the ancestors.');

Notify_On_Objects;

Print_Formatted_Text ('You can go [N]orth, [S]outh');

key_hit := UpCase(ReadKey);

case key_hit of
    
    'N': begin
        current_location := LOCATION_MOUND_INSIDE;
    end;
    'S': begin
        current_location := LOCATION_MORANA_CIRCLE;
    end;
    'G': begin
        if Item_Exists(current_location) = TRUE then begin
            success := Add_To_Inventory(current_location);
        end;
    end;
    
end;

Process_Default_Keys(key_hit);
previous_location := LOCATION_MOUND;