@echo off
cd /d "%~dp0"
title V.O.Z.D.U.H. - Standart Mode

echo ========================================
echo   V.O.Z.D.U.H. - Standart Mode
echo   Virtual Obstacle Zeroing Daemon
echo ========================================
echo.
echo Запуск обхода... Не закрывайте это окно!
echo.

bin\Vozduh.exe --wf-tcp=80,443 --wf-udp=443 --filter-tcp=443 --hostlist=lists\youtube.txt --dpi-desync=fake

pause