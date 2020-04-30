@ECHO OFF

SETLOCAL ENABLEDELAYEDEXPANSION

SET /A num=0

FOR %%i IN (%*) DO (
    SET lst[!num!]=%%i
    SET /A num=!num!+1
)

ECHO Total : !num! MYEONG

SET /A count=0
SET /A goal=!RANDOM!%%50

:again
IF !count! == !goal! (
    GOTO escape
) ELSE (
    SET /A A=!RANDOM!%%%num%
    SET /A B=!RANDOM!%%%num%

    SET tempo=!lst[%A%]!
    SET lst[%A%]=!lst[%B%]!
    SET lst[%B%]=!tempo!

    SET /A count=!count!+1
    GOTO again
)

:escape

SET /A OSCND=!num!/2-1

ECHO ----------------------------------------
ECHO.

FOR /L %%i IN (0, 1, !OSCND!) DO (
    SET 1TEAM=!1TEAM! !lst[%%i]!
)
ECHO 1TEAM :!1TEAM!

SET /A OSCND=!OSCND!+1
SET /A num=!num!-1
FOR /L %%i IN (!OSCND!, 1, !num!) DO (
    SET 2TEAM=!2TEAM! !lst[%%i]!
)
ECHO 2TEAM :!2TEAM!

ECHO.