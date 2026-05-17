@echo off
chcp 65001 > nul
set "LOCAL_VERSION=2.0.0"

:: Проверка прав администратора
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Запрос прав администратора...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"

setlocal EnableDelayedExpansion

:menu
cls
echo ========================================
echo   V.O.Z.D.U.H. v2.0
echo   Virtual Obstacle Zeroing Daemon
echo   Universal Helper
echo ========================================
echo.
echo [1] Установить сервис (Standart)
echo [2] Установить сервис (ULTIMA)
echo [3] Удалить сервис
echo [4] Проверить статус
echo [5] Обновить hosts (ChatGPT)
echo [6] Проверить доступность сайтов
echo [7] Запустить Standart (временно)
echo [8] Выход
echo ========================================
set /p choice="Выберите пункт (1-8): "

if "%choice%"=="1" goto install_standart
if "%choice%"=="2" goto install_ultima
if "%choice%"=="3" goto remove
if "%choice%"=="4" goto status
if "%choice%"=="5" goto hosts
if "%choice%"=="6" goto checksites
if "%choice%"=="7" goto run_standart
if "%choice%"=="8" exit
goto menu

:install_standart
cls
echo Установка сервиса V.O.Z.D.U.H. (Standart)...
net stop vozduh >nul 2>&1
sc delete vozduh >nul 2>&1
sc create vozduh binPath= "\"%~dp0bin\Vozduh.exe\" --wf-tcp=80,443 --filter-tcp= --hostlist=\"%~dp0lists\youtube.txt\" --dpi-desync=fake,split2" DisplayName= "V.O.Z.D.U.H." start= auto
sc description vozduh "Virtual Obstacle Zeroing Daemon - Universal Helper"
sc start vozduh
echo.
echo Сервис установлен и запущен!
pause
goto menu

:install_ultima
cls
echo Установка сервиса V.O.Z.D.U.H. (ULTIMA)...
net stop vozduh >nul 2>&1
sc delete vozduh >nul 2>&1
sc create vozduh binPath= "\"%~dp0bin\Vozduh.exe\" --wf-tcp=80,443 --filter-tcp= --hostlist=\"%~dp0lists\all.txt\" --dpi-desync=fake,split2 --wssize=1:6" DisplayName= "V.O.Z.D.U.H. ULTIMA" start= auto
sc description vozduh "Virtual Obstacle Zeroing Daemon - Universal Helper (ULTIMA)"
sc start vozduh
echo.
echo Сервис установлен и запущен!
pause
goto menu

:remove
cls
echo Удаление сервиса...
net stop vozduh >nul 2>&1
sc delete vozduh >nul 2>&1
echo Сервис удален!
pause
goto menu

:status
cls
echo Статус сервиса V.O.Z.D.U.H.:
echo.
sc query vozduh
echo.
pause
goto menu

:hosts
cls
echo Добавление хостов для ChatGPT и ИИ...
echo 185.68.247.42 chatgpt.com >> %SystemRoot%\System32\drivers\etc\hosts
echo 185.68.247.42 auth.openai.com >> %SystemRoot%\System32\drivers\etc\hosts
echo 185.68.247.42 platform.openai.com >> %SystemRoot%\System32\drivers\etc\hosts
echo 185.68.247.42 deepl.com >> %SystemRoot%\System32\drivers\etc\hosts
ipconfig /flushdns
echo.
echo Готово!
pause
goto menu

:checksites
cls
echo.
echo ========================================
echo      ПРОВЕРКА ДОСТУПНОСТИ САЙТОВ
echo ========================================
echo.
echo Запросы отправлены, ожидайте ответа...
echo.

:: SoundCloud
ping -n 1 soundcloud.com >nul && echo [OK]   https://soundcloud.com || echo [FAIL] https://soundcloud.com

:: 7tv
ping -n 1 7tv.app >nul && echo [OK]   https://7tv.app || echo [FAIL] https://7tv.app

:: Deepl
ping -n 1 deepl.com >nul && echo [OK]   https://www.deepl.com || echo [FAIL] https://www.deepl.com

:: Telegram Web
ping -n 1 web.telegram.org >nul && echo [OK]   https://web.telegram.org || echo [FAIL] https://web.telegram.org

:: Cloudflare
ping -n 1 cloudflare.com >nul && echo [OK]   https://www.cloudflare.com || echo [FAIL] https://www.cloudflare.com

:: Roblox
ping -n 1 roblox.com >nul && echo [OK]   https://www.roblox.com || echo [FAIL] https://www.roblox.com

:: YouTube
ping -n 1 youtube.com >nul && echo [OK]   https://www.youtube.com || echo [FAIL] https://www.youtube.com

:: Steam Community
ping -n 1 steamcommunity.com >nul && echo [OK]   https://steamcommunity.com/market/ || echo [FAIL] https://steamcommunity.com/market/

:: Steam Store
ping -n 1 store.steampowered.com >nul && echo [OK]   https://store.steampowered.com/ || echo [FAIL] https://store.steampowered.com/

:: LinkedIn
ping -n 1 linkedin.com >nul && echo [OK]   https://www.linkedin.com || echo [FAIL] https://www.linkedin.com

:: GitHub
ping -n 1 github.com >nul && echo [OK]   https://github.com/HolyLightRU/HolyZapret || echo [FAIL] https://github.com/HolyLightRU/HolyZapret

:: X/Twitter
ping -n 1 x.com >nul && echo [OK]   https://x.com/home || echo [FAIL] https://x.com/home

:: Twitch
ping -n 1 twitch.tv >nul && echo [OK]   https://www.twitch.tv || echo [FAIL] https://www.twitch.tv

:: WhatsApp Web
ping -n 1 web.whatsapp.com >nul && echo [OK]   https://web.whatsapp.com/ || echo [FAIL] https://web.whatsapp.com/

:: Discord
ping -n 1 discord.com >nul && echo [OK]   https://discord.com || echo [FAIL] https://discord.com

echo.
echo ========================================
echo      ПРОВЕРКА ЗАВЕРШЕНА
echo ========================================
pause
goto menu

:run_standart
cls
echo Запуск Standart Mode...
echo Не закрывайте это окно для работы обхода!
echo.
call standart.bat
pause
goto menu