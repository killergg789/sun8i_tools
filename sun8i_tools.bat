@echo off
set cls=1
set ADB=.\adb\adb.exe
set /P ADB=Enter ADB path (leave blank to use current ADB): 

if %ADB%==[%1]==[] set ADB=%ADB%

echo ADB binaries chosen is %ADB%
pause|echo Press any key.



:menu
set type=0
color 0A

IF %cls% == 1 cls
echo.
echo Welcome to sun8i_tools by Doctor_Titi 01.09.2017 10:49
echo.
echo.
echo  ___________________________________________________
echo "         type 0 to show available commands         "
echo  ---------------------------------------------------
echo.
echo.

REM Selector condition

set /p type=Make a choice:


if %type% == 0 goto :help
if %type% == 1 goto :SuperSu
if %type% == 2 goto :CLS

REM Loop
cls
color 0C
echo.
echo.                     (%type%) is a
echo  ___________________________________________________
echo "                  Wrong Choice.                    "
echo  ---------------------------------------------------
echo.
pause|echo Press any key!
cls
goto :menu

:CLS
echo.
echo This menu will allow you to erase text after showing up new things. (clear/CLS)
echo.
echo 0. Disable CLS
echo 1. Enable CLS
echo menu. Go back into the main menu
echo.
set /p typecls=Make a choice: 

if %typecls% == 0 goto :disable
if %typecls% == 1 goto :enable
if %typecls% == menu goto :menu

goto :CLS

:disable
set cls=0
goto :menu

:enable
set cls=1
goto :menu


:help
echo.
echo _____________________________________________________
echo " 0. Show this menu                                 "
echo " 1. Install Supersu v2.82 & BusyBox 1.21 via ADB   "
echo " 2. Enable menu auto clear                         "
echo " 3. install BusyBox 1.27.1 and ToyBox 0.7.4        "
echo " 4. Install GNU Parted                             "
echo " 5. List partitions                                "
echo " 6. Backup a partition (use 4 before)              "
echo " 7. Install latest OpenGapps for 4.4.x             "
echo -----------------------------------------------------
echo.
pause|echo Press any key.
REM go back to the menu
goto :menu


:SuperSu
echo Installing BusyBox 1.21...
echo.
echo Pushing binaries in temp folder.
%ADB% push .\Bin\1\busybox /data/local/tmp/

echo.
echo Mount /system as R/W.
%ADB% shell "su -c mount -o remount -r -w /system"

echo.
echo Removing old busybox.
%ADB% shell "su -c rm /system/bin/busybox"

echo.
echo Copying binaries into system folder.
%ADB% shell "su -c cp /data/local/tmp/busybox /system/bin/"

echo.
echo Changing permissions.
%ADB% shell "su -c chmod 777 /system/bin/busybox"

ping -n 3 127.0.0.1 > null
pause|echo under construction.

echo.
echo Copying libs



goto :menu



