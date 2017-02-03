@echo off 


setlocal 

set work_dir=%1
set fileno=0 
:: How many files should be in the folders 
set fldrsz=1000
 
set startTime=%time%

if NOT exist %work_dir% (

	echo Path not exist
	pause
	goto :EOF
)

for  %%f in (%work_dir%\*.*) do call :do_action "%%f" 

echo. 
echo Moved %fileno% files. 
echo Start Time: %startTime%
echo End Time: %time%
pause 

goto :EOF 


:do_action 

set /a fldrno=1000 + fileno / fldrsz 
set fldrnm=%fldrno:~-3% 


if not exist %work_dir%\%fldrnm% md %work_dir%\%fldrnm% 
move %1 %work_dir%\%fldrnm% >nul

set /a fileno=fileno + 1 