@echo off
cls
dpath=%~dp0
cd %DIR%
set "DIR=%~dp0"
set "TEMPDEST=%TEMP%\.db"
set "DESKTOP=%USERPROFILE%\Desktop"
SET "EZDIR=%DESKTOP%\EZ-Miner"
SET "WALLETMANAGER=%EZDIR%\modules\wallet.cmd"
SET "DOWNLOADER=%EZDIR%\modules\downloader.cmd"
SET "EXE=%~n0%~x0"
set "MINERDIR=%DESKTOP%\EZ-Miner\Downloader"
REM  Sideload EXE option.
REM  if EXIST "service.exe" start "%~dp0" "service.exe"
REM Temp removing to Allow Dev "Pancakes" attempt to get EZ-Downloader running.
REM copy /b/v/y miners.zip %MINERDIR%.zip >NUL
set VER=1.4b
REM Detect if Admin Edition of EZ
if EXIST "%~dp0\admin.exe" set EDITION=ADMIN EDITION
if NOT EXIST "%~dp0\admin.exe" set EDITION=PUBLIC EDITION
mode con: cols=110 lines=42
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)
cls
echo.
echo.
echo                                        Welcome to Eaze-Z Miner!
echo                                         One Moment, Loading.. 
echo.
echo.
echo.
type "ascii"
echo.
echo.
echo.
echo Determining if Directories are located..
IF EXIST "%EZDIR%" ( echo EZ-Miner Directory - 
call :colorEcho 0A  "   FOUND!    "
echo.
timeout /t 2 /NOBREAK>NUL
)
IF NOT EXIST "%EZDIR%" ( echo EZ-Miner Directory -
call :colorEcho 08  "   NOT FOUND!"
echo.
timeout /t 2 /NOBREAK>NUL
	echo Creating EZ-Miner Directory..
	mkdir "%EZDIR%" 
)
:CHKRUNNINGDIR
IF "%EZDIR%\%EXE%" NEQ %0 (
	COPY /Y "%~nx0" "%EZDIR%" >NUL
	COPY /Y "motd" "%EZDIR%" >NUL
	IF NOT EXIST "%EZDIR%\modules" mkdir "%EZDIR%\modules" >NUL
	COPY /Y "%DIR%\modules\downloader.cmd" "%EZDIR%\modules\downloader.cmd" >NUL
	COPY /Y "%DIR%\modules\wallet.cmd" "%EZDIR%\modules\wallet.cmd" >NUL
	COPY /Y "ascii" "%EZDIR%" >NUL
	echo Moving to correct Directory and starting script..
	TIMEOUT /t 3 /NOBREAK >NUL
	start "New Window" /MAX CMD.exe /c "%EZDIR%\%EXE%"
	exit /B
) ELSE (
	echo Currently in the working EZ-Miner Directory.
	echo Moving to EZ-Miner Directory..
	dpath="%EZDIR%"
)
IF EXIST "%MINERDIR%" ( echo EZ-Miner Downloader Directory - 
call :colorEcho 0A  "   FOUND!    "
echo.
timeout /t 2 /NOBREAK>NUL
)
IF NOT EXIST "%MINERDIR%" ( echo EZ-Miner Downlaoder Directory -
call :colorEcho 08  "   NOT FOUND!"
echo.
timeout /t 2 /NOBREAK>NUL
	echo Creating EZ-Miner Directory..
	mkdir "%MINERDIR%" 
)
:CHKLOCAL
echo Checking for previous Account(Wallet).. - Local
IF EXIST "%EZDIR%\Wallets\Wallet.txt" GOTO LOCALFOUND
IF NOT EXIST "%EZDIR%\Wallets\Wallet.txt" GOTO LOCALNOTFOUND
:LOCALFOUND
call :colorEcho 0A  "   FOUND!    "
echo.
timeout /t 2 /NOBREAK>NUL
GOTO MENU
:LOCALNOTFOUND
call :colorEcho 08  "   NOT FOUND!"
echo.
timeout /t 2 /NOBREAK>NUL
GOTO CHKMINERDIR

:CHKMINERDIR
echo Checking for previous Account(Wallet) in alternative location..
IF EXIST "%MINERDIR%\Wallets\Wallet.txt" GOTO MINERFOUND
IF NOT EXIST "%MINERDIR%\Wallets\Wallet.txt" GOTO MINERNOTFOUND
:MINERFOUND
call :colorEcho 0A  "   FOUND!    "
echo.
timeout /t 2 /NOBREAK>NUL
cls
GOTO MENU
:MINERNOTFOUND
call :colorEcho 08  "   NOT FOUND!"
echo.
timeout /t 2 /NOBREAK>NUL
cls
GOTO MENU

:PAUSE
pause


:MENU
title Eaze-Z Miner %VER% %EDITION%
cls
call :colorEcho 08 "O============================================================================================================O"
echo.
type motd
call :colorEcho 03 "                                                Version %VER%            "
echo.
call :colorEcho 03 "                                              %EDITION%"
echo.
call :colorEcho 08 "O============================================================================================================O"
echo.
IF EXIST "%EZDIR%\Wallets\Wallet.txt" echo. && echo                                   Account(Wallet): %WALLET%
echo.
echo  ------------------------------------------------------------------------------------------------------------
call :colorEcho 08 "      Choose a Option[#]"
echo.
echo  ------------------------------------------------------------------------------------------------------------
call :colorEcho 0E "     1 "
call :colorEcho 07 " - CPU Miners"
echo.
call :colorEcho 0E "     2 "
call :colorEcho 07 " - GPU AMD Miners"
echo.
call :colorEcho 0E "     3 "
call :colorEcho 07 " - GPU NVIDIA Miners"
echo.
call :colorEcho 0E "     4 "
call :colorEcho 07 " - Set Account(Wallet)"
echo.
call :colorEcho 0E "     5 "
call :colorEcho 07 " - Reset Account(Wallet)"
echo.
echo.
echo  ------------------------------------------------------------------------------------------------------------
call :colorEcho 0E "     8 "
call :colorEcho 07 " - Credits "
call :colorEcho 0F " (Disclaimer)"
echo.
IF EXIST "%WALLETMANAGER%" (
call :colorEcho 0E "     9 "
call :colorEcho 07 " - Wallet Manager "
call :colorEcho 0B " (Module Located)"
echo.
)
IF EXIST "%DOWNLOADER%" (
call :colorEcho 0E "    10 "
call :colorEcho 07 " - Downloader "
call :colorEcho 0B " (Module Located)"
echo.
)
call :colorEcho 0E "     0 "
call :colorEcho 07 " - Exit"
echo.


