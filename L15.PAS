Writeln;

if Is_In_Inventory(ITEM_PERUNS_STONE) then begin

    Print_Formatted_Text ('(Witch) I see you managed to get the Stone of Perun, that''s a big achievement!'); 
    Print_Formatted_Text ('(Witch) I''m taking it away, but in return I''m giving you a reward.');
    Print_Formatted_Text ('(Witch) I cast a spell of defence on you.');
    Print_Formatted_Text ('Your ability to defend yourself increases.');

    hero.defence := hero.defence + 5;
    target_items_number := target_items_number + 1;

    { zabierz kamień peruna }
    Drop_Special_Item(ITEM_PERUNS_STONE);

    Wait_For_key;

end;
if Is_In_Inventory(ITEM_SVAROGS_HAMMER) then begin

    Print_Formatted_Text ('(Witch) Ah, the Svarog''s Hammer. I haven''t seen it for a long time, there''s a ' +
                       'lot of power and magic in it. Leave it with me, it will be safe here. ' +
                       'Meanwhile, I will transfer some of its power to you - your attacks will be stronger!'); 
    Print_Formatted_Text ('You feel the growing strength.');

    hero.attack := hero.attack + 10;
    target_items_number := target_items_number + 1;

    { zabierz młot Swaroga }
    Drop_Special_Item(ITEM_SVAROGS_HAMMER);

    Wait_For_key;

end;
if Is_In_Inventory(ITEM_DAZHBOGS_DIAMOND) then begin

    Print_Formatted_Text ('(Witch) You never cease to amaze me traveller! Until now, no one has managed to ' + 
                       'acquire so many artefacts. I''ll keep the Dazhbogs Diamond with me and ' +
                       'improve your dexterity as a reward.');
    WriteLn;
    Print_Formatted_Text ('You can feel your weapons suddenly becoming lighter and handier.');

    hero.dexterity := hero.dexterity + 5;
    target_items_number := target_items_number + 1;

    { zabierz diament Dadźbboga }
    Drop_Special_Item(ITEM_DAZHBOGS_DIAMOND);

    Wait_For_key;

end;
if (target_items_number = 3) and (Is_In_Inventory(ITEM_SVIATOVIDS_HORN) = FALSE) then begin

    Writeln;
    Print_Formatted_Text ('(Witch) The power of the three artefacts will allow me to open a passage to the spirit ' +
                          'world at the stone threshold. Head there to get the last item that will allow you to ' +
                          'open a portal to Rarog''s abode.');
end;
if Is_In_Inventory(ITEM_SVIATOVIDS_HORN) then begin
    Print_Formatted_Text ('You enter the dark witch''s cottage, clutching the last artefact in your hands. The air ' +
                          'in the chamber smells of herbs, but this time you sense something else in it - something ' + 
                          'heavy, suffocating, like accumulated magic ready to be released.');
    Print_Formatted_Text ('The witch stands by a large stone cauldron, her shadowy eyes gleaming in the dancing ' +
                          'candlelight.');
    Print_Formatted_Text ('(Witch) Great... You don''t know how long I''ve waited for this moment.');
    Print_Formatted_Text ('As you place the horn on the altar, the air around you begins to tremble. All four ' +
                          'artefacts begin to float above the ground, surrounded by a spiral of black energy.');

    Wait_For_key;

    Print_Formatted_Text ('(Witch) Rarog! It was just a myth, silly. I needed someone to find those treasures for me, ' + 
                          'and you played your part perfectly.');
    Print_Formatted_Text ('You take a step back, feeling the magic fill the room. The witch hovers above the ground, ' + 
                          'her body seeming to change - her skin fades, her eyes light up like two white lanterns.');
    Print_Formatted_Text ('(Witch) Now, with the power of these artefacts, I will not open any portal, but will use ' +
                          'it to create my own kingdom. The power over this land will belong to me!');
end;

if (Is_In_Inventory(ITEM_SVIATOVIDS_HORN) = FALSE) then begin

    Get_Narration(current_location);
    Notify_On_Objects;

    Print_Formatted_Text ('You can go [N]orth, [W]est.');

end;

repeat

    key_legal := FALSE;
    key_hit := UpCase(ReadKey);

    case key_hit of
        
        'N': begin
            current_location := LOCATION_LAKE;
            key_legal := TRUE;
        end;
        'W': begin
            current_location := LOCATION_BUSHES;
            key_legal := TRUE;
        end;
        'G': begin
            if Item_Exists then begin
                success := Add_To_Inventory(current_location);
                key_legal := TRUE;
            end;
        end;

    end;

    Process_Default_Keys(key_hit);

until key_legal = TRUE;

previous_location := LOCATION_START;