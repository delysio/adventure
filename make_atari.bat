@echo off
@setlocal

REM -------------------- Compile

f:\!_emulacja\AtariXE\Scene\_Moje\adventure\mp\mp.exe f:\!_emulacja\AtariXE\Scene\_Moje\adventure\adventure.pas -code:2000 

if %ERRORLEVEL% == 0 goto :MADS

echo Mad Pascal gives errors (%errorlevel%). Compilation unsuccesful.
goto :END

REM -------------------- Assembly

:MADS
f:\!_emulacja\AtariXE\Scene\_Moje\adventure\mads\mads.exe f:\!_emulacja\AtariXE\Scene\_Moje\adventure\adventure.a65 -x -i:f:\!_emulacja\AtariXE\Scene\_Moje\adventure\mp\base\ -t -l -o:f:\!_emulacja\AtariXE\Scene\_Moje\adventure\adventure.xex

if %ERRORLEVEL% == 0 goto :RUN

echo MADS gives errors (%errorlevel%). Compilation unsuccesful.
goto :END

REM -------------------- RUN

:RUN
pause

start adventure.xex

:END