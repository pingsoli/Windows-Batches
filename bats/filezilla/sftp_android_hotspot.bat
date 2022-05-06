:: A stopgap for variable-ip-address problem when enabling hotspot after Android 11.
:: When your computer connects the hotspot of your Android phone, the default gateway
:: is the ip address of your Android phone. Your phone can start sftp server, and you
:: don't have to enter the host ip every time in filezilla, this script helps you 
:: connect the hotspot quickly with small changes.

@echo off

:: Set your own configuration
set protocol=sftp
set host=%ip%
set port=1234

set username=pingsoli
set password=pingsoli
set remote_path=/storage/emulated/0/Download

:: Extract Default gateway(this is the phone's ip address in LAN)
for /f "tokens=1-2 delims=:" %%a in ('netsh interface ip show address "WLAN"^|findstr /R /C:"Default Gateway"') do set ip=%%b

:: Remove the search string
set ip=%ip:~1%

:: Remove redundant whitespaces
set ip=%ip: =%
@REM echo %ip%

"D:\FileZilla FTP Client\filezilla.exe" %protocol%://%username%:%password%@%host%:%port%%remote_path%