{function that reads the key pressed. Not present in Turbo Pascal 3.0.}
function ReadKey: char;
var c: char;
begin
    Read(Kbd, c);
    ReadKey := c;
end;