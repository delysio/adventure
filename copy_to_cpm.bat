@echo off

xcopy f:\!_emulacja\AtariXE\Scene\_Moje\adventure\adventure.pas f:\!_emulacja\CPM\CPM-20230921T170351Z-001\CPM\H\3\ADV.PAS
xcopy f:\!_emulacja\AtariXE\Scene\_Moje\adventure\consts.pas f:\!_emulacja\CPM\CPM-20230921T170351Z-001\CPM\H\3\CONSTS.PAS
xcopy f:\!_emulacja\AtariXE\Scene\_Moje\adventure\fight.pas f:\!_emulacja\CPM\CPM-20230921T170351Z-001\CPM\H\3\FIGHT.PAS
xcopy f:\!_emulacja\AtariXE\Scene\_Moje\adventure\info.pas f:\!_emulacja\CPM\CPM-20230921T170351Z-001\CPM\H\3\INFO.PAS
xcopy f:\!_emulacja\AtariXE\Scene\_Moje\adventure\init.pas f:\!_emulacja\CPM\CPM-20230921T170351Z-001\CPM\H\3\INIT.PAS
xcopy f:\!_emulacja\AtariXE\Scene\_Moje\adventure\inventry.pas f:\!_emulacja\CPM\CPM-20230921T170351Z-001\CPM\H\3\INVENTRY.PAS
xcopy f:\!_emulacja\AtariXE\Scene\_Moje\adventure\types.pas f:\!_emulacja\CPM\CPM-20230921T170351Z-001\CPM\H\3\TYPES.PAS

f:\!_emulacja\CPM\run-cpm22\cpmfs.exe f:\!_emulacja\CPM\run-cpm22\driveb.dsk ERA ADV.PAS
f:\!_emulacja\CPM\run-cpm22\cpmfs.exe f:\!_emulacja\CPM\run-cpm22\driveb.dsk ERA CONSTS.PAS
f:\!_emulacja\CPM\run-cpm22\cpmfs.exe f:\!_emulacja\CPM\run-cpm22\driveb.dsk ERA FIGHT.PAS
f:\!_emulacja\CPM\run-cpm22\cpmfs.exe f:\!_emulacja\CPM\run-cpm22\driveb.dsk ERA INFO.PAS
f:\!_emulacja\CPM\run-cpm22\cpmfs.exe f:\!_emulacja\CPM\run-cpm22\driveb.dsk ERA INIT.PAS
f:\!_emulacja\CPM\run-cpm22\cpmfs.exe f:\!_emulacja\CPM\run-cpm22\driveb.dsk ERA INVENTRY.PAS
f:\!_emulacja\CPM\run-cpm22\cpmfs.exe f:\!_emulacja\CPM\run-cpm22\driveb.dsk ERA TYPES.PAS

f:\!_emulacja\CPM\run-cpm22\cpmfs.exe f:\!_emulacja\CPM\run-cpm22\driveb.dsk w f:\!_emulacja\CPM\CPM-20230921T170351Z-001\CPM\H\3\ADV.PAS
f:\!_emulacja\CPM\run-cpm22\cpmfs.exe f:\!_emulacja\CPM\run-cpm22\driveb.dsk w f:\!_emulacja\CPM\CPM-20230921T170351Z-001\CPM\H\3\CONSTS.PAS
f:\!_emulacja\CPM\run-cpm22\cpmfs.exe f:\!_emulacja\CPM\run-cpm22\driveb.dsk w f:\!_emulacja\CPM\CPM-20230921T170351Z-001\CPM\H\3\FIGHT.PAS
f:\!_emulacja\CPM\run-cpm22\cpmfs.exe f:\!_emulacja\CPM\run-cpm22\driveb.dsk w f:\!_emulacja\CPM\CPM-20230921T170351Z-001\CPM\H\3\INFO.PAS
f:\!_emulacja\CPM\run-cpm22\cpmfs.exe f:\!_emulacja\CPM\run-cpm22\driveb.dsk w f:\!_emulacja\CPM\CPM-20230921T170351Z-001\CPM\H\3\INIT.PAS
f:\!_emulacja\CPM\run-cpm22\cpmfs.exe f:\!_emulacja\CPM\run-cpm22\driveb.dsk w f:\!_emulacja\CPM\CPM-20230921T170351Z-001\CPM\H\3\INVENTRY.PAS
f:\!_emulacja\CPM\run-cpm22\cpmfs.exe f:\!_emulacja\CPM\run-cpm22\driveb.dsk w f:\!_emulacja\CPM\CPM-20230921T170351Z-001\CPM\H\3\TYPES.PAS

pause