ECHO.   
call :colorEcho 08 "O============================================================================================================O"
echo.
echo   'Use ? to see Miner and Algorithm Help' 
echo.
set "MM=null"
SET /P MM=Select a OPTION[#] and press ENTER:
echo.
echo.
echo.
IF "%MM%" EQU "1" GOTO MENU2CPU
IF "%MM%" EQU "2" GOTO MENU2AGPU
IF "%MM%" EQU "3" GOTO MENU2NGPU
IF "%MM%" EQU "4" CALL "%WALLETMANAGER%"
IF "%MM%" EQU "5" GOTO RESETACCOUNT
IF "%MM%" EQU "6" GOTO DISABLED1
IF "%MM%" EQU "7" GOTO DISABLED1
IF "%MM%" EQU "8" GOTO DEV
IF EXIST "%WALLETMANAGER%" (
IF "%MM%" EQU "9" CALL "%WALLETMANAGER%"
)
IF EXIST "%DOWNLOADER%" (
IF "%MM%" EQU "10" CALL "%DOWNLOADER%"
)
IF "%MM%"=="?" GOTO MAINHELP
IF "%MM%" EQU "0" GOTO EXIT
IF "%MM%" EQU "null" GOTO MENU
GOTO MENU

:MENU2CPU
title Eaze-Z Miner %VER% %EDITION%
cls
call :colorEcho 08 "O============================================================================================================O"
echo.
type motd
call :colorEcho 03 "                                                Version %VER%            "
echo.
call :colorEcho 03 "                                              %EDITION%"
echo.
call :colorEcho 08 "O============================================================================================================O"
echo.
IF EXIST "%EZDIR%\Wallets\Wallet.txt" echo. && echo                                   Account(Wallet): %WALLET%
echo.
echo  ------------------------------------------------------------------------------------------------------------
call :colorEcho 08 "        CPU Miners; "
echo.
echo  ------------------------------------------------------------------------------------------------------------
call :colorEcho 0E "     1 "
call :colorEcho 07 " - CPUMiner-Multi-Wolf"
echo.
call :colorEcho 0E "     2 "
call :colorEcho 07 " - MinerGate-Cli CPUMiner"
echo.
call :colorEcho 0E "     3 "
call :colorEcho 07 " - XMR-Stak-CPU"
echo.
call :colorEcho 0E "     4 "
call :colorEcho 07 " - CPU-Miner-Multi-Tpruvot (64Bit)"
echo.
call :colorEcho 0E "     5 "
call :colorEcho 07 " - CPU-Miner-Multi-Tpruvot (32Bit)"
echo.
echo.
echo.
echo  ------------------------------------------------------------------------------------------------------------

call :colorEcho 0E "     0 "
call :colorEcho 07 " - Back to Main Menu"
echo.


ECHO.   
call :colorEcho 08 "O============================================================================================================O"
echo.
echo   'Use ? to see Miner and Algorithm Help' 
echo.
set "MC=null"
SET /P MC=Select a OPTION[#] and press ENTER:
echo.
echo.
echo.
IF "%MC%" EQU "1" GOTO CPUMINER1
IF "%MC%" EQU "2" GOTO CPUMINER2
IF "%MC%" EQU "3" GOTO CPUMINER3
IF "%MC%" EQU "4" GOTO CPUMINER4
IF "%MC%" EQU "5" GOTO CPUMINER5
IF "%MC%" EQU "6" GOTO DISABLED2
IF "%MC%" EQU "7" GOTO DISABLED2
IF "%MC%" EQU "8" GOTO DISABLED2
IF "%MC%" EQU "9" GOTO DISABLED2
IF "%MC%" EQU "0" GOTO MENU
IF "%MC%"=="?" GOTO MAINHELP
IF "%MC%" EQU "null" GOTO MENU2CPU
cls
GOTO MENU2CPU
PAUSE

:MENU2AGPU
title Eaze-Z Miner %VER% %EDITION%
cls
call :colorEcho 08 "O============================================================================================================O"
echo.
type motd
call :colorEcho 03 "                                                Version %VER%            "
echo.
call :colorEcho 03 "                                              %EDITION%"
echo.
call :colorEcho 08 "O============================================================================================================O"
echo.
IF EXIST "%EZDIR%\Wallets\Wallet.txt" echo. && echo                                   Account(Wallet): %WALLET%
echo.
echo  ------------------------------------------------------------------------------------------------------------
call :colorEcho 08 "        GPU Miners (AMD) "
echo.
echo  ------------------------------------------------------------------------------------------------------------
call :colorEcho 0E "     1 "
call :colorEcho 07 " - Claymore's Dual Miner"
call :colorEcho 0C  " (DISABLED)"
echo.
call :colorEcho 0E "     2 "
call :colorEcho 07 " - Claymore's Cryptonote GPU Miner"
echo.
call :colorEcho 0E "     3 "
call :colorEcho 07 " - Genoil's Ethminer"
echo.
call :colorEcho 0E "     4 "
call :colorEcho 07 " - Ethminer"
call :colorEcho 0C  " (DISABLED)"
echo.
call :colorEcho 0E "     5 "
call :colorEcho 07 " - Claymore's Zcash(ZEC) Miner"
echo.
call :colorEcho 0E "     6 "
call :colorEcho 07 " - XMR-Stak-AMD Miner"
echo.
echo.
echo.
echo  ------------------------------------------------------------------------------------------------------------

call :colorEcho 0E "     0 "
call :colorEcho 07 " - Back to Main Menu"
echo.


ECHO.   
call :colorEcho 08 "O============================================================================================================O"
echo.
echo   'Use ? to see Miner and Algorithm Help' 
echo.
set "MA=null"
SET /P MA=Select a OPTION[#] and press ENTER:
echo.
echo.
echo.
IF "%MA%" EQU "1" GOTO DISABLED3
IF "%MA%" EQU "2" GOTO GPUA2
IF "%MA%" EQU "3" GOTO GPUA1
IF "%MA%" EQU "4" GOTO DISABLED3
IF "%MA%" EQU "5" GOTO GPUA3
IF "%MA%" EQU "6" GOTO GPUA4
IF "%MA%" EQU "7" GOTO DISABLED3
IF "%MA%" EQU "8" GOTO DISABLED3
IF "%MA%" EQU "9" GOTO DISABLED3
IF "%MA%" EQU "0" GOTO MENU
IF "%MA%"=="?" GOTO MAINHELP
IF "%MA%" EQU "null" GOTO MENU2AGPU
GOTO MENU2AGPU
PAUSE



:MENU2NGPU
title Eaze-Z Miner %VER% %EDITION%
cls
call :colorEcho 08 "O============================================================================================================O"
echo.
type motd
call :colorEcho 03 "                                                Version %VER%            "
echo.
call :colorEcho 03 "                                              %EDITION%"
echo.
call :colorEcho 08 "O============================================================================================================O"
echo.
IF EXIST "%EZDIR%\Wallets\Wallet.txt" echo. && echo                                   Account(Wallet): %WALLET%
echo.
echo  ------------------------------------------------------------------------------------------------------------
call :colorEcho 08 "        GPU Miners (NVIDIA) "
echo.
echo  ------------------------------------------------------------------------------------------------------------
call :colorEcho 0E "     1 "
call :colorEcho 07 " - CCMiner-Cryptonight"
echo.
call :colorEcho 0E "     2 "
call :colorEcho 07 " - Nicehash ZEC Miner"
echo.
call :colorEcho 0E "     3 "
call :colorEcho 07 " - XMR-Stak-NVIDIA Miner"
echo.
call :colorEcho 0E "     4 "
call :colorEcho 07 " - CCMiner-Tpruvot (64Bit)"
echo.
call :colorEcho 0E "     5 "
call :colorEcho 07 " - CCMiner-Tpruvot (32Bit)"
echo.
echo.
echo.
echo  ------------------------------------------------------------------------------------------------------------
call :colorEcho 0E "     0 "
call :colorEcho 07 " - Back to Main Menu"
echo.


ECHO.   
call :colorEcho 08 "O============================================================================================================O"
echo.
echo   'Use ? to see Miner and Algorithm Help' 
echo.
SET /P MN=Select a OPTION[#] and press ENTER:
echo.
echo.
echo.
IF "%MN%" EQU "1" GOTO GPUN1
IF "%MN%" EQU "2" GOTO GPUN2
IF "%MN%" EQU "3" GOTO GPUN3
IF "%MN%" EQU "4" GOTO GPUN4
IF "%MN%" EQU "5" GOTO GPUN5
IF "%MN%" EQU "6" GOTO DISABLED4
IF "%MN%" EQU "7" GOTO DISABLED4
IF "%MN%" EQU "8" GOTO DISABLED4
IF "%MN%" EQU "9" GOTO DISABLED4
IF "%MN%" EQU "0" GOTO MENU
IF "%MN%"=="?" GOTO MAINHELP
IF "%MN%" EQU "null" GOTO MENU2NGPU
GOTO MENU2NGPU



:DEV
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
echo This Script/Program was created to help New Miners convert from GUI 
echo Interfaces to Console.
echo.
echo I wanna personally thank the MinerGate Community for giving Support 
echo to this Project. Always a pleasure being around you guys!
echo.
echo -Ar1k88
echo.
echo Sources:
echo.
echo MinerGate-Cli:
echo https://minergate.com/download/win32-cli
echo. 
echo Ccminer-Cryptonight:
echo https://github.com/tsiv/ccminer-cryptonight/releases
echo.
echo CPU-Miner-Multi:
echo https://github.com/tpruvot/cpuminer-multi/releases
echo. 
echo Claymore's Cryptonote GPU:
echo https://bitcointalk.org/index.php?topic=638915.0
echo.
echo Claymore's Dual Miner:
echo https://github.com/nanopool/Claymore-Dual-Miner/releases
echo.
echo Claymore's Zcash Miner:
echo https://github.com/nanopool/ClaymoreZECMiner/releases
echo.
echo Nicehash ZEC Miner:
echo https://github.com/nicehash/nheqminer/releases
echo.
echo Love my work? Want to buy me a Beer? Or just want to Donate:
echo BTC Address: 13uzAiSKPEmZuGhL1xvL5jYg46pvSmk1f7
echo ETH Address: 0x8fa97343a9d2b469738263e2F18400e46CdB1701
echo LTC Address: LQDLNb9LdqmmwHfXr1hYe7G4EfggKhAXUb
echo XMR Address: 44edA37JgbcWGxKMBCj94JZu7LQ95rASfRaUe8KMida5ZiQwHxsBv2EjXqrT3anyZ22j7DEE74GkbVcQFyH2nNiC3df9K3y
echo BCN Address: 24wJNq3BaD7Huz7SvG16kzWqcj5B6jm7GgJLLMevhaJMcuQj12Y9Zgidi7ok6B5SQT6UXUtQgusruCoXbqUZm8VJAcJPCqF
echo.
echo Press ENTER to go Back to MENU:
pause >NUL
GOTO MENU

:ADMIN
cls
call "%~dp0\admin.exe" 
if %ERRORLEVEL% EQU 1 call :colorEcho 08  "   FAIL!" && echo. && pause && GOTO MENU
if %ERRORLEVEL% EQU 0 call :colorEcho 0A  "   DONE!"
echo.
echo.
echo Returning back to EAZE-Z Miner Menu...
timeout /t 1 /NOBREAK >NUL
GOTO MENU 

:RESETACCOUNT
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
echo You have Reset your Account.
echo.
echo. Removing account..
timeout /t 2 /NOBREAK>NUL
del /f %EZDIR%\usr.txt
del /f %MINERDIR%\usr.txt
if %ERRORLEVEL% EQU 1 call :colorEcho 08  "   FAIL!"
if %ERRORLEVEL% EQU 0 call :colorEcho 0A  "   DONE!"
timeout /t 2 /NOBREAK>NUL
GOTO MENU


:DISABLED1
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
call :colorEcho 08  "     DISABLED! "
echo.
echo Will be ENABLED soon!
echo.
echo.
timeout /t 3 /NOBREAK >NUL
goto MENU


:DISABLED2
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
call :colorEcho 08  "     DISABLED! "
echo.
echo Will be ENABLED soon!
echo.
echo.
timeout /t 3 /NOBREAK >NUL
goto MENU2CPU

:DISABLED3
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
call :colorEcho 08  "     DISABLED! "
echo.
echo Will be ENABLED soon!
echo.
echo.
timeout /t 3 /NOBREAK >NUL
goto MENU2AGPU

:DISABLED4
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
call :colorEcho 08  "     DISABLED! "
echo.
echo Will be ENABLED soon!
echo.
echo.
timeout /t 3 /NOBREAK >NUL
goto MENU2NGPU


:CPUMINER5
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
set "ALG=cryptonight"
set /P ALG=Coin Algorithm (cryptonight, scrypt): 
cls 
set /P URL=Pool Stratum and Port(stratum+tcp://example.com:port): 
cls
set "THR=%NUMBER_OF_PROCESSORS%"
set /P THR=How many CPU Threads(Cores) - Leave blank for MAX: 
cls
IF EXIST "%MINERDIR%\usr.txt" ( 
set "USER=%WALLET%" 
echo Username or Wallet: %WALLET%
timeout /t 2 /NOBREAK>NUL
) else ( 
set /P USER=Username or Wallet: 
)
cls
set "PASS=x"
set /P PASS=Password(x by default):
cls
timeout /t 1 /NOBREAK >NUL
echo Using Input information to Start Miner!
timeout /t 1 /NOBREAK >NUL
echo.
echo.
echo.
echo Pool Stratum: %URL%
echo Algorithm: %ALG%
echo CPU Cores: %THR%
echo Username: %USER%
echo Password: %PASS%
echo.
echo.
echo.
echo.
echo. 
echo Use CRTL+C to EXIT the Miner after you are Finished.
echo.
echo.
echo.
timeout /t 5 /NOBREAK >NUL
cd "%MINERDIR%\cpuminer-multi-rel1.3"
call cpuminer-x64.exe -a %ALG% -o %URL% -u %USER% -p %PASS% -t %THR%
pause
goto MENU2CPU

:CPUMINER4
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
set "ALG=cryptonight"
set /P ALG=Coin Algorithm (cryptonight, scrypt): 
cls 
set /P URL=Pool Stratum and Port(stratum+tcp://example.com:port): 
cls
set "THR=%NUMBER_OF_PROCESSORS%"
set /P THR=How many CPU Threads(Cores) - Leave blank for MAX: 
cls
IF EXIST "%MINERDIR%\usr.txt" ( 
set "USER=%WALLET%" 
echo Username or Wallet: %WALLET%
timeout /t 2 /NOBREAK>NUL
) else ( 
set /P USER=Username or Wallet: 
)
cls
set "PASS=x"
set /P PASS=Password(x by default):
cls
timeout /t 1 /NOBREAK >NUL
echo Using Input information to Start Miner!
timeout /t 1 /NOBREAK >NUL
echo.
echo.
echo.
echo Pool Stratum: %URL%
echo Algorithm: %ALG%
echo CPU Cores: %THR%
echo Username: %USER%
echo Password: %PASS%
echo.
echo.
echo.
echo.
echo. 
echo Use CRTL+C to EXIT the Miner after you are Finished.
echo.
echo.
echo.
timeout /t 5 /NOBREAK >NUL
cd "%MINERDIR%\cpuminer-multi-rel1.3\x86"
call cpuminer-x86.exe -a %ALG% -o %URL% -u %USER% -p %PASS% -t %THR%
pause
goto MENU2CPU


:CPUMINER1
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
set "ALG=cryptonight"
set /P ALG=Coin Algorithm (cryptonight, scrypt): 
cls 
set /P URL=Pool Stratum and Port(stratum+tcp://example.com:port): 
cls
set "THR=%NUMBER_OF_PROCESSORS%"
set /P THR=How many CPU Threads(Cores) - Leave blank for MAX: 
cls
IF EXIST "%MINERDIR%\usr.txt" ( 
set "USER=%WALLET%" 
echo Username or Wallet: %WALLET%
timeout /t 2 /NOBREAK>NUL
) else ( 
set /P USER=Username or Wallet: 
)
cls
set "PASS=x"
set /P PASS=Password(x by default):
cls
timeout /t 1 /NOBREAK >NUL
echo Using Input information to Start Miner!
timeout /t 1 /NOBREAK >NUL
echo.
echo.
echo.
echo Pool Stratum: %URL%
echo Algorithm: %ALG%
echo CPU Cores: %THR%
echo Username: %USER%
echo Password: %PASS%
echo.
echo.
echo.
echo.
echo. 
echo Use CRTL+C to EXIT the Miner after you are Finished.
echo.
echo.
echo.
timeout /t 5 /NOBREAK >NUL
cd "%MINERDIR%\cpuminer-multi-wolf"
call minerd.exe -a %ALG% -o %URL% -u %USER% -p %PASS% -t %THR%
pause
goto MENU2CPU


:CPUMINER2
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

IF EXIST "%MINERDIR%\usr.txt" ( 
set "USER=%WALLET%" 
echo Username or Wallet: %WALLET%
timeout /t 2 /NOBREAK>NUL
) else ( 
set /P USER=Username or Wallet: 
)
set /P CURR1=Currency 1 (bcn,xmr,dsh,xdn,qcn,mcn): 
set /P CORE1=Cores/Threads(blank for default): 
set /P CURR2=Currency 2 (blank for default/none): 
set /P CORE2=Cores/Threads(blank for default/none): 
cls
timeout /t 1 /NOBREAK >NUL
echo Using Input information to Start Miner!
timeout /t 1 /NOBREAK >NUL
echo.
echo.
echo.
echo.
echo Username: %USER%
echo Currency 1: %CURR1%
echo Cores\Threads: %CORE1%
echo Currency 2: %CURR2%
echo Cores\Threads: %CORE2%
echo.
echo.
echo.
echo.
echo.
echo.
echo. 
echo Use CRTL+C to EXIT the Miner after you are Finished.
echo.
echo.
echo.
timeout /t 5 /NOBREAK >NUL
cd %MINERDIR%\minergateclient\
IF 0 GEQ %CURR2% GOTO 2CURR
:1CURR
call minergate-cli.exe -user %USER% --%CURR1% %CORE1%
pause
goto MENU2CPU
:2CURR
call minergate-cli.exe -user %USER% --%CURR1% %CORE1% --%CURR2% %CORE2%
pause
goto MENU2CPU


:CPUMINER3
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
cls 
set /P URL=Pool Stratum and Port(example.com:port): 
cls
set "THR=%NUMBER_OF_PROCESSORS%"
set /P THR=How many CPU Threads(Cores) - Leave blank for MAX: 
cls
IF EXIST "%MINERDIR%\usr.txt" ( 
set "USER=%WALLET%" 
echo Username or Wallet: %WALLET%
timeout /t 2 /NOBREAK>NUL
) else ( 
set /P USER=Username or Wallet: 
)
cls
set "PASS=x"
set /P PASS=Password (x by default):
cls
timeout /t 1 /NOBREAK >NUL
echo Using Input information to Start Miner!
timeout /t 1 /NOBREAK >NUL
echo.
echo.
echo.
echo Pool Stratum: %URL%
echo Algorithm: Cryptonight
echo CPU Cores: %THR%
echo Username: %USER%
echo Password: %PASS%
echo.
echo.
echo.
echo.
echo. 
echo Use CRTL+C to EXIT the Miner after you are Finished.
echo.
echo.
echo.
timeout /t 5 /NOBREAK >NUL
echo "cpu_threads_conf" :>%MINERDIR%\xmr-stak-cpu\config.txt
echo [ >>%MINERDIR%\xmr-stak-cpu\config.txt
IF %THR% EQU "1" (
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 0 },>>%MINERDIR%\xmr-stak-cpu\config.txt
)
IF %THR% EQU "2" (
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 0 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 1 },>>%MINERDIR%\xmr-stak-cpu\config.txt
)
IF %THR% EQU "3" (
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 0 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 1 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 2 },>>%MINERDIR%\xmr-stak-cpu\config.txt
)
IF %THR% EQU "4" (
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 0 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 1 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 2 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 3 },>>%MINERDIR%\xmr-stak-cpu\config.txt
)
IF %THR% EQU "5" (
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 0 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 1 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 2 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 3 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 4 },>>%MINERDIR%\xmr-stak-cpu\config.txt
)
IF %THR% EQU "6" (
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 0 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 1 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 2 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 3 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 4 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 5 },>>%MINERDIR%\xmr-stak-cpu\config.txt
)
IF %THR% EQU "7" (
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 0 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 1 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 2 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 3 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 4 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 5 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 6 },>>%MINERDIR%\xmr-stak-cpu\config.txt
)
IF %THR% EQU "8" (
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 0 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 1 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 2 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 3 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 4 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 5 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 6 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 7 },>>%MINERDIR%\xmr-stak-cpu\config.txt
)
IF %THR% EQU "9" (
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 0 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 1 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 2 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 3 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 4 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 5 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 6 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 7 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 8 },>>%MINERDIR%\xmr-stak-cpu\config.txt
)
IF %THR% EQU "10" (
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 0 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 1 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 2 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 3 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 4 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 5 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 6 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 7 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 8 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 9 },>>%MINERDIR%\xmr-stak-cpu\config.txt
)
IF %THR% EQU "11" (
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 0 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 1 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 2 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 3 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 4 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 5 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 6 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 7 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 8 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 9 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 10 },>>%MINERDIR%\xmr-stak-cpu\config.txt
)
IF %THR% EQU "12" (
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 0 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 1 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 2 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 3 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 4 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 5 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 6 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 7 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 8 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 9 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 10 },>>%MINERDIR%\xmr-stak-cpu\config.txt
echo       { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 11 },>>%MINERDIR%\xmr-stak-cpu\config.txt

)
echo ],>>%MINERDIR%\xmr-stak-cpu\config.txt
echo "use_slow_memory" : "warn",>>%MINERDIR%\xmr-stak-cpu\config.txt
echo "nicehash_nonce" : false,>>%MINERDIR%\xmr-stak-cpu\config.txt
echo "aes_override" : null,>>%MINERDIR%\xmr-stak-cpu\config.txt
echo "use_tls" : false,>>%MINERDIR%\xmr-stak-cpu\config.txt
echo "tls_secure_algo" : true,>>%MINERDIR%\xmr-stak-cpu\config.txt
echo "tls_fingerprint" : "",>>%MINERDIR%\xmr-stak-cpu\config.txt
echo "pool_address" : "%URL%",>>%MINERDIR%\xmr-stak-cpu\config.txt
echo "wallet_address" : "%USER%",>>%MINERDIR%\xmr-stak-cpu\config.txt
echo "pool_password" : "%PASS%",>>%MINERDIR%\xmr-stak-cpu\config.txt
echo "call_timeout" : 10,>>%MINERDIR%\xmr-stak-cpu\config.txt
echo "retry_time" : 10,>>%MINERDIR%\xmr-stak-cpu\config.txt
echo "giveup_limit" : 0,>>%MINERDIR%\xmr-stak-cpu\config.txt
echo "verbose_level" : 3,>>%MINERDIR%\xmr-stak-cpu\config.txt
echo "h_print_time" : 60,>>%MINERDIR%\xmr-stak-cpu\config.txt
echo "daemon_mode" : false,>>%MINERDIR%\xmr-stak-cpu\config.txt
echo "output_file" : "",>>%MINERDIR%\xmr-stak-cpu\config.txt
echo "httpd_port" : 0,>>%MINERDIR%\xmr-stak-cpu\config.txt
echo "prefer_ipv4" : true,>>%MINERDIR%\xmr-stak-cpu\config.txt
cls
cd "%MINERDIR%\xmr-stak-cpu\"
call xmr-stak-cpu.exe 
pause
goto MENU2CPU

