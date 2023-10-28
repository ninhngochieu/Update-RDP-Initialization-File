@echo off
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

cd "C:\Program Files\RDP Wrapper"

:: Download content from URL and save to a temporary file
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/sebaxakerhtc/rdpwrap.ini/master/rdpwrap.ini', 'temp.ini')"

:: Clear the current content of rdpwrap.ini and append new content from the temporary file
type NUL > rdpwrap.ini
type temp.ini >> rdpwrap.ini

:: Delete the temporary file
del temp.ini

:: Stop and restart the termservice service
net stop termservice /y
net start termservice /y

pause
