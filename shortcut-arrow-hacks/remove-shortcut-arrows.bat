@echo off

@REM Elevate to administrator
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

set my_icons_path=C:\icons

if not exist %my_icons_path% mkdir %my_icons_path%

xcopy /y %~dp0\blank.ico %my_icons_path%

reg import %~dp0\remove-shortcut-arrows.reg