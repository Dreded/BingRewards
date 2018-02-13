@echo off
setlocal enableextensions enabledelayedexpansion
call :getargc argc %*
if %argc% GEQ 7 (
	goto :CONTINUE
)
:USAGE
	echo.
    echo %~n0%~x0 "[output type] %%a %%p %%r %%P %%l %%i [%%e or 'status_type']"
    echo "see config.xml for details"
	echo.
	goto end

:CONTINUE
set logFile=%~dp0..\log.log

set "account=%2"
set "points=%3"
set "retries=%4"
set "totalPoints=%5"
set "lifeCredits=%6"
set "ifStatement=%7"
if %1==error (
	set "first=onError:"
	set "last=, error = %8"
)
if %1==statusReached (
	set "first=statusReached = %8"
	set "last="
)
if %1==complete (
	set "first=onComplete:"
	set "last="
)
set "output=%first% account = %account%, points = %points%, retries = %retries%, totalPoints = %totalPoints%, lifeCredits = %lifeCredits%, ifStatement = %ifStatement%%last%"

echo %output%
echo %output% >> %logFile%
goto :end

:getargc
    set getargc_v0=%1
    set /a "%getargc_v0% = 0"
:getargc_l0
    if not x%2x==xx (
        shift
        set /a "%getargc_v0% = %getargc_v0% + 1"
        goto :getargc_l0
    )
    set getargc_v0=
    goto :end
:end
endlocal