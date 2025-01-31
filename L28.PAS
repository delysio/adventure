Writeln;
Writeln ('In the middle of the abandoned village stands an ancient circle of stones,');
Writeln ('covered in moss and runes. In the centre of the circle lies a statue of');
Writeln ('Morana, the goddess of winter and death, surrounded by frozen flowers.');
Writeln ('It is said that anyone who disturbs the tranquillity of this place will');
Writeln ('suffer the curse of eternal cold.');

if monsters[current_location].hit_points > 0 then begin

    Pre_Fight ('Morana');

end;

if (monsters[current_location].hit_points = 0) then begin

    Writeln ('As the last echoes of the battle fell silent, the statue of Morana cracked');
    Writeln ('and a glow of warm spring light emerged. Frozen flowers bloomed and the stone');
    Writeln ('circle began to lose its gloomy aura. The smell of fresh earth and hope wafted');
    Writeln ('through the air, and the voice of the goddess, though faint, whispered:');
    Writeln ('You have overcome winter, but remember that spring is always born from its end.');
    Notify_On_Objects;
    Writeln ('You can go [S]outh');

end else begin

    Writeln ('You can go [S]outh');

end;

key_hit := UpCase(ReadKey);

case key_hit of
    'S': begin
        current_location := LOCATION_LAKE_NIGHT_DAY;
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
previous_location := LOCATION_MORANA_CIRCLE;