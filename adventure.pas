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
  left_margin         : integer;
  chars_per_line      : integer;
  concated_text       : string[80];
  r_start             : string[4]; { reverse start code }
  r_exit              : string[4]; { reverse exit code }
  val_result          : integer;
  
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

  ClrScr;
  
  Read_Configuration;

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
        Print_Formatted_Text (r_start + 'A Tale of Ancient Land' + r_exit);
        Writeln;
        Print_Formatted_Text ('A world where gods walk the earth and ancient monsters lurk in the shadows of every tree.');
        Writeln;
        Print_Formatted_Text ('Press [S] ' +
                              'to start [Q]' + r_exit +' to exit to OS.');

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
        
        current_location := LOCATION_MOUND;
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

            LOCATION_MOUND_INSIDE:
            begin

            {$I L16.PAS}
              
            end;

            LOCATION_STREAM:
            begin

            {$I L20.PAS}
              
            end;

            LOCATION_MOUND:
            begin

            {$I L22.PAS}

            end;

            LOCATION_WIND_AND_BONE_PASS:
            begin

            {$I L23.PAS}

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

            LOCATION_LAKE_OF_SOULS:
            begin

            {$I L29.PAS}
              
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