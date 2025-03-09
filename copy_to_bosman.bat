REM Jest przygotowany obraz, z którego kasuje się pliki, dodaje uaktualnione, a następnie kopiuje się strukturę obrazu z pliku FDD_3000_Timex_CPM.dsk
@echo off

set DATA_PATH=f:\!_emulacja\Amstrad\Disks
set CPMTOOLS_PATH=f:\!_emulacja\CPM\cpmtools

cls

cd %CPMTOOLS_PATH%

echo Removing old game files...

del ADV.COM
del ADV.DAT
del ADVCONF.DAT
del ADVCONF.COM

cd %DATA_PATH%

echo Copying game files to temp location...

copy ADV.COM %CPMTOOLS_PATH%\ADV.COM
copy ADV.DAT %CPMTOOLS_PATH%\ADV.DAT
copy ADVCONF.DAT %CPMTOOLS_PATH%\ADVCONF.DAT
copy ADVCONF.COM %CPMTOOLS_PATH%\ADVCONF.COM

cd %CPMTOOLS_PATH%

echo Removing old files from disk image...

cpmrm -f bosman8 bosman.img adv*.*

echo Copying files to disk image...

cpmcp -f bosman8 bosman.img ADVCONF.DAT 0:ADVCONF.DAT
cpmcp -f bosman8 bosman.img ADV.COM 0:ADV.COM
cpmcp -f bosman8 bosman.img ADVCONF.COM 0:ADVCONF.COM
cpmcp -f bosman8 bosman.img ADV.DAT 0:ADV.DAT

echo Copying .img image to release folder

copy bosman.img %DATA_PATH%\bosman.img