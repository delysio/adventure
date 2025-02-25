@echo on

set CPMFS_PATH=f:\!_emulacja\CPM\run-cpm22
set GAME_PATH=f:\!_emulacja\AtariXE\Scene\_Moje\adventure
set CPM_PATH=f:\!_emulacja\CPM\CPM-20230921T170351Z-001\CPM\H\3
set DISKS_PATH=f:\!_emulacja\Amstrad\Disks

echo Extracting files...

%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk r ADVCONF.COM
%CPMFS_PATH%\cpmfs.exe %CPMFS_PATH%\driveb.dsk r ADV.COM

echo Moving files...

copy %GAME_PATH%\ADV.DAT %DISKS_PATH%\ADV.DAT
copy %GAME_PATH%\ADVCONF.DAT %DISKS_PATH%\ADVCONF.DAT
move %GAME_PATH%\ADVCONF.COM %DISKS_PATH%\ADVCONF.COM
move %GAME_PATH%\ADV.COM %DISKS_PATH%\ADV.COM