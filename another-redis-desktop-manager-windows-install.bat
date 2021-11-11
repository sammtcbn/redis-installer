@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

set dlver=1.4.9
set dlfile=Another-Redis-Desktop-Manager.%dlver%.exe
set dlurl=https://github.com/qishibo/AnotherRedisDesktopManager/releases/download/v%dlver%/%dlfile%

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

%dlfile% /S

:END
echo bye
timeout /t 3
