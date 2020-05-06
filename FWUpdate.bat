@echo off
@cd /d "%~dp0"
@set "ERRORLEVEL="
@CMD /C EXIT 0
@"%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system" >nul 2>&1
@if NOT "%ERRORLEVEL%"=="0" (
@powershell -Command Start-Process ""%0"" -Verb runAs 2>nul
@exit
)
:--------------------------------------
set fwupdate=FWUpdLcl
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" set fwupdate=%fwupdate%64
set fwupdate=%fwupdate%.exe

echo Easy launcher for Intel ME Firmware update tool (FWUpdate)
echo ----------------------------------------------------------
set /p firmwarefilename=Enter firmware filename:
set firmwarefilename="%firmwarefilename%"
echo.
if NOT EXIST %fwupdate% set fwupdate=%fwupdate:64=%
if NOT EXIST %fwupdate% echo FWUpdate tool is missing.
if NOT EXIST %fwupdate% GOTO exit
%fwupdate% -f %firmwarefilename%
:exit
pause
exit