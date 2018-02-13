@echo off
setlocal enableextensions enabledelayedexpansion
call :getargc argc %*
if %argc%==7 (
	goto :CONTINUE
)
:USAGE
	echo.
    echo %~n0%~x0 "%%a %%p %%r %%P %%l %%i 'status_type'"
    echo "see config.xml for details"
	echo.
	goto end
	
::echo Args are %*

:CONTINUE
set logFile=%~dp0..\log.log
echo %logFile%

set "account=%1"
set "points=%2"
set "retries=%3"
set "totalPoints=%4"
set "lifeCredits=%5"
set "ifStatement=%6"
set "statusReached=%7"

set "output=statusReached = %statusReached%, account = %account%, points = %points%, retries = %retries%, totalPoints = %totalPoints%, lifeCredits = %lifeCredits%, ifStatement = '%ifStatement%'"

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