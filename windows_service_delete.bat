@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

C:\redis\redis-server --service-stop
C:\redis\redis-server --service-uninstall

:END
echo bye
timeout /t 3
