@ECHO OFF
color 0C
::Set the working directory
set "workingdir=%~dp0"
::Switch to working directory

set prgf=%ProgramFiles%

if "%PROCESSOR_ARCHITECTURE%"=="AMD64" set prgf=%ProgramFiles(x86)%
if "%PROCESSOR_ARCHITEW6432%"=="AMD64" set prgf=%ProgramFiles(x86)%
if "%PROCESSOR_ARCHITECTURE%"=="IA64" set prgf=%ProgramFiles(x86)%
if "%PROCESSOR_ARCHITEW6432%"=="IA64" set prgf=%ProgramFiles(x86)%

title CsvModsInstaller By Pedro
echo Created By Pedro
echo Per evitare possibili problemi eseguire sempre il file come amministratore
echo .
CHOICE /c CD /M "Seleziona il disco principale di sistema?"
IF ERRORLEVEL 2 goto d
IF ERRORLEVEL 1 goto c

:c
echo off
set drive=drive C:
del /Q C:\ProgramData\BlueStacks\UserData\SharedFolder\*.*
mkdir C:\ProgramData\BlueStarks\UserData\SharedFolder
copy "%~dp0\conf\csv\*.*" C:\ProgramData\BlueStacks\UserData\SharedFolder\
copy "%~dp0\conf\sc\*.*" C:\ProgramData\BlueStacks\UserData\SharedFolder\
cd "%prgf%"\BlueStacks"
start HD-StartLauncher.exe
echo Attendere che Bluestacks sia aperto correttamente...
pause

echo Installazione MOD in corso
echo.
@echo off 
taskkill /f /im Hd-Adb.exe

"%prgf%"\BlueStacks\hd-adb shell su -c "mkdir /data/data/com.supercell.clashofclans/update/"
"%prgf%"\BlueStacks\hd-adb shell su -c "chmod -R 777 /data/data/com.supercell.clashofclans/update/"
"%prgf%"\BlueStacks\hd-adb shell su -c "mkdir /data/data/com.supercell.clashofclans/update/csv"
"%prgf%"\BlueStacks\hd-adb shell su -c "chmod -R 777 /data/data/com.supercell.clashofclans/update/csv"
"%prgf%"\BlueStacks\hd-adb shell su -c "mkdir /data/data/com.supercell.clashofclans/update/logic"
"%prgf%"\BlueStacks\hd-adb shell su -c "chmod -R 777 /data/data/com.supercell.clashofclans/update/logic"
"%prgf%"\BlueStacks\hd-adb shell su -c "mkdir /data/data/com.supercell.clashofclans/update/sc"
"%prgf%"\BlueStacks\hd-adb shell su -c "chmod -R 777 /data/data/com.supercell.clashofclans/update/sc"
cls
choice /c sn /m "Villaggio zoomato?"
IF ERRORLEVEL 2 goto cclouds
IF ERRORLEVEL 1 goto zoom

:zoom
"%prgf%"\BlueStacks\hd-adb shell su -c "cp /storage/sdcard/windows/BstSharedFolder/client_globals.csv /data/data/com.supercell.clashofclans/update/csv"
"%prgf%"\BlueStacks\hd-adb shell su -c "chmod -R 777 /data/data/com.supercell.clashofclans/update/csv/client_globals.csv"
goto cclouds

:cclouds
choice /c sn /m "Nuvole nere?"
IF ERRORLEVEL 2 goto ctext
IF ERRORLEVEL 1 goto clouds

:clouds
"%prgf%"\BlueStacks\hd-adb shell su -c "cp /storage/sdcard/windows/BstSharedFolder/clouds.sc /data/data/com.supercell.clashofclans/update/sc"
"%prgf%"\BlueStacks\hd-adb shell su -c "chmod -R 777 /data/data/com.supercell.clashofclans/update/sc/clouds.sc"
goto ctext

:ctext
choice /c sn /m "Testo CONFERMA rimosso?"
IF ERRORLEVEL 2 goto end
IF ERRORLEVEL 1 goto text

