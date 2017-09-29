@echo off
set create_name=computerA.rdp

If "%1"=="" (
echo ip can't be null!
pause
exit
)

If "%2"=="" (
echo usename can't be null!
pause
exit
)

If "%3"=="" (
echo password can't be null!
pause
exit
)
set ip=%1
set username=%2
set password=%3
REM start /wait crypt.bat 42.236.90.242 Administrator H3@uMrFMH8H6vt #^%create_name%
reg add "HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\LocalDevices" /v %ip% /t REG_DWORD /f /d "0xc"
start /wait %~dp0crypt.bat %ip% %username% %password% %create_name%
start mstsc %~dp0%create_name%
set waitTime=8
ping -n %waitTime% 127.0>nul
taskkill /F /IM mstsc.exe
del %~dp0%create_name%