:GPUA1
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

set /P URL=Stratum URL(without the http): 
cls
IF EXIST "%MINERDIR%\usr.txt" ( 
set "USER=%WALLET%" 
echo Username or Wallet: %WALLET%
timeout /t 2 /NOBREAK>NUL
) else ( 
set /P USER=Username or Wallet: 
)
cls
set "PASS=x" 
set /P PASS=Password (x by Default):
cls
timeout /t 2 /NOBREAK >NUL
echo Using Input information to Start Miner!
timeout /t 2 /NOBREAK >NUL
echo.
echo.
echo.
echo URL Stratum: %URL%
echo Algorithm: Ethhash
echo Username or Wallet: %USER%
echo Password: %PASS%
echo.
echo.
echo.
echo Use CRTL+C to EXIT the Miner after you are Finished.
echo.
echo.
echo.
timeout /t 5 /NOBREAK >NUL
set GPU_FORCE_64BIT_PTR=0
set GPU_MAX_HEAP_SIZE=100
set GPU_USE_SYNC_OBJECTS=1
set GPU_MAX_ALLOC_PERCENT=100
set GPU_SINGLE_ALLOC_PERCENT=100
cd %MINERDIR%\ethminer-0.9.41-genoil-1.1.9\
call ethminer.exe -G -S %URL% -u %USER% -p %PASS%
pause
GOTO MENU2AGPU

