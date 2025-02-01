program Adventure;

uses crt;

{$I TYPES.PAS}
{$I CONSTS.PAS}

var 
  current_state       : byte;
  current_location    : byte;
  previous_location   : byte;
  key_hit             : char;
  game_over           : boolean;
  success             : boolean;
  hero                : Tplayer;
  monsters            : Tmonsters;
  weapons             : Tweapons;
  armory              : Tarmor;
  key_legal           : boolean;
  target_items_number : byte;
  left_margin         : byte;
  chars_per_line      : byte;
  concated_text       : string[80];
  reverse_start_code  : string[3];
  reverse_exit_code   : string[3];
  
  location_items   : array [0..MAP_SIZE, 0..MAX_ITEMS_IN_LOCATION] of byte;
  inventory_items  : array [0..MAX_INVENTORY] of byte;
  
{$I READKEY.PAS} { This function is only for Turbo Pascal 3.0 }
{$I PRINT.PAS}
{$I INFO.PAS}
{$I FIGHT.PAS}
{$I INIT.PAS}
{$I INVENTRY.PAS}
{$I DEFKEYS.PAS}

{ Main program}
begin

  ClrScr;
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
  Writeln ('    [6] 64 characters');
  Writeln ('    [8] 80 characters');

  repeat

    key_hit := ReadKey;

  until (key_hit = '6') or (key_hit = '8');

  case key_hit of

    '6': chars_per_line := 63;
    '8': chars_per_line := 79;
  
  end;

  current_state := STATE_TITLE;
  
  repeat 
  
    case current_state of
    
      STATE_TITLE:
      begin
      
        Randomize;
        Init_Monsters;
        Init_Weapons;
        Init_Armory;
        Init_Locations;
        Init_Inventory;
        Init_Hero;
      
        ClrScr;
        Writeln;
        Print_Formatted_Text (REVERSE_START_VT52 + 'A Tale of Ancient Land' + REVERSE_EXIT_VT52);
        Writeln;
        Print_Formatted_Text ('A world where gods walk the earth and ancient monsters lurk in the shadows of every tree.');
        Writeln;
        Print_Formatted_Text ('Press ' + REVERSE_START_VT52 + '[S]' + REVERSE_EXIT_VT52 +' to start' +
                              ' '+ REVERSE_START_VT52 + '[Q]' + REVERSE_EXIT_VT52 +' to exit to OS.');

        repeat
        
          key_hit := Upcase(ReadKey);

        until (key_hit = 'S') or (key_hit = 'Q');

        case key_hit of
          
          'S': current_state := STATE_GAME;
          'Q': current_state := STATE_EXIT;
        
        end;

      end;

      STATE_GAME:
      begin
        
        current_location := LOCATION_START;
        game_over := FALSE;
      
        {$I INTRO.PAS }
        
        repeat
        
          case current_location of 
          
            LOCATION_START:
            begin
            
            {$I L15.PAS}
              
            end;
            
            LOCATION_LAKE:
            begin
              
            {$I L09.PAS}
              
            end;

            LOCATION_ISLAND:
            begin

            {$I L10.PAS}
              
            end;

            LOCATION_SACRED_GROVE:

            begin

            {$I L01.PAS}

            end;

            LOCATION_STONE_THRESHOLD:
            begin

            {$I L07.PAS}
              
            end;

            LOCATION_GOLDEN_FIELD:
            begin

            {$I L13.PAS}
              
            end;

            LOCATION_BUSHES:
            begin

            {$I L14.PAS}
              
            end;

            LOCATION_STREAM:
            begin

            {$I L20.PAS}
              
            end;

            LOCATION_SPRING:
            begin

            {$I L26.PAS}
              
            end;

            LOCATION_FOREST_1:
            begin

            {$I L19.PAS}
              
            end;

            LOCATION_FOREST_2:
            begin

            {$I L25.PAS}
              
            end;

            LOCATION_MORANA_CIRCLE:
            begin

            {$I L28.PAS}
              
            end;

            LOCATION_FOREST_3:
            begin

            {$I L31.PAS}
              
            end;

            LOCATION_SVAROGS_STONE_CIRCLE:
            begin

            {$I L32.PAS}
              
            end;

            LOCATION_THE_LESHY_VALLEY:
            begin

            {$I L33.PAS}
              
            end;

            LOCATION_LAKE_NIGHT_DAY:
            begin

            {$I L34.PAS}
              
            end;

            LOCATION_ROCKS:
            begin

            {$I L27.PAS}
              
            end;

            LOCATION_CAVE:
            begin

            {$I L21.PAS}
              
            end;
          
          end;

        until (game_over = TRUE) or (current_state <> STATE_GAME); {* REPEAT THROUGH LOCATIONS *}
        
        current_state := STATE_TITLE;
      
      end;
    
    end; {* CASE GAME STATE *}
  
  until current_state = STATE_EXIT;
  
end.