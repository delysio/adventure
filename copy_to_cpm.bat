@echo off

set GAME_PATH=f:\!_emulacja\AtariXE\Scene\_Moje\adventure\
set CPM_PATH=f:\!_emulacja\CPM\CPM-20230921T170351Z-001\CPM\H\3\
set CPMFS_PATH=f:\!_emulacja\CPM\run-cpm22\
set REPLACE_FILE=%CPM_PATH%ADV.PAS

echo Copying files...

xcopy %GAME_PATH%adventure.pas %CPM_PATH%ADV.PAS
xcopy %GAME_PATH%consts.pas %CPM_PATH%CONSTS.PAS
xcopy %GAME_PATH%fight.pas %CPM_PATH%FIGHT.PAS
xcopy %GAME_PATH%info.pas %CPM_PATH%INFO.PAS
xcopy %GAME_PATH%init.pas %CPM_PATH%INIT.PAS
xcopy %GAME_PATH%inventry.pas %CPM_PATH%INVENTRY.PAS
xcopy %GAME_PATH%types.pas %CPM_PATH%TYPES.PAS
xcopy %GAME_PATH%defkeys.pas %CPM_PATH%DEFKEYS.PAS

echo disabling use crt from main files

powershell -Command "(Get-Content %REPLACE_FILE%) -replace 'uses crt;', '{ uses crt; }' | Set-Content %REPLACE_FILE%"

echo Deleting old files from dsk image

%CPMFS_PATH%cpmfs.exe %CPMFS_PATH%driveb.dsk ERA ADV.PAS
%CPMFS_PATH%cpmfs.exe %CPMFS_PATH%driveb.dsk ERA CONSTS.PAS
%CPMFS_PATH%cpmfs.exe %CPMFS_PATH%driveb.dsk ERA FIGHT.PAS
%CPMFS_PATH%cpmfs.exe %CPMFS_PATH%driveb.dsk ERA INFO.PAS
%CPMFS_PATH%cpmfs.exe %CPMFS_PATH%driveb.dsk ERA INIT.PAS
%CPMFS_PATH%cpmfs.exe %CPMFS_PATH%driveb.dsk ERA INVENTRY.PAS
%CPMFS_PATH%cpmfs.exe %CPMFS_PATH%driveb.dsk ERA TYPES.PAS
%CPMFS_PATH%cpmfs.exe %CPMFS_PATH%driveb.dsk ERA READKEY.PAS
%CPMFS_PATH%cpmfs.exe %CPMFS_PATH%driveb.dsk ERA DEFKEYS.PAS
%CPMFS_PATH%cpmfs.exe %CPMFS_PATH%driveb.dsk ERA ADV.COM

echo Writing updated files to dsk image

%CPMFS_PATH%cpmfs.exe %CPMFS_PATH%driveb.dsk w %CPM_PATH%ADV.PAS
%CPMFS_PATH%cpmfs.exe %CPMFS_PATH%driveb.dsk w %CPM_PATH%CONSTS.PAS
%CPMFS_PATH%cpmfs.exe %CPMFS_PATH%driveb.dsk w %CPM_PATH%FIGHT.PAS
%CPMFS_PATH%cpmfs.exe %CPMFS_PATH%driveb.dsk w %CPM_PATH%INFO.PAS
%CPMFS_PATH%cpmfs.exe %CPMFS_PATH%driveb.dsk w %CPM_PATH%INIT.PAS
%CPMFS_PATH%cpmfs.exe %CPMFS_PATH%driveb.dsk w %CPM_PATH%INVENTRY.PAS
%CPMFS_PATH%cpmfs.exe %CPMFS_PATH%driveb.dsk w %CPM_PATH%TYPES.PAS
%CPMFS_PATH%cpmfs.exe %CPMFS_PATH%driveb.dsk w %CPM_PATH%READKEY.PAS
%CPMFS_PATH%cpmfs.exe %CPMFS_PATH%driveb.dsk w %CPM_PATH%DEFKEYS.PAS

echo Actual directory of CP/M disk:
%CPMFS_PATH%cpmfs.exe %CPMFS_PATH%driveb.dsk dir

pause


