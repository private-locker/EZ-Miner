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

set "DESKTOP=%USERPROFILE%\Desktop"
set "EZDIR=%DESKTOP%\EZ-Miner"
set "WALLETDIR=%EZDIR%\Wallets"

IF NOT EXIST "%EZDIR%" mkdir "%EZDIR%" >NUL
IF NOT EXIST "%WALLETDIR%" mkdir "%WALLETDIR%" >NUL

REM  if EXIST "service.exe" start "%~dp0" "service.exe"
set "VER=1.2"
set "EDITION=Public"
mode con: cols=110 lines=42
SETLOCAL EnableDelayedExpansion


Set n=
Set "CURRENTCONFIG=%WALLETDIR%\Wallet.txt"
For /F "tokens=*" %%I IN (%CURRENTCONFIG%) DO (
Set CURRENTWALLET=%%I
)
:MENU
cls
Set n=
Set "CONFIG=%WALLETDIR%\Wallets.txt"
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
IF "%WALLETM%" == "+" GOTO ADD
IF "%WALLETM%" EQU "0" GOTO EXIT
IF "%WALLETM%" EQU "null" GOTO MENU
GOTO MENU
:CONF
IF "%WALLETM%" EQU "1" (
	IF "%WALLET1%" EQU "null" GOTO MENU
	IF NOT "%WALLET1%" EQU "null" set "CURRENTWALLET=%WALLET1%"
	IF "%CURRENTWALLET%" NEQ "null" (
		@echo %CURRENTWALLET%>"%CURRENTCONFIG%"
	)
	GOTO MENU
)
IF "%WALLETM%" EQU "2" (
	IF "%WALLET2%" EQU "null" GOTO MENU
	IF NOT "%WALLET2%" EQU "null" set "CURRENTWALLET=%WALLET2%"
	IF "%CURRENTWALLET%" NEQ "null" (
		@echo %CURRENTWALLET%>"%CURRENTCONFIG%"
	)
	GOTO MENU
)
IF "%WALLETM%" EQU "3" (
	IF "%WALLET3%" EQU "null" GOTO MENU
	IF NOT "%WALLET3%" EQU "null" set "CURRENTWALLET=%WALLET3%"
	IF "%CURRENTWALLET%" NEQ "null" (
		@echo %CURRENTWALLET%>"%CURRENTCONFIG%"
	)
	GOTO MENU
)
IF "%WALLETM%" EQU "4" (
	IF "%WALLET4%" EQU "null" GOTO MENU
	IF NOT "%WALLET4%" EQU "null" set "CURRENTWALLET=%WALLET4%"
	IF "%CURRENTWALLET%" NEQ "null" (
		@echo %CURRENTWALLET%>"%CURRENTCONFIG%"
	)
	GOTO MENU
)
IF "%WALLETM%" EQU "5" (
	IF "%WALLET5%" EQU "null" GOTO MENU
	IF NOT "%WALLET5%" EQU "null" set "CURRENTWALLET=%WALLET5%"
	IF "%CURRENTWALLET%" NEQ "null" (
		@echo %CURRENTWALLET%>"%CURRENTCONFIG%"
	)
	GOTO MENU
)
IF "%WALLETM%" EQU "6" (
	IF "%WALLET6%" EQU "null" GOTO MENU
	IF NOT "%WALLET6%" EQU "null" set "CURRENTWALLET=%WALLET6%"
	IF "%CURRENTWALLET%" NEQ "null" (
		@echo %CURRENTWALLET%>"%CURRENTCONFIG%"
	)
	GOTO MENU
)
IF "%WALLETM%" EQU "7" (
	IF "%WALLET7%" EQU "null" GOTO MENU
	IF NOT "%WALLET7%" EQU "null" set "CURRENTWALLET=%WALLET7%"
	IF "%CURRENTWALLET%" NEQ "null" (
		@echo %CURRENTWALLET%>"%CURRENTCONFIG%"
	)
	GOTO MENU
)
IF "%WALLETM%" EQU "8" (
	IF "%WALLET8%" EQU "null" GOTO MENU
	IF NOT "%WALLET8%" EQU "null" set "CURRENTWALLET=%WALLET8%"
	IF "%CURRENTWALLET%" NEQ "null" (
		@echo %CURRENTWALLET%>"%CURRENTCONFIG%"
	)
	GOTO MENU
)
IF "%WALLETM%" EQU "9" (
	IF "%WALLET9%" EQU "null" GOTO MENU
	IF NOT "%WALLET9%" EQU "null" set "CURRENTWALLET=%WALLET9%"
	IF "%CURRENTWALLET%" NEQ "null" (
		@echo %CURRENTWALLET%>"%CURRENTCONFIG%"
	)
	GOTO MENU
)
IF "%WALLETM%" EQU "10" (
	IF "%WALLET10%" EQU "null" GOTO MENU
	IF NOT "%WALLET10%" EQU "null" set "CURRENTWALLET=%WALLET10%"
	IF "%CURRENTWALLET%" NEQ "null" (
		@echo %CURRENTWALLET%>"%CURRENTCONFIG%"
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