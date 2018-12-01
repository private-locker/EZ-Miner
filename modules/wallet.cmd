@echo off
SETLOCAL EnableDelayedExpansion
cls


REM ###############################################################################
REM ###          Starting Variables of EZ-ALL-IN-ONE (EZ-AIO)                   ###
REM ###############################################################################     
:VARIABLES
dpath="%~dp0"
REM     ###########################################################################
REM     ###   Custom Color Code and Rewrote Snippet by REDD (Ar1k88) - Part 1   ###
REM     ###########################################################################
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)
REM     ###########################################################################
REM ###############################################################################
REM ###           Starting Wallet Variables for the Wallet Manager              ###
REM ###############################################################################



set "WALLET1=null"
set "WALLET2=null"
set "WALLET3=null"
set "WALLET4=null"
set "WALLET5=null"
set "WALLET6=null"
set "WALLET7=null"
set "WALLET8=null"
set "WALLET9=null"
set "WALLET10=null"

set "USER=%SystemDrive%\Users\%USERNAME%"
set "DESKTOP=%USER%\Desktop"
set "EZDIR=%DESKTOP%\EZ-Miner"
set "WALLETDIR=%EZDIR%\Wallets"
Set "CURRENTCONFIG=%WALLETDIR%\Wallet.txt"
Set "CONFIG=%WALLETDIR%\Wallets.db"
Set "TEMPCONFIG=%WALLETDIR%\Wallets.tmp"
IF NOT EXIST "%EZDIR%" mkdir "%EZDIR%" >NUL
IF NOT EXIST "%WALLETDIR%" mkdir "%WALLETDIR%" >NUL
IF NOT EXIST "%CURRENTCONFIG%" type nul >"%CURRENTCONFIG%"
IF NOT EXIST "%CONFIG%" type nul >"%CONFIG%"

REM  if EXIST "service.exe" start "%~dp0" "service.exe"
set "VER=1.2"
set "EDITION=Public"
mode con: cols=110 lines=42
SETLOCAL EnableDelayedExpansion


