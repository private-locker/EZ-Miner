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
SET "WALLETFILE=%EZDIR%\Wallets\Wallet.txt"
SET "EXE=%~n0%~x0"
set "MINERDIR=%DESKTOP%\EZ-Miner\Downloader"
SET "RUN1=%EZDIR%\%EXE%"
SET "RUN2=%0"
set /p WALLET=<%WALLETFILE%
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
IF "%RUN1%" NEQ %RUN2% (
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
	echo Currently in the working EZ-Miner Directory..
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
IF EXIST "%WALLETFILE%" GOTO LOCALFOUND
IF NOT EXIST "%WALLETFILE%" GOTO LOCALNOTFOUND
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
set /p WALLET= < "%WALLETFILE%" 
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
IF EXIST "%WALLETFILE%" echo. && echo                                   Account(Wallet): %WALLET%
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
IF EXIST "%WALLETFILE%" echo. && echo                                   Account(Wallet): %WALLET%
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
IF EXIST "%WALLETFILE%" echo. && echo                                   Account(Wallet): %WALLET%
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
IF EXIST "%WALLETFILE%" echo. && echo                                   Account(Wallet): %WALLET%
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
del /f %WALLETFILE%
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
REM copy /b/v/y %WALLETFILE% %EZDIR%\ >NUL
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
