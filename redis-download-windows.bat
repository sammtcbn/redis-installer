@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

set dlver=3.2.100
set dlfile=Redis-x64-%dlver%.zip
set dlurl=https://github.com/microsoftarchive/redis/releases/download/win-%dlver%/%dlfile%
set foldername=redis

curl --fail --output %dlfile% -L %dlurl%
if %errorlevel% neq 0 (
    echo Fail to download %dlfile%
    pause
    goto End
)

if not exist %dlfile% (
    echo %dlfile% not found
    pause
    goto End
)

mkdir %foldername%

powershell -command "Expand-Archive -Force %dlfile% .\%foldername%"

if not exist %foldername%\redis-server.exe (
    echo Fail to extract %dlfile%
    pause
    goto End
)


:END
echo bye
timeout /t 3
