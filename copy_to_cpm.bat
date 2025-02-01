@echo off

set GAME_PATH=f:\!_emulacja\AtariXE\Scene\_Moje\adventure
set CPM_PATH=f:\!_emulacja\CPM\CPM-20230921T170351Z-001\CPM\H\3
set CPMFS_PATH=f:\!_emulacja\CPM\run-cpm22
set REPLACE_FILE=%CPM_PATH%\ADV.PAS

echo Copying files...

copy %GAME_PATH%\adventure.pas %CPM_PATH%\ADV.PAS
copy %GAME_PATH%\consts.pas %CPM_PATH%\CONSTS.PAS
copy %GAME_PATH%\fight.pas %CPM_PATH%\FIGHT.PAS
copy %GAME_PATH%\info.pas %CPM_PATH%\INFO.PAS
copy %GAME_PATH%\init.pas %CPM_PATH%\INIT.PAS
copy %GAME_PATH%\inventry.pas %CPM_PATH%\INVENTRY.PAS
copy %GAME_PATH%\intro.pas %CPM_PATH%\INTRO.PAS
copy %GAME_PATH%\types.pas %CPM_PATH%\TYPES.PAS
copy %GAME_PATH%\defkeys.pas %CPM_PATH%\DEFKEYS.PAS
copy %GAME_PATH%\print.pas %CPM_PATH%\PRINT.PAS
copy %GAME_PATH%\l01.pas %CPM_PATH%\L01.PAS
copy %GAME_PATH%\l07.pas %CPM_PATH%\L07.PAS
copy %GAME_PATH%\l09.pas %CPM_PATH%\L09.PAS
copy %GAME_PATH%\l10.pas %CPM_PATH%\L10.PAS
copy %GAME_PATH%\l13.pas %CPM_PATH%\L13.PAS
copy %GAME_PATH%\l14.pas %CPM_PATH%\L14.PAS
copy %GAME_PATH%\l15.pas %CPM_PATH%\L15.PAS
copy %GAME_PATH%\l19.pas %CPM_PATH%\L19.PAS
copy %GAME_PATH%\l20.pas %CPM_PATH%\L20.PAS
copy %GAME_PATH%\l21.pas %CPM_PATH%\L21.PAS
copy %GAME_PATH%\l25.pas %CPM_PATH%\L25.PAS
copy %GAME_PATH%\l26.pas %CPM_PATH%\L26.PAS
copy %GAME_PATH%\l27.pas %CPM_PATH%\L27.PAS
copy %GAME_PATH%\l28.pas %CPM_PATH%\L28.PAS
copy %GAME_PATH%\l31.pas %CPM_PATH%\L31.PAS
copy %GAME_PATH%\l32.pas %CPM_PATH%\L32.PAS
copy %GAME_PATH%\l33.pas %CPM_PATH%\L33.PAS
copy %GAME_PATH%\l34.pas %CPM_PATH%\L34.PAS

echo disabling use crt from main files

powershell -Command "(Get-Content %REPLACE_FILE%) -replace 'uses crt;', '{X-}' | Set-Content %REPLACE_FILE%"

echo Deleting old files from dsk image

%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA ADV.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA CONSTS.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA FIGHT.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA INFO.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA INIT.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA INVENTRY.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA INTRO.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA TYPES.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA READKEY.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA DEFKEYS.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA PRINT.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA ADV.COM
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA L01.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA L07.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA L09.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA L10.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA L13.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA L14.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA L15.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA L19.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA L20.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA L21.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA L25.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA L26.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA L27.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA L28.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA L31.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA L32.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA L33.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk ERA L34.PAS

echo Writing updated files to dsk image

%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\ADV.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\CONSTS.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\FIGHT.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\INFO.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\INIT.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\INVENTRY.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\INTRO.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\TYPES.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\READKEY.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\DEFKEYS.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\PRINT.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\L01.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\L07.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\L09.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\L10.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\L13.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\L14.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\L15.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\L19.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\L20.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\L21.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\L25.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\L26.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\L27.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\L28.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\L31.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\L32.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\L33.PAS
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk w %CPM_PATH%\L34.PAS

pause


