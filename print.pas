{ Prints the given text on the screen, taking into account the left margin, 
  the number of characters in the line and breaks the text }
procedure Print_Formatted_Text (input_text: unformatted_text);
var
    i, j, txt_len: byte;
    txt_word: String[81];
begin

    txt_word := '';
    txt_len := 0;

    for i := 1 to left_margin do Write(' ');

    for i := 1 to Length(input_text) do begin

        txt_word := txt_word + input_text[i];

        if (input_text[i] = ' ') or (i = Length(input_text)) then begin

            if (txt_len + Length(txt_word)) > chars_per_line - left_margin - 1 then begin
            
                WriteLn;

                for j := 0 to left_margin do begin

                    Write(' ');
                    txt_len := 0;

                end;

            end;

            Write(txt_word);
            txt_len := txt_len + Length(txt_word);
            txt_word := '';

        end;

    end;

    WriteLn;

end;