@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
title 단어박살 타이핑 게임

:: 초기 설정
set "wordfile=wordlist.txt"
set "score=0"
set "life=3"

if not exist "%wordfile%" (
    echo [오류] %wordfile% 파일이 없습니다.
    echo 단어장 파일을 먼저 만들어주세요.
    pause
    exit /b
)

:game_loop
cls
if %life% leq 0 (
    echo ====================================
    echo             GAME OVER!
    echo ====================================
    echo 최종 점수: %score%점
    pause
    exit /b
)

:: 단어장 행 수 계산
set "total_words=0"
for /f %%a in (%wordfile%) do set /a total_words+=1

:: 무작위 단어 선택
set /a "rand_idx=(%random% %% total_words) + 1"
set "current_word="
set "idx=0"
for /f "usebackq tokens=*" %%a in ("%wordfile%") do (
    set /a idx+=1
    if !idx! equ %rand_idx% set "current_word=%%a"
)

:: 단어 떨어지는 연출 및 입력 대기
set "spaces="
set /a "drop_limit=%random% %% 10 + 1"
for /l %%i in (1,1,%drop_limit%) do set "spaces=!spaces! "

echo ====================================
echo  점수: %score%   ^|   목숨: %life%
echo ====================================
echo.
echo !spaces!!current_word!
echo.
echo ====================================
set /p "user_input=입력: "

:: 정답 검사
if "!user_input!"=="!current_word!" (
    set /a score+=10
    echo [성공] +10점!
    timeout /t 1 >nul
) else (
    set /a life-=1
    echo [실패] 오타 또는 시간 지체! (정답: !current_word!)
    timeout /t 1 >nul
)

goto game_loop


