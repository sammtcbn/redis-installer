@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

C:\redis\redis-server --service-install C:\redis\redis.windows.conf
C:\redis\redis-server --service-start

:END
echo bye
timeout /t 3
