Writeln;

if Is_In_Inventory(ITEM_PERUNS_STONE) then begin

    Get_Narration (901); 

    hero.defence := hero.defence + 5;
    target_items_number := target_items_number + 1;

    { zabierz kamień peruna }
    Drop_Special_Item(ITEM_PERUNS_STONE);

    Wait_For_key;

end;
if Is_In_Inventory(ITEM_SVAROGS_HAMMER) then begin

    Get_Narration(902);

    hero.attack := hero.attack + 10;
    target_items_number := target_items_number + 1;

    { zabierz młot Swaroga }
    Drop_Special_Item(ITEM_SVAROGS_HAMMER);

    Wait_For_key;

end;
if Is_In_Inventory(ITEM_DAZHBOGS_DIAMOND) then begin

    Get_Narration(903);

    hero.dexterity := hero.dexterity + 5;
    target_items_number := target_items_number + 1;

    { zabierz diament Dadźbboga }
    Drop_Special_Item(ITEM_DAZHBOGS_DIAMOND);

    Wait_For_key;

end;
if (target_items_number = 3) and (Is_In_Inventory(ITEM_SVIATOVIDS_HORN) = FALSE) then begin

    Writeln;
    Get_Narration(904);

end;
if Is_In_Inventory(ITEM_SVIATOVIDS_HORN) then begin

    if (monsters[current_location].hit_points > 0) then begin

        Get_Narration(905);

        Wait_For_key;

        WriteLn;

        Get_Narration(906);

        Pre_Fight('Witch');

    end else begin

        Get_Narration(907);
        Wait_For_key;
        WriteLn;
        Get_Narration(908);
        WriteLn;
        Print_Formatted_Text ('Press any key to title screen.');

        game_won := TRUE;

        current_state := STATE_TITLE;

    end;

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
        'F': begin
            if Is_In_Inventory(ITEM_SVIATOVIDS_HORN) then begin
                Fight;
                key_legal := TRUE;
            end;
        end;

    end;

    Process_Default_Keys(key_hit);

until (key_legal = TRUE) or (game_won = TRUE);

previous_location := LOCATION_START;