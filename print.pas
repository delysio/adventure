procedure Print_Padded_Text(left_margin, chars_per_line: Integer; input_text: String);
var
    i, j, txt_len: Integer;
    txt_word, txt_line: String;
begin
    txt_line := '';
    txt_word := '';
    txt_len := 0;

    for i := 1 to left_margin do Write(' ');

    for i := 1 to Length(input_text) do begin

        txt_word := txt_word + input_text[i];

        if (input_text[i] = ' ') or (i = Length(input_text)) then begin

            if (txt_len + Length(txt_word)) > chars_per_line - left_margin then begin
            
                WriteLn;

                for j := 1 to left_margin do begin

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