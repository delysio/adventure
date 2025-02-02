{}
procedure Read_Configuration;
var
  file_var: Text;
  file_name: string[14];
  s_left_margin: string[1];
  s_chars_per_line: string[2];

begin

  file_name := 'ADVCONF.DAT';

  Assign (file_var, file_name);
  Reset (file_var);
  Readln (file_var, s_left_margin);
  Readln (file_var, s_chars_per_line);
  Readln (file_var, r_start);
  Readln (file_var, r_exit);

  Val (s_left_margin, left_margin, val_result);
  Val (s_chars_per_line, chars_per_line, val_result);

  Close (file_var);

end;