Set n=
For /F "tokens=*" %%I IN (%CURRENTCONFIG%) DO (
Set CURRENTWALLET=%%I
)
:MENU
cls
Set n=
For /F "tokens=*" %%I IN (%CONFIG%) DO (
Set /a n+=1
Set WALLET!n!=%%I
)
echo.
echo.
call :colorEcho 08 "O============================================================================================================O"
echo.
call :colorEcho 0C "                                            -REDD-"
call :colorEcho 03 " Presents - "
echo.
call :colorEcho 03 "                                               Version %VER%            "
echo.
call :colorEcho 03 "                                              %EDITION%"
echo.
call :colorEcho 08 "O============================================================================================================O"
echo.
echo.
echo.
if NOT "%CURRENTWALLET%" EQU "null" echo  Current Wallet - %CURRENTWALLET%
echo.
echo     Wallets -
if NOT "%WALLET1%" EQU "null" echo 1.  %WALLET1%
if "%WALLET2%" NEQ "null" echo 2.  %WALLET2%
if "%WALLET3%" NEQ "null" echo 3.  %WALLET3%
if "%WALLET4%" NEQ "null" echo 4.  %WALLET4%
if "%WALLET5%" NEQ "null" echo 5.  %WALLET5%
if "%WALLET6%" NEQ "null" echo 6.  %WALLET6%
if "%WALLET7%" NEQ "null" echo 7.  %WALLET7%
if 	"%WALLET8%" NEQ "null" echo 8.  %WALLET8%
if "%WALLET9%" NEQ "null" echo 9.  %WALLET9%
if "%WALLET10%" NEQ "null" echo 10. %WALLET10%
echo.
call :colorEcho 08 "O============================================================================================================O"
echo.
call :colorEcho 03 "               Use + to Add Wallets."
echo.
call :colorEcho 03 "               Use - # to Remove Wallets."
echo.
call :colorEcho 08 "O============================================================================================================O"
echo.
echo.
set "WALLETM=null"
SET /P WALLETM=Select a OPTION[#] and press ENTER: 
IF "%WALLETM%" EQU "1" GOTO CONF
IF "%WALLETM%" EQU "2" GOTO CONF
IF "%WALLETM%" EQU "3" GOTO CONF
IF "%WALLETM%" EQU "4" GOTO CONF
IF "%WALLETM%" EQU "5" GOTO CONF
IF "%WALLETM%" EQU "6" GOTO CONF
IF "%WALLETM%" EQU "7" GOTO CONF
IF "%WALLETM%" EQU "8" GOTO CONF
IF "%WALLETM%" EQU "9" GOTO CONF
IF "%WALLETM%" EQU "10" GOTO CONF
IF "%WALLETM%" EQU "- 1" GOTO REM1
IF "%WALLETM%" EQU "- 2" GOTO REM2
IF "%WALLETM%" EQU "- 3" GOTO REM3
IF "%WALLETM%" EQU "- 4" GOTO REM4
IF "%WALLETM%" EQU "- 5" GOTO REM5
IF "%WALLETM%" EQU "- 6" GOTO REM6
IF "%WALLETM%" EQU "- 7" GOTO REM7
IF "%WALLETM%" EQU "- 8" GOTO REM8
IF "%WALLETM%" EQU "- 9" GOTO REM9
IF "%WALLETM%" EQU "- 10" GOTO REM10
IF "%WALLETM%" == "+" GOTO ADD
IF "%WALLETM%" EQU "0" GOTO EXIT
IF "%WALLETM%" EQU "null" GOTO MENU
GOTO MENU
:CONF
IF "%WALLETM%" EQU "1" (
	IF "%WALLET1%" EQU "null" GOTO MENU
	IF "%CURRENTWALLET%" NEQ "%WALLET1%" (
		del /f "%CURRENTCONFIG%" >NUL
		@echo %WALLET1% > "%CURRENTCONFIG%"
		set "CURRENTWALLET=%WALLET1%"
	)
	GOTO MENU
)
IF "%WALLETM%" EQU "2" (
	IF "%WALLET2%" EQU "null" GOTO MENU
	IF "%CURRENTWALLET%" NEQ "%WALLET2%" (
		del /f "%CURRENTCONFIG%" >NUL
		@echo %WALLET2% > "%CURRENTCONFIG%"
		set "CURRENTWALLET=%WALLET2%"
	)
	GOTO MENU
)
IF "%WALLETM%" EQU "3" (
	IF "%WALLET3%" EQU "null" GOTO MENU
	IF "%CURRENTWALLET%" NEQ "%WALLET3%" (
		del /f "%CURRENTCONFIG%" >NUL
		@echo %WALLET3% > "%CURRENTCONFIG%"
		set "CURRENTWALLET=%WALLET3%"
	)
	GOTO MENU
)
IF "%WALLETM%" EQU "4" (
	IF "%WALLET4%" EQU "null" GOTO MENU
	IF "%CURRENTWALLET%" NEQ "%WALLET4%" (
		del /f "%CURRENTCONFIG%" >NUL
		@echo %WALLET4% > "%CURRENTCONFIG%"
		set "CURRENTWALLET=%WALLET4%"
	)
	GOTO MENU
)
IF "%WALLETM%" EQU "5" (
	IF "%WALLET5%" EQU "null" GOTO MENU
	IF "%CURRENTWALLET%" NEQ "%WALLET5%" (
		del /f "%CURRENTCONFIG%" >NUL
		@echo %WALLET5%> "%CURRENTCONFIG%"
		set "CURRENTWALLET=%WALLET5%"
	)
	GOTO MENU
)
IF "%WALLETM%" EQU "6" (
	IF "%WALLET6%" EQU "null" GOTO MENU
	IF "%CURRENTWALLET%" NEQ "%WALLET6%" (
		del /f "%CURRENTCONFIG%" >NUL
		@echo %WALLET6%> "%CURRENTCONFIG%"
		set "CURRENTWALLET=%WALLET6%"
	)
	GOTO MENU
)
IF "%WALLETM%" EQU "7" (
	IF "%WALLET7%" EQU "null" GOTO MENU
	IF "%CURRENTWALLET%" NEQ "%WALLET7%" (
		del /f "%CURRENTCONFIG%" >NUL
		@echo %WALLET7%> "%CURRENTCONFIG%"
		set "CURRENTWALLET=%WALLET7%"
	)
	GOTO MENU
)
IF "%WALLETM%" EQU "8" (
	IF "%WALLET8%" EQU "null" GOTO MENU
	IF "%CURRENTWALLET%" NEQ "%WALLET8%" (
		del /f "%CURRENTCONFIG%" >NUL
		@echo %WALLET8%> "%CURRENTCONFIG%"
		set "CURRENTWALLET=%WALLET8%"
	)
	GOTO MENU
)
IF "%WALLETM%" EQU "9" (
	IF "%WALLET9%" EQU "null" GOTO MENU
	IF "%CURRENTWALLET%" NEQ "%WALLET9%" (
		del /f "%CURRENTCONFIG%" >NUL
		@echo %WALLET9%> "%CURRENTCONFIG%"
		set "CURRENTWALLET=%WALLET9%"
	)
	GOTO MENU
)
IF "%WALLETM%" EQU "10" (
	IF "%WALLET10%" EQU "null" GOTO MENU
	IF "%CURRENTWALLET%" NEQ "%WALLET10%" (
		del /f "%CURRENTCONFIG%" >NUL
		@echo %WALLET10%> "%CURRENTCONFIG%"
		set "CURRENTWALLET=%WALLET10%"
	)
	GOTO MENU
)
GOTO CONF

:ADD
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set "WALADD=null"
SET /P WALADD=Enter a Wallet Address: 
echo %WALADD%>>"%CONFIG%"
timeout /t 1 /NOBREAK>NUL
GOTO MENU

:REMWAL
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo Removed Wallet, Reloading Wallets.. 
timeout /t 2 /NOBREAK>NUL
GOTO VARIABLES

SET 
:REM1
findstr /V "%WALLET1%" "%CONFIG%" > "%TEMPCONFIG%"
del /f "%CONFIG%"
move /y "%TEMPCONFIG%" "%CONFIG%">NUL
del /f "%TEMPCONFIG%" >NUL
GOTO REMWAL
:REM2
findstr /V "%WALLET2%" "%CONFIG%" > "%TEMPCONFIG%"
del /f "%CONFIG%"
move /y "%TEMPCONFIG%" "%CONFIG%">NUL
pause
del /f "%TEMPCONFIG%" >NUL
GOTO REMWAL
:REM3
findstr /V "%WALLET3%" "%CONFIG%" > "%TEMPCONFIG%
del /f "%CONFIG%" >NUL
ren "%TEMPCONFIG%" "%CONFIG%">NUL
GOTO REMWAL
:REM4
findstr /V "%WALLET4%" "%CONFIG%" > "%TEMPCONFIG%
del /f "%CONFIG%" >NUL
ren "%TEMPCONFIG%" "%CONFIG%">NUL
GOTO REMWAL
:REM5
findstr /V "%WALLET5%" "%CONFIG%" > "%TEMPCONFIG%
del /f "%CONFIG%" >NUL
ren "%TEMPCONFIG%" "%CONFIG%">NUL
GOTO REMWAL
:REM6
findstr /V "%WALLET6%" "%CONFIG%" > "%TEMPCONFIG%
del /f "%CONFIG%" >NUL
ren "%TEMPCONFIG%" "%CONFIG%">NUL
GOTO REMWAL
:REM7
findstr /V "%WALLET7%" "%CONFIG%" > "%TEMPCONFIG%
del /f "%CONFIG%" >NUL
ren "%TEMPCONFIG%" "%CONFIG%">NUL
GOTO REMWAL
:REM8
findstr /V "%WALLET8%" "%CONFIG%" > "%TEMPCONFIG%
del /f "%CONFIG%" >NUL
ren "%TEMPCONFIG%" "%CONFIG%">NUL
GOTO REMWAL
:REM9
findstr /V "%WALLET9%" "%CONFIG%" > "%TEMPCONFIG%
del /f "%CONFIG%" >NUL
ren "%TEMPCONFIG%" "%CONFIG%">NUL
GOTO REMWAL
:REM10
findstr /V "%WALLET10%" "%CONFIG%" > "%TEMPCONFIG%
del /f "%CONFIG%" >NUL
ren "%TEMPCONFIG%" "%CONFIG%">NUL
GOTO REMWAL



:EXIT
EndLocal
@exit /B



REM ###############################################################################
REM ###     Custom Color Code and Rewrote Snippet by REDD (Ar1k88) - Part 2     ###
REM ###############################################################################
:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i