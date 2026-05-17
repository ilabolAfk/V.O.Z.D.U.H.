@echo off
chcp 65001 > nul

cd /d "%~dp0"

set "BIN=%~dp0bin\"
set "LISTS=%~dp0exp-list\"
set "GameFilter=1024-65535"

cls
echo.
echo  __      __   ____      ______    _____       _    _      _    _      
echo  \ \    / /  / __ \    |___  /   |  __ \     | |  | |    | |  | |     
echo   \ \  / /  | |  | |      / /    | |  | |    | |  | |    | |__| |     
echo    \ \/ /__ | |  | | __  / /  __ | |  | | __ | |  | | __ |  __  | __  
echo     \  /(__)| |__| |(__)/ /__(__)| |__| |(__)| |__| |(__)| |  | |(__) 
echo      \/      \____/    /_____|   |_____/      \____/     |_|  |_|     
echo.
powershell -Command "Write-Host 'V.O.Z.D.U.H. - ULTIMA Mode' -ForegroundColor DarkCyan"
powershell -Command "Write-Host 'Virtual Obstacle Zeroing Daemon - Universal Helper' -ForegroundColor Cyan"
powershell -Command "Write-Host '========================================' -ForegroundColor DarkCyan"
powershell -Command "Write-Host 'Максимальный режим обхода' -ForegroundColor Cyan"
powershell -Command "Write-Host 'Для самых сложных случаев' -ForegroundColor DarkCyan"
echo.

"%BIN%Vozduh.exe" --wf-tcp=80,443,2053,2083,2087,2096,8443 --wf-udp=443,19294-19344,50000-50100 ^
--filter-udp=443 --hostlist="%LISTS%list-general.txt" --hostlist-exclude="%LISTS%list-exclude.txt" --ipset-exclude="%LISTS%ipset-exclude.txt" --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --new ^
--filter-udp=19294-19344,50000-50100 --filter-l7=discord,stun --dpi-desync=fake --dpi-desync-repeats=6 --new ^
--filter-tcp=2053,2083,2087,2096,8443 --hostlist-domains=discord.media --dpi-desync=multisplit --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="%BIN%tls_clienthello_max_ru.bin" --new ^
--filter-tcp=443 --hostlist="%LISTS%list-google.txt" --dpi-desync=multisplit --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="%BIN%tls_clienthello_max_ru.bin" --new ^
--filter-tcp=80,443 --hostlist="%LISTS%list-general.txt" --hostlist-exclude="%LISTS%list-exclude.txt" --ipset-exclude="%LISTS%ipset-exclude.txt" --dpi-desync=multisplit --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="%BIN%tls_clienthello_max_ru.bin" --new ^
--filter-udp=443 --ipset="%LISTS%ipset-all.txt" --hostlist-exclude="%LISTS%list-exclude.txt" --ipset-exclude="%LISTS%ipset-exclude.txt" --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --new ^
--filter-tcp=80,443 --ipset="%LISTS%ipset-all.txt" --hostlist-exclude="%LISTS%list-exclude.txt" --ipset-exclude="%LISTS%ipset-exclude.txt" --dpi-desync=multisplit --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="%BIN%tls_clienthello_max_ru.bin"