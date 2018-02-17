@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
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