Program Configuration;

uses crt;

var
    key_hit             : char;
    left_margin         : byte;
    chars_per_line      : byte;
    r_start             : string[4]; { reverse start code }
    r_exit              : string[4]; { reverse exit code }

const
    REVERSE_START_VT52 = #27'p';
    REVERSE_EXIT_VT52  = #27'q';
    REVERSE_START_BOSMAN = #27'S';
    REVERSE_EXIT_BOSMAN = #27'T';
    REVERSE_START_ANSI = #27'[7m';
    REVERSE_EXIT_ANSI = #27'[0m';

{$I READKEY.PAS}

{}
procedure Configure;
var
  file_var: Text;
  file_name: string[14];

begin

  Writeln ('    Welcome to the game configuration.');
  WriteLn;
  Writeln ('    Look at your monitor and select the appropriate left');
  WriteLn ('    margin setting.');
  Writeln ('[0] 0');
  Writeln (' [1] 1');
  Writeln ('  [2] 2');
  Writeln ('   [3] 3');
  Writeln ('    [4] 4');

  repeat

    key_hit := ReadKey;

  until (key_hit = '0') or (key_hit = '1') or (key_hit = '2') or (key_hit = '3') or (key_hit = '4');

  case key_hit of

    '0': left_margin := 0;
    '1': left_margin := 1;
    '2': left_margin := 2;
    '3': left_margin := 3;
    '4': left_margin := 4;
  
  end;

  WriteLn;

  Writeln ('    How many characters per line does your terminal display?');
  Writeln ('    [5] 51 characters');
  Writeln ('    [6] 64 characters');
  Writeln ('    [8] 80 characters');

  repeat

    key_hit := ReadKey;

  until (key_hit = '5') or (key_hit = '6') or (key_hit = '8');

  case key_hit of

    '5': chars_per_line := 50;
    '6': chars_per_line := 63;
    '8': chars_per_line := 79;
  
  end;

  WriteLn;
  Writeln ('    Select the number next to the characters displayed');
  Writeln ('    in reverse video');
  Writeln ('    [1] ' + REVERSE_START_VT52 + 'reverse' + REVERSE_EXIT_VT52 + 
           ', [2] ' + REVERSE_START_BOSMAN + 'reverse' + REVERSE_EXIT_BOSMAN +
           ', [3] ' + REVERSE_START_ANSI + 'reverse' + REVERSE_EXIT_ANSI);

  repeat

    key_hit := ReadKey;

  until (key_hit = '1') or (key_hit = '2') or (key_hit = '3');

  case key_hit of

    '1': begin r_start := REVERSE_START_VT52; r_exit := REVERSE_EXIT_VT52; end;
    '2': begin r_start := REVERSE_START_BOSMAN; r_exit := REVERSE_EXIT_BOSMAN; end;
    '3': begin r_start := REVERSE_START_ANSI; r_exit := REVERSE_EXIT_ANSI; end;
  
  end;

  file_name := 'ADVCONF.DAT';

  Assign (file_var, file_name);
  Reset (file_var);
  Rewrite (file_var);
  Writeln (file_var, left_margin);
  Writeln (file_var, chars_per_line);
  Writeln (file_var, r_start);
  Writeln (file_var, r_exit);
  Close (file_var);

  Writeln;
  Writeln ('Configuration saved.');
  Writeln;

end;

begin

    Configure;

end.