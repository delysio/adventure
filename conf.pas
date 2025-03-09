{ Reads stored configuration }
procedure Read_Configuration;
var
  file_var: Text;
  s_left_margin: string[1];
  s_chars_per_line: string[2];
  
const
  FILE_NAME = 'ADVCONF.DAT';

begin

  Assign (file_var, FILE_NAME);

  {$I-}

  Reset (file_var);

  {$I+}

  if IOresult <> 0 then begin

    Writeln;
    Writeln ('Configuration file doesn''t exist.');
    Writeln ('Run game configuration app first!');
    Writeln;
    halt;

  end;

  Readln (file_var, s_left_margin);
  Readln (file_var, s_chars_per_line);
  Readln (file_var, r_start);
  Readln (file_var, r_exit);
  Readln (file_var, s_clrscr);

  Val (s_left_margin, left_margin, val_result);
  Val (s_chars_per_line, chars_per_line, val_result);

  Close (file_var);

end;