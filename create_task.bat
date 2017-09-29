@echo off
set d=%date:~0,10%
set hour=%time:~0,2%
set min=%time:~3,2%
set str0=0
echo %min%
set /a min1=%min%+1
if %min1% lss 10 (set min1=%str0%%min1%)
set st=%hour%:%min1%
echo %st%

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
schtasks /delete /tn taskname1 /f
schtasks /create /tn taskname1 /tr "%~dp0auto_mstsc.bat %ip% %username% %password%" /sc once /st %st% /ru %username% /it 