:text
"%prgf%"\BlueStacks\hd-adb shell su -c "cp /storage/sdcard/windows/BstSharedFolder/texts.csv /data/data/com.supercell.clashofclans/update/csv"
"%prgf%"\BlueStacks\hd-adb shell su -c "chmod -R 777 /data/data/com.supercell.clashofclans/update/csv/texts.csv"
goto end

:end
echo.
echo Installazione completata.
echo Se sei arrivato qui le MOD sono state installate correttamente.
echo.
pause
exit

:d
echo off
set drive=drive D:
del /Q D:\ProgramData\BlueStacks\UserData\SharedFolder\*.*
mkdir D:\ProgramData\BlueStarks\UserData\SharedFolder
copy "%~dp0\conf\csv\*.*" D:\ProgramData\BlueStacks\UserData\SharedFolder\
copy "%~dp0\conf\sc\*.*" D:\ProgramData\BlueStacks\UserData\SharedFolder\
cd "%prgf%"\BlueStacks"
start HD-StartLauncher.exe
echo Attendere che Bluestacks sia aperto correttamente...
pause

echo Installazione MOD in corso
echo.
@echo off 
taskkill /f /im Hd-Adb.exe

"%prgf%"\BlueStacks\hd-adb shell su -c "mkdir /data/data/com.supercell.clashofclans/update/"
"%prgf%"\BlueStacks\hd-adb shell su -c "chmod -R 777 /data/data/com.supercell.clashofclans/update/"
"%prgf%"\BlueStacks\hd-adb shell su -c "mkdir /data/data/com.supercell.clashofclans/update/csv"
"%prgf%"\BlueStacks\hd-adb shell su -c "chmod -R 777 /data/data/com.supercell.clashofclans/update/csv"
"%prgf%"\BlueStacks\hd-adb shell su -c "mkdir /data/data/com.supercell.clashofclans/update/logic"
"%prgf%"\BlueStacks\hd-adb shell su -c "chmod -R 777 /data/data/com.supercell.clashofclans/update/logic"
"%prgf%"\BlueStacks\hd-adb shell su -c "mkdir /data/data/com.supercell.clashofclans/update/sc"
"%prgf%"\BlueStacks\hd-adb shell su -c "chmod -R 777 /data/data/com.supercell.clashofclans/update/sc"
cls
choice /c sn /m "Villaggio zoomato?"
IF ERRORLEVEL 2 goto cclouds
IF ERRORLEVEL 1 goto zoom

:zoom
"%prgf%"\BlueStacks\hd-adb shell su -c "cp /storage/sdcard/windows/BstSharedFolder/client_globals.csv /data/data/com.supercell.clashofclans/update/csv"
"%prgf%"\BlueStacks\hd-adb shell su -c "chmod -R 777 /data/data/com.supercell.clashofclans/update/csv/client_globals.csv"
goto cclouds

:cclouds
choice /c sn /m "Nuvole nere?"
IF ERRORLEVEL 2 goto ctext
IF ERRORLEVEL 1 goto clouds

:clouds
"%prgf%"\BlueStacks\hd-adb shell su -c "cp /storage/sdcard/windows/BstSharedFolder/clouds.sc /data/data/com.supercell.clashofclans/update/sc"
"%prgf%"\BlueStacks\hd-adb shell su -c "chmod -R 777 /data/data/com.supercell.clashofclans/update/sc/clouds.sc"
goto ctext

:ctext
choice /c sn /m "Testo CONFERMA rimosso?"
IF ERRORLEVEL 2 goto end
IF ERRORLEVEL 1 goto text

:text
"%prgf%"\BlueStacks\hd-adb shell su -c "cp /storage/sdcard/windows/BstSharedFolder/texts.csv /data/data/com.supercell.clashofclans/update/csv"
"%prgf%"\BlueStacks\hd-adb shell su -c "chmod -R 777 /data/data/com.supercell.clashofclans/update/csv/texts.csv"
goto end

:end
echo.
echo Installazione completata.
echo Se sei arrivato qui le MOD sono state installate correttamente.
echo.
pause
exit