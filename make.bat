@echo off

c:\FPC\3.2.2\bin\i386-win32\fpc.exe adventure.pas

if %errorlevel% equ 0 (
    echo Kompilacja zakonczona sukcesem. Uruchamianie programu...
    adventure.exe
) else (
    echo Wystapily bledy podczas kompilacji. Program nie zostanie uruchomiony.
)