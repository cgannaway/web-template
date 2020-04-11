@echo off
echo What is the development directory?
echo (Don't add a \ on the end)
echo ex: C:\Users\"Your Name"\Documents\directory
echo ----------------------------------------------
set /p directory=">>> "

echo Working in %directory%

copy * %directory%\
mkdir %directory%\js
copy js\creative.js %directory%\js\creative.js

mkdir %directory%\css
mkdir %directory%\scss
mkdir %directory%\img

echo run "npm install" and then "gulp" in the project directory

pause