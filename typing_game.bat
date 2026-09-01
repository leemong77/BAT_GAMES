@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo [타이핑게임] 단어리스트를 불러옵니다....

set "count=0"

for /f "usebackq delims=" %%i in ("d:\bat\games\wordlist.txt") do (
    set /a count +=1
    set "word[!count!]=%%i"
)

echo [로딩완료] 총 !count! 개의 단어를 불러왔습니다.
echo -----------------------------------------------

rem 1.난수(랜덤 숫자) 를 만들어서 방 번호 선택하기
set /a "rand_idx=(%RANDOM% %% count)+1"

rem 2.선택된 방 번호에서 단어 꺼내오기
set "target_word=!word[%rand_idx%]!"

rem 3.화면에 문제 출제하기
echo 오늘의 제시어는 바로...[!target_word!]입니다!
echo -----------------------------------------------
pause
