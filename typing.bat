@echo off
titel 타자게임
cls
echo.
set count=0
>> "%~dp0typing_log.txt" echo [%date% %time%] 새 게임
:start
set /a count+=1
set /p word=%count%번쨰 단어:
echo 입력한 단어: %word%
>> "%~dp0typing_log.txt" echo.%word%
if %count% lss 5 goto start
pause