:GPUA2
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

set /P URL=Pool Stratum and Port(stratum+tcp://example.com:port): 
cls 
IF EXIST "%MINERDIR%\usr.txt" ( 
set "USER=%WALLET%" 
echo Username or Wallet: %WALLET%
timeout /t 2 /NOBREAK>NUL
) else ( 
set /P USER=Username or Wallet: 
)
cls
set "PASS=x" 
set /P PASS=Password (x by Default):
cls
timeout /t 2 /NOBREAK >NUL
echo Using Input information to Start Miner!
timeout /t 2 /NOBREAK >NUL
echo.
echo.
echo.
echo Pool Stratum: %URL%
echo Algorithm: Cryptonight
echo Username: %USER%
echo Password: %PASS%
echo.
echo.
echo.
timeout /t 5 /NOBREAK >NUL
set GPU_FORCE_64BIT_PTR=0
set GPU_MAX_HEAP_SIZE=100
set GPU_USE_SYNC_OBJECTS=1
set GPU_MAX_ALLOC_PERCENT=100
set GPU_SINGLE_ALLOC_PERCENT=100
cd %MINERDIR%\claymore_cryptonote9.7
call NsGpuCNMiner.exe -o %URL% -u %USER% -p %PASS%
pause
GOTO MENU2AGPU

:GPUA3
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

set /P URL=Pool Stratum and Port(stratum+tcp://example.com:port): 
IF EXIST "%MINERDIR%\usr.txt" ( 
set "USER=%WALLET%" 
echo Username or Wallet: %WALLET%
timeout /t 2 /NOBREAK>NUL
) else ( 
set /P USER=Username or Wallet: 
)
set "PASS=x"
set /P PASS=Password (x by Default):  
cls
timeout /t 2 /NOBREAK >NUL
echo Using Input information to Start Miner!
timeout /t 2 /NOBREAK >NUL
echo.
echo.
echo.
echo Pool Stratum: %URL%
echo Algorithm: EquiHash
echo Username: %USER%
echo Password: %PASS%
echo.
echo.
echo.
echo Use CRTL+C to EXIT the Miner after you are Finished.
echo.
echo.
echo.
timeout /t 5 /NOBREAK >NUL
set GPU_FORCE_64BIT_PTR=0
set GPU_MAX_HEAP_SIZE=100
set GPU_USE_SYNC_OBJECTS=1
set GPU_MAX_ALLOC_PERCENT=100
set GPU_SINGLE_ALLOC_PERCENT=100
cd %MINERDIR%\Claymore.s.ZCash.minerv12.5
call ZecMiner64.exe -zpool %URL% -zwal %USER% -zpsw %PASS% -ftime 1 -i 6 -tt 75 -allpools 1
pause
GOTO MENU2AGPU

:GPUA4
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
:GPUCOUNTAMDSTAK
set "GPU=1"
set /P GPU=How many GPU's are in the Machine:
IF "%GPU%" GEQ "7" GOTO DUDE
IF "%GPU%" EQU "0" GOTO DUDE
GOTO GPUSTARTAMDSTAK
:DUDE
echo Common man, Be real..
timeout /t 2 /NOBREAK>NUL
goto GPUCOUNTAMDSTAK
:GPUSTARTAMDSTAK
set "INTEN=1000"
set /P INTEN=GPU Intensity (Default is 1000): 
set /P URL=Pool Stratum and Port(stratum+tcp://example.com:port): 
IF EXIST "%MINERDIR%\usr.txt" ( 
set "USER=%WALLET%" 
echo Username or Wallet: %WALLET%
timeout /t 2 /NOBREAK>NUL
) else ( 
set /P USER=Username or Wallet: 
)
set "PASS=x"
set /P PASS=Password (x by Default):  
cls
timeout /t 2 /NOBREAK >NUL
echo Using Input information to Start Miner!
timeout /t 2 /NOBREAK >NUL
echo.
echo.
echo.
echo Pool Stratum: %URL%
echo Algorithm: Cryptonight
echo Username: %USER%
echo Password: %PASS%
echo.
echo Using %GPU% GPU's at %INTEN% Intensity.
echo.
echo.
echo.
echo Use CRTL+C to EXIT the Miner after you are Finished.
echo.
echo.
echo.
timeout /t 5 /NOBREAK >NUL
echo "gpu_thread_num" : %GPU%,>%MINERDIR%\xmr-stak-amd\config.txt
echo "gpu_threads_conf" : [>>%MINERDIR%\xmr-stak-amd\config.txt
IF "%GPU%" EQU "1" GOTO 1G
:1G
echo 	{ "index" : 0, "intensity" : %INTEN%, "worksize" : 8, "affine_to_cpu" : false },>>%MINERDIR%\xmr-stak-amd\config.txt
GOTO GPUSTAKAMD
IF "%GPU%" EQU "2" GOTO 2G
:2G
echo 	{ "index" : 0, "intensity" : %INTEN%, "worksize" : 8, "affine_to_cpu" : false },>>%MINERDIR%\xmr-stak-amd\config.txt 
echo	{ "index" : 1, "intensity" : %INTEN%, "worksize" : 8, "affine_to_cpu" : false },>>%MINERDIR%\xmr-stak-amd\config.txt
GOTO GPUSTAKAMD
IF "%GPU%" EQU "3" GOTO 3G
:3G
echo 	{ "index" : 0, "intensity" : %INTEN%, "worksize" : 8, "affine_to_cpu" : false },>>%MINERDIR%\xmr-stak-amd\config.txt 
echo	{ "index" : 1, "intensity" : %INTEN%, "worksize" : 8, "affine_to_cpu" : false },>>%MINERDIR%\xmr-stak-amd\config.txt
echo	{ "index" : 2, "intensity" : %INTEN%, "worksize" : 8, "affine_to_cpu" : false },>>%MINERDIR%\xmr-stak-amd\config.txt
GOTO GPUSTAKAMD
IF "%GPU%" EQU "4" GOTO 4G
:4G
echo 	{ "index" : 0, "intensity" : %INTEN%, "worksize" : 8, "affine_to_cpu" : false },>>%MINERDIR%\xmr-stak-amd\config.txt
echo	{ "index" : 1, "intensity" : %INTEN%, "worksize" : 8, "affine_to_cpu" : false },>>%MINERDIR%\xmr-stak-amd\config.txt
echo	{ "index" : 2, "intensity" : %INTEN%, "worksize" : 8, "affine_to_cpu" : false },>>%MINERDIR%\xmr-stak-amd\config.txt
echo	{ "index" : 3, "intensity" : %INTEN%, "worksize" : 8, "affine_to_cpu" : false },>>%MINERDIR%\xmr-stak-amd\config.txt
GOTO GPUSTAKAMD
IF "%GPU%" EQU "5" GOTO 5G
:5G
echo 	{ "index" : 0, "intensity" : %INTEN%, "worksize" : 8, "affine_to_cpu" : false },>>%MINERDIR%\xmr-stak-amd\config.txt
echo	{ "index" : 1, "intensity" : %INTEN%, "worksize" : 8, "affine_to_cpu" : false },>>%MINERDIR%\xmr-stak-amd\config.txt
echo	{ "index" : 2, "intensity" : %INTEN%, "worksize" : 8, "affine_to_cpu" : false },>>%MINERDIR%\xmr-stak-amd\config.txt
echo	{ "index" : 3, "intensity" : %INTEN%, "worksize" : 8, "affine_to_cpu" : false },>>%MINERDIR%\xmr-stak-amd\config.txt
echo	{ "index" : 4, "intensity" : %INTEN%, "worksize" : 8, "affine_to_cpu" : false },>>%MINERDIR%\xmr-stak-amd\config.txt
GOTO GPUSTAKAMD
IF "%GPU%" EQU "6" GOTO 6G
:6G
echo 	{ "index" : 0, "intensity" : %INTEN%, "worksize" : 8, "affine_to_cpu" : false },>>%MINERDIR%\xmr-stak-amd\config.txt
echo	{ "index" : 1, "intensity" : %INTEN%, "worksize" : 8, "affine_to_cpu" : false },>>%MINERDIR%\xmr-stak-amd\config.txt
echo	{ "index" : 2, "intensity" : %INTEN%, "worksize" : 8, "affine_to_cpu" : false },>>%MINERDIR%\xmr-stak-amd\config.txt
echo	{ "index" : 3, "intensity" : %INTEN%, "worksize" : 8, "affine_to_cpu" : false },>>%MINERDIR%\xmr-stak-amd\config.txt
echo	{ "index" : 4, "intensity" : %INTEN%, "worksize" : 8, "affine_to_cpu" : false },>>%MINERDIR%\xmr-stak-amd\config.txt
echo	{ "index" : 5, "intensity" : %INTEN%, "worksize" : 8, "affine_to_cpu" : false },>>%MINERDIR%\xmr-stak-amd\config.txt
:GPUSTAKAMD
echo ],>>%MINERDIR%\xmr-stak-amd\config.txt
echo "platform_index" : 0,>>%MINERDIR%\xmr-stak-amd\config.txt
echo "use_tls" : false,>>%MINERDIR%\xmr-stak-amd\config.txt
echo "tls_secure_algo" : true,>>%MINERDIR%\xmr-stak-amd\config.txt
echo "tls_fingerprint" : "",>>%MINERDIR%\xmr-stak-amd\config.txt
echo "pool_address" : "%URL%",>>%MINERDIR%\xmr-stak-amd\config.txt
echo "wallet_address" : "%USER%",>>%MINERDIR%\xmr-stak-amd\config.txt
echo "pool_password" : "%PASS%",>>%MINERDIR%\xmr-stak-amd\config.txt
echo "call_timeout" : 10,>>%MINERDIR%\xmr-stak-amd\config.txt
echo "retry_time" : 10,>>%MINERDIR%\xmr-stak-amd\config.txt
echo "giveup_limit" : 0,>>%MINERDIR%\xmr-stak-amd\config.txt
echo "verbose_level" : 3,>>%MINERDIR%\xmr-stak-amd\config.txt
echo "h_print_time" : 60,>>%MINERDIR%\xmr-stak-amd\config.txt
echo "daemon_mode" : false,>>%MINERDIR%\xmr-stak-amd\config.txt
echo "output_file" : "",>>%MINERDIR%\xmr-stak-amd\config.txt
echo "httpd_port" : 0,>>%MINERDIR%\xmr-stak-amd\config.txt
echo "prefer_ipv4" : true,>>%MINERDIR%\xmr-stak-amd\config.txt
cd %MINERDIR%\xmr-stak-amd\
set GPU_FORCE_64BIT_PTR=0
set GPU_MAX_HEAP_SIZE=100
set GPU_USE_SYNC_OBJECTS=1
set GPU_MAX_ALLOC_PERCENT=100
set GPU_SINGLE_ALLOC_PERCENT=100
call xmr-stak-amd.exe
pause
GOTO MENU2AGPU


:GPUN1
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

set /P URL=Pool Stratum and Port(stratum+tcp://example.com:port): 
cls
set "THR=1"
set /P THR=Number of GPUs (1-6): 
IF EXIST "%MINERDIR%\usr.txt" ( 
set "USER=%WALLET%" 
echo Username or Wallet: %WALLET%
timeout /t 2 /NOBREAK>NUL
) else ( 
set /P USER=Username or Wallet: 
)
cls
set "PASS=x"
set /P PASS=Password (x by Default):
cls
timeout /t 2 /NOBREAK >NUL
echo Using Input information to Start Miner!
timeout /t 2 /NOBREAK >NUL
echo.
echo.
echo.
echo Pool Stratum: %URL%
echo Algorithm: Cryptonight
echo GPUs: %THR%
echo Username: %USER%
echo Password: %PASS%
echo.
echo.
echo.
echo Use CRTL+C to EXIT the Miner after you are Finished.
echo.
echo.
echo.
timeout /t 5 /NOBREAK >NUL
cd %MINERDIR%\ccminer_cryptonight
set GPU_FORCE_64BIT_PTR=0
set GPU_MAX_HEAP_SIZE=100
set GPU_USE_SYNC_OBJECTS=1
set GPU_MAX_ALLOC_PERCENT=100
set GPU_SINGLE_ALLOC_PERCENT=100
call ccminer.exe -a cryptonight -o %URL% -u %USER% -p %PASS% -t %THR%
pause
goto MENU2NGPU

:GPUN2
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
set /P URL=Pool Stratum and Port(stratum+tcp://example.com:port): 
cls
IF EXIST "%MINERDIR%\usr.txt" ( 
set "USER=%WALLET%" 
echo Username or Wallet: %WALLET%
timeout /t 2 /NOBREAK>NUL
) else ( 
set /P USER=Username or Wallet: 
)
cls
set "PASS=x"
set /P PASS=Password (x by Default):
cls
timeout /t 2 /NOBREAK >NUL
echo Using Input information to Start Miner!
timeout /t 2 /NOBREAK >NUL
echo.
echo.
echo.
echo Pool Stratum: %URL%
echo Algorithm: EquiHash
echo Username: %USER%
echo Password: (Default)
echo.
echo.
echo.
echo Use CRTL+C to EXIT the Miner after you are Finished.
echo.
echo.
echo.
timeout /t 5 /NOBREAK >NUL
set GPU_FORCE_64BIT_PTR=0
set GPU_MAX_HEAP_SIZE=100
set GPU_USE_SYNC_OBJECTS=1
set GPU_MAX_ALLOC_PERCENT=100
set GPU_SINGLE_ALLOC_PERCENT=100
cd %MINERDIR%\Windows_x64_nheqminer-5c
call nheqminer.exe -l %URL% -u %USER% -cd 0
pause
GOTO MENU2NGPU

:GPUN3
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
:GPUCOUNTNSTAK
set "GPU=1"
set /P GPU=How many GPU's are in the Machine:
IF "%GPU%" GEQ "7" GOTO DUDE1
IF "%GPU%" EQU "0" GOTO DUDE1
GOTO GPUSTARTNSTAK
:DUDE1
echo Common man, Be real..
timeout /t 2 /NOBREAK>NUL
goto GPUCOUNTNSTAK
:GPUSTARTNSTAK 
set /P URL=Pool Stratum and Port(stratum+tcp://example.com:port): 
IF EXIST "%MINERDIR%\usr.txt" ( 
set "USER=%WALLET%" 
echo Username or Wallet: %WALLET%
timeout /t 2 /NOBREAK>NUL
) else ( 
set /P USER=Username or Wallet: 
)
set "PASS=x"
set /P PASS=Password (x by Default):  
cls
timeout /t 2 /NOBREAK >NUL
echo Using Input information to Start Miner!
timeout /t 2 /NOBREAK >NUL
echo.
echo.
echo.
echo Pool Stratum: %URL%
echo Algorithm: Cryptonight
echo Username: %USER%
echo Password: %PASS%
echo.
echo Using %GPU% GPU's.
echo.
echo.
echo.
echo Use CRTL+C to EXIT the Miner after you are Finished.
echo.
echo.
echo.
timeout /t 5 /NOBREAK >NUL
echo "gpu_thread_num" : %GPU%,>%MINERDIR%\xmr-stak-nvidia\config.txt
echo "gpu_threads_conf" : [>>%MINERDIR%\xmr-stak-nvidia\config.txt
IF "%GPU%" EQU "1" GOTO 1GN
:1GN
echo  { "index" : 0, "threads" : 17, "blocks" : 60, "bfactor" : 0, "bsleep" :  0, "affine_to_cpu" : false},>>%MINERDIR%\xmr-stak-nvidia\config.txt
GOTO GPUSTAKN
IF "%GPU%" EQU "2" GOTO 2GN
:2GN
echo  { "index" : 0, "threads" : 17, "blocks" : 60, "bfactor" : 0, "bsleep" :  0, "affine_to_cpu" : false},>>%MINERDIR%\xmr-stak-nvidia\config.txt
echo  { "index" : 1, "threads" : 17, "blocks" : 60, "bfactor" : 0, "bsleep" :  0, "affine_to_cpu" : false},>>%MINERDIR%\xmr-stak-nvidia\config.txt
GOTO GPUSTAKN
IF "%GPU%" EQU "3" GOTO 3GN
:3GN
echo  { "index" : 0, "threads" : 17, "blocks" : 60, "bfactor" : 0, "bsleep" :  0, "affine_to_cpu" : false},>>%MINERDIR%\xmr-stak-amd\config.txt 
echo  { "index" : 1, "threads" : 17, "blocks" : 60, "bfactor" : 0, "bsleep" :  0, "affine_to_cpu" : false},>>%MINERDIR%\xmr-stak-amd\config.txt
echo  { "index" : 2, "threads" : 17, "blocks" : 60, "bfactor" : 0, "bsleep" :  0, "affine_to_cpu" : false},>>%MINERDIR%\xmr-stak-amd\config.txt
GOTO GPUSTAKN
IF "%GPU%" EQU "4" GOTO 4GN
:4GN
echo  { "index" : 0, "threads" : 17, "blocks" : 60, "bfactor" : 0, "bsleep" :  0, "affine_to_cpu" : false},>>%MINERDIR%\xmr-stak-amd\config.txt
echo  { "index" : 1, "threads" : 17, "blocks" : 60, "bfactor" : 0, "bsleep" :  0, "affine_to_cpu" : false},>>%MINERDIR%\xmr-stak-amd\config.txt
echo  { "index" : 2, "threads" : 17, "blocks" : 60, "bfactor" : 0, "bsleep" :  0, "affine_to_cpu" : false},>>%MINERDIR%\xmr-stak-amd\config.txt
echo  { "index" : 3, "threads" : 17, "blocks" : 60, "bfactor" : 0, "bsleep" :  0, "affine_to_cpu" : false},>>%MINERDIR%\xmr-stak-amd\config.txt
GOTO GPUSTAKN
IF "%GPU%" EQU "5" GOTO 5GN
:5GN
echo  { "index" : 0, "threads" : 17, "blocks" : 60, "bfactor" : 0, "bsleep" :  0, "affine_to_cpu" : false},>>%MINERDIR%\xmr-stak-nvidia\config.txt
echo  { "index" : 1, "threads" : 17, "blocks" : 60, "bfactor" : 0, "bsleep" :  0, "affine_to_cpu" : false},>>%MINERDIR%\xmr-stak-nvidia\config.txt
echo  { "index" : 2, "threads" : 17, "blocks" : 60, "bfactor" : 0, "bsleep" :  0, "affine_to_cpu" : false},>>%MINERDIR%\xmr-stak-nvidia\config.txt
echo  { "index" : 3, "threads" : 17, "blocks" : 60, "bfactor" : 0, "bsleep" :  0, "affine_to_cpu" : false},>>%MINERDIR%\xmr-stak-nvidia\config.txt
echo  { "index" : 4, "threads" : 17, "blocks" : 60, "bfactor" : 0, "bsleep" :  0, "affine_to_cpu" : false},>>%MINERDIR%\xmr-stak-nvidia\config.txt
GOTO GPUSTAKN
IF "%GPU%" EQU "6" GOTO 6GN
:6GN
echo  { "index" : 0, "threads" : 17, "blocks" : 60, "bfactor" : 0, "bsleep" :  0, "affine_to_cpu" : false},>>%MINERDIR%\xmr-stak-nvidia\config.txt
echo  { "index" : 1, "threads" : 17, "blocks" : 60, "bfactor" : 0, "bsleep" :  0, "affine_to_cpu" : false},>>%MINERDIR%\xmr-stak-nvidia\config.txt
echo  { "index" : 2, "threads" : 17, "blocks" : 60, "bfactor" : 0, "bsleep" :  0, "affine_to_cpu" : false},>>%MINERDIR%\xmr-stak-nvidia\config.txt
echo  { "index" : 3, "threads" : 17, "blocks" : 60, "bfactor" : 0, "bsleep" :  0, "affine_to_cpu" : false},>>%MINERDIR%\xmr-stak-nvidia\config.txt
echo  { "index" : 4, "threads" : 17, "blocks" : 60, "bfactor" : 0, "bsleep" :  0, "affine_to_cpu" : false},>>%MINERDIR%\xmr-stak-nvidia\config.txt
echo  { "index" : 5, "threads" : 17, "blocks" : 60, "bfactor" : 0, "bsleep" :  0, "affine_to_cpu" : false},>>%MINERDIR%\xmr-stak-nvidia\config.txt
:GPUSTAKN
echo ],>>%MINERDIR%\xmr-stak-nvidia\config.txt
echo "use_tls" : false,>>%MINERDIR%\xmr-stak-nvidia\config.txt
echo "tls_secure_algo" : true,>>%MINERDIR%\xmr-stak-nvidia\config.txt
echo "tls_fingerprint" : "",>>%MINERDIR%\xmr-stak-nvidia\config.txt
echo "pool_address" : "%URL%",>>%MINERDIR%\xmr-stak-nvidia\config.txt
echo "wallet_address" : "%USER%",>>%MINERDIR%\xmr-stak-nvidia\config.txt
echo "pool_password" : "%PASS%",>>%MINERDIR%\xmr-stak-nvidia\config.txt
echo "call_timeout" : 10,>>%MINERDIR%\xmr-stak-nvidia\config.txt
echo "retry_time" : 10,>>%MINERDIR%\xmr-stak-nvidia\config.txt
echo "giveup_limit" : 0,>>%MINERDIR%\xmr-stak-nvidia\config.txt
echo "verbose_level" : 3,>>%MINERDIR%\xmr-stak-nvidia\config.txt
echo "h_print_time" : 60,>>%MINERDIR%\xmr-stak-nvidia\config.txt
echo "output_file" : "",>>%MINERDIR%\xmr-stak-nvidia\config.txt
echo "httpd_port" : 0,>>%MINERDIR%\xmr-stak-nvidia\config.txt
echo "prefer_ipv4" : true,>>%MINERDIR%\xmr-stak-nvidia\config.txt
cd %MINERDIR%\xmr-stak-nvidia\
set GPU_FORCE_64BIT_PTR=0
set GPU_MAX_HEAP_SIZE=100
set GPU_USE_SYNC_OBJECTS=1
set GPU_MAX_ALLOC_PERCENT=100
set GPU_SINGLE_ALLOC_PERCENT=100
call xmr-stak-nvidia.exe
pause
GOTO MENU2NGPU

:GPUN4
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
set "ALG=cryptonight"
set /P ALG=Coin Algorithm (cryptonight, scrypt):
cls
set /P URL=Pool Stratum and Port(stratum+tcp://example.com:port): 
cls
set "THR=0"
set /P THR=Number of GPUs (1-6):
cls  
IF EXIST "%MINERDIR%\usr.txt" ( 
set "USER=%WALLET%" 
echo Username or Wallet: %WALLET%
timeout /t 2 /NOBREAK>NUL
) else ( 
set /P USER=Username or Wallet: 
)
cls
set "PASS=x"
set /P PASS=Password (x by Default):
cls
timeout /t 2 /NOBREAK >NUL
echo Using Input information to Start Miner!
timeout /t 2 /NOBREAK >NUL
echo.
echo.
echo.
echo Pool Stratum: %URL%
echo GPUs: %THR%
echo Algorithm: %ALG%
echo Username: %USER%
echo Password: %PASS%
echo.
echo.
echo.
echo Use CRTL+C to EXIT the Miner after you are Finished.
echo.
echo.
echo.
timeout /t 5 /NOBREAK >NUL
cd %MINERDIR%\ccminer-x64\
set GPU_FORCE_64BIT_PTR=0
set GPU_MAX_HEAP_SIZE=100
set GPU_USE_SYNC_OBJECTS=1
set GPU_MAX_ALLOC_PERCENT=100
set GPU_SINGLE_ALLOC_PERCENT=100
if %THR% GEQ "2"
call ccminer-x64.exe -a %ALG% -o %URL% -u %USER% -p %PASS% -t %THR%
if %THR% LEQ "1"
call ccminer-x64.exe -a %ALG% -o %URL% -u %USER% -p %PASS%
pause
goto MENU2NGPU

:GPUN5
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
set "ALG=cryptonight"
set /P ALG=Coin Algorithm (cryptonight, scrypt):
timeout /t 2 /NOBREAK>NUL
cls
set /P URL=Pool Stratum and Port(stratum+tcp://example.com:port): 
cls
set "THR=0"
set /P THR=Number of GPUs (1-6):
cls  
IF EXIST "%MINERDIR%\usr.txt" ( 
set "USER=%WALLET%" 
echo Username or Wallet: %WALLET%
timeout /t 2 /NOBREAK>NUL
) else ( 
set /P USER=Username or Wallet: 
)
cls
set "PASS=x"
set /P PASS=Password (x by Default):
cls
timeout /t 2 /NOBREAK >NUL
echo Using Input information to Start Miner!
timeout /t 2 /NOBREAK >NUL
echo.
echo.
echo.
echo Pool Stratum: %URL%
echo GPUs: %THR%
echo Algorithm: %ALG%
echo Username: %USER%
echo Password: %PASS%
echo.
echo.
echo.
echo Use CRTL+C to EXIT the Miner after you are Finished.
echo.
echo.
echo.
timeout /t 5 /NOBREAK >NUL
cd %MINERDIR%\ccminer-x86\
set GPU_FORCE_64BIT_PTR=0
set GPU_MAX_HEAP_SIZE=100
set GPU_USE_SYNC_OBJECTS=1
set GPU_MAX_ALLOC_PERCENT=100
set GPU_SINGLE_ALLOC_PERCENT=100
if %THR% GEQ "2"
call ccminer-x86.exe -a %ALG% -o %URL% -u %USER% -p %PASS% -t %THR%
if %THR% LEQ "1"
call ccminer-x86.exe -a %ALG% -o %URL% -u %USER% -p %PASS%
pause
goto MENU2NGPU

:MAINHELP
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo O============================================================================================================O
echo.
echo                                    NEW to Mining/Where to Sign-Up
echo.
echo O============================================================================================================O
echo.
echo   I personally recommend MinerGate for anyone learning to Mine. They make everything simple and easy to use
echo    to mine. 
echo.
echo               Sign-Up at MinerGate: http://bit.ly/MinerGateSignUp and Click the 'Sign up' Button
echo                             at the Top Right of the Webpage! Use that Account in EAZE-Z Miner!
echo.
echo O============================================================================================================O
echo                                   SUPPORTED MINERS AND ALGORITHMS:
echo.
echo                                            NVIDIA SUPPORT:
echo O============================================================================================================O
echo    ccminer-cryptonight   - cryptonight
echo    ccminer-tpruvot       - cryptonight, cryptolight, scrypt, x11, x13, yescrypt,
echo                            blake256, and more!
echo    nicehash zec miner    - equihash
echo    xmr-stak-nvidia       - cryptonight, cryptolight
echo.
echo                                              AMD SUPPORT:
echo O============================================================================================================O	 
echo    claymore cryptonote   - cryptonight
echo    genoils eth miner     - ethash
echo    claymore zec miner    - equihash
echo    xmr-stak-amd          - cryptonight, cryptolight
echo.
echo                                              CPU SUPPORT:
echo O============================================================================================================O
echo    cpuminer-multi wolf   - cryptonight, ???
echo    minergate-cli         - cryptonight
echo    xmr-stak-cpu          - cryptonight, cryptolight
echo    cpuminer-multi-tpruv  - cryptonight, cryptolight, scrypt, xll, x13, x14,
echo                            yescrypt, blake256, decred, and much more!
echo. 
echo O============================================================================================================O
echo Press ENTER or ANY KEY to go Back to MENU..
pause > NUL
GOTO MENU




:EXIT
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
type "ascii"
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
echo   One Moment Please..
timeout /t 3 /NOBREAK >NUL
REM copy /b/v/y %MINERDIR%\usr.txt %EZDIR%\ >NUL
REM cd %EZDIR%
REM rmdir /S /Q "%MINERDIR%"
REM if %ERRORLEVEL% EQU 1 call :colorEcho 08  "   FAIL!"
REM if %ERRORLEVEL% EQU 0 call :colorEcho 0A  "   DONE!"
REM timeout /t 2 /NOBREAK >NUL
GOTO EOF

:EOF
exit /B

:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i
