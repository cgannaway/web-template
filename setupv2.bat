@echo off

set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Choose Install Folder.',0,0).self.path""

for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "folder=%%I"

setlocal enabledelayedexpansion

echo ================================================================================
echo Working in directory %folder%
echo ================================================================================

goto PROMPT


setlocal
:PROMPT
set AREYOUSURE=N
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

goto PROGRAM
endlocal

:END
exit


:PROGRAM
echo Copying Files
echo -------------

copy * %folder%
mkdir %folder%\js
copy js\creative.js %folder%\js\creative.js

mkdir %folder%\css
mkdir %folder%\scss
mkdir %folder%\img

echo run "npm install" and then "gulp" in the project directory

pause