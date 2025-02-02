@echo off

cls

c:\FPC\3.2.2\bin\i386-win32\fpc.exe -MObjFPC advconf.pas

if %errorlevel% equ 0 (
    echo Kompilacja zakonczona sukcesem. Uruchamianie programu...
    Pause
    advconf.exe
) else (
    echo Wystapily bledy podczas kompilacji. Program nie zostanie uruchomiony.
)