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
  game_won            : boolean;
  success             : boolean;
  hero                : Tplayer;
  monsters            : Tmonsters;
  weapons             : Tweapons;
  armory              : Tarmor;
  key_legal           : boolean;
  target_items_number : byte;
  left_margin         : integer;
  chars_per_line      : integer;
  r_start             : string[4]; { reverse start code }
  r_exit              : string[4]; { reverse exit code }
  s_clrscr            : string[4]; { clear screen code }
  val_result          : integer;

  mystery_solved_5    : boolean;
  mystery_solved_6    : boolean;
  
  location_items   : array [0..MAP_SIZE, 0..MAX_ITEMS_IN_LOCATION] of byte;
  inventory_items  : array [0..MAX_INVENTORY] of byte;
  
{$I READKEY.PAS} { This function is only for Turbo Pascal 3.0 }
{$I CONF.PAS}
{$I PRINT.PAS}
{$I INFO.PAS}
{$I FIGHT.PAS}
{$I INIT.PAS}
{$I INVENTRY.PAS}
{$I DEFKEYS.PAS}

{ Main program}
begin

  Read_Configuration;

  Write(s_clrscr);

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

        Write(s_clrscr);

        if r_start = '' then begin

          WriteLn;
          WriteLn;
          WriteLn;
          Writeln ('                T  A  L  E         ');

        end else begin

          Writeln;
          Writeln ('       ' + r_start + '  ' + r_exit + '     ' + r_start + '     ' + r_exit + '  ' + r_start + '  ' +
                  r_exit + '       ' + r_start + '     ' + r_exit + ' ');
          Writeln ('     ' + r_start + '      ' + r_exit + '  ' + r_start + '  ' + r_exit + '   ' + r_start + '  ' + r_exit + 
                  ' ' + r_start + '  ' + r_exit + '      ' + r_start + '  ' + r_exit + '   ' + r_start + '  ' + r_exit);
          Writeln ('       ' + r_start + '  ' + r_exit + '    ' + r_start + '       ' + r_exit + ' ' + r_start + '  ' + 
                  r_exit + '      ' + r_start + '    ' + r_exit + '   ');
          Writeln ('       ' + r_start + '  ' + r_exit + '    ' + r_start + '  ' + r_exit + '   ' + r_start + '  ' + r_exit + 
                  ' ' + r_start + '  ' + r_exit + '   ' + r_start + '  ' + r_exit + ' ' + r_start + '  ' + r_exit + '   ' + 
                  r_start + '  ' + r_exit);
          Writeln ('        ' + r_start + '   ' + r_exit + '  ' + r_start + '  ' + r_exit + '   ' + r_start + '  ' + r_exit + 
                  '  ' + r_start + '    ' + r_exit + '    ' + r_start + '     ' + r_exit + ' ');
          WriteLn;

        end;
        Writeln ('      O F   A N C I E N T   L A N D');
        Writeln;
        Print_Formatted_Text ('A world where gods walk the earth and ancient monsters lurk in the shadows of every tree.');
        Writeln;
        Print_Formatted_Text ('2025 Blowjobb/New Generation');
        Print_Formatted_Text ('Forever 2025 Party Version');
        Writeln;
        Print_Formatted_Text ('Press [S] to start [Q] to exit to OS.');

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
        game_won := FALSE;
      
        {$I INTRO.PAS }
        
        repeat
        
          case current_location of 

            LOCATION_SACRED_GROVE:
            begin 
            {$I L01.PAS} 
            end;

            LOCATION_ETERNAL_WHISPER:
            begin 
            {$I L02.PAS} 
            end;

            LOCATION_CROSSROADS_OF_THORNS:
            begin 
            {$I L03.PAS} 
            end;

            LOCATION_CLIFF_OF_FORGETFULNESS:
            begin 
            {$I L04.PAS} 
            end;

            LOCATION_TOMB_OF_THE_GODS:
            begin 
            {$I L05.PAS} 
            end;

            LOCATION_FOREST_OF_WHISPERS:
            begin 
            {$I L06.PAS} 
            end;

            LOCATION_STONE_THRESHOLD:
            begin 
            {$I L07.PAS} 
            end;

            LOCATION_SOUNDLESS_PASS:
            begin 
            {$I L08.PAS} 
            end;

            LOCATION_LAKE: 
            begin 
            {$I L09.PAS} 
            end;

            LOCATION_ISLAND:
            begin 
            {$I L10.PAS} 
            end;

            LOCATION_INFINITE_STAIRCASE:
            begin 
            {$I L11.PAS} 
            end;

            LOCATION_CROSSROADS_OF_SHADOWS:
            begin 
            {$I L12.PAS} 
            end;

            LOCATION_GOLDEN_FIELD:
            begin 
            {$I L13.PAS} 
            end;

            LOCATION_BUSHES:
            begin 
            {$I L14.PAS} 
            end;

            LOCATION_START: 
            begin 
            {$I L15.PAS} 
            end;

            LOCATION_MOUND_INSIDE:
            begin 
            {$I L16.PAS} 
            end;

            LOCATION_ECHOES_OF_THE_ANCIENTS:
            begin 
            {$I L17.PAS} 
            end;

            LOCATION_FORGOTTEN_BASIN:
            begin 
            {$I L18.PAS} 
            end;

            LOCATION_FOREST_1:
            begin 
            {$I L19.PAS} 
            end;

            LOCATION_STREAM:
            begin 
            {$I L20.PAS} 
            end;

            LOCATION_CAVE:
            begin 
            {$I L21.PAS} 
            end;

            LOCATION_MOUND:
            begin 
            {$I L22.PAS} 
            end;

            LOCATION_WIND_AND_BONE_PASS:
            begin 
            {$I L23.PAS} 
            end;

            LOCATION_FOREST_2:
            begin 
            {$I L25.PAS} 
            end;

            LOCATION_SPRING:
            begin 
            {$I L26.PAS} 
            end;

            LOCATION_ROCKS:
            begin 
            {$I L27.PAS} 
            end;

            LOCATION_MORANA_CIRCLE:
            begin 
            {$I L28.PAS} 
            end;

            LOCATION_LAKE_OF_SOULS:
            begin 
            {$I L29.PAS} 
            end;

            LOCATION_MELT_SWAMP:
            begin 
            {$I L30.PAS} 
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

            LOCATION_DARK_HARBOUR:
            begin 
            {$I L35.PAS} 
            end;

            LOCATION_BLOODY_ROOTS:
            begin 
            {$I L36.PAS} 
            end;
          
          end;

        until (game_over = TRUE) or (current_state <> STATE_GAME); {* REPEAT THROUGH LOCATIONS *}
        
        current_state := STATE_TITLE;
      
      end;
    
    end; {* CASE GAME STATE *}
  
  until current_state = STATE_EXIT;
  
end.