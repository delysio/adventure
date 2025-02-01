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

end;
if Is_In_Inventory(ITEM_SVAROGS_HAMMER) then begin

    Print_Formatted_Text ('(Witch) Ah, the Svarog''s Hammer. I haven''t seen it for a long time, there''s a ' +
                       'lot of power and magic in it. Leave it with me, it will be safe here. ' +
                       'Meanwhile, I will transfer some of its power to you - your attacks will be stronger!'); 
    Print_Formatted_Text ('You feel the growing strength.');

    hero.attack := hero.attack + 5;
    target_items_number := target_items_number + 1;

    { zabierz młot Swaroga }
    Drop_Special_Item(ITEM_SVAROGS_HAMMER);

end;
if Is_In_Inventory(ITEM_DAZHBOGS_DIAMOND) then begin

    Print_Formatted_Text ('(Witch) You never cease to amaze me traveller! Until now, no one has managed to ' + 
                       'acquire so many artefacts. I''ll keep the Dadagod Diamond with me and ' +
                       'improve your dexterity as a reward.');
    Print_Formatted_Text ('You can feel your weapons suddenly becoming lighter and handier.');

    hero.dexterity := hero.dexterity + 5;
    target_items_number := target_items_number + 1;

    { zabierz diament Dadźbboga }
    Drop_Special_Item(ITEM_DAZHBOGS_DIAMOND);

end;

Print_Formatted_Text ('You are in a forest clearing next to a witch''s hut.');

Notify_On_Objects;

Print_Formatted_Text ('You can go [N]orth, [W]est.');

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