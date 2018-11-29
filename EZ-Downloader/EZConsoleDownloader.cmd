@echo off
mode con: cols=70 lines=25
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)

REM VARIABLES
set "LOCALDIR=%~dp0\"
set "TEMPDEST=%TEMP%\.db"
set "DESKTOP=%USERPROFILE%\Desktop"
set "DEST=%DESKTOP%\EZ-MinerDownloader"
set "LOCALTEMP=%DEST%\.db"
set "DECOMPRESS=%DEST%\decomp.vbs"

REM Download Wget
set "WGET=wget.exe"
IF not EXIST %TEMPDEST%\%WGET% (
bitsadmin.exe /transfer %WGET% /download /priority normal https://eternallybored.org/misc/wget/1.19.4/32/wget.exe "%TEMPDEST%\%WGET%" 2>NUL >NUL
)

REM ZIP URLS AND DOWNLOAD LOCATIONS
set "ZIPNAME1=Claymore XMR CPU v4.0"
set "ZIPSHORT1=Claymore.CryptoNote.CPU.Miner.v4.0.-.POOL"
set "ZIPFILE1=%DESKTOP%\%ZIPSHORT1%.zip"
set "URL1=https://github.com/nanopool/Claymore-XMR-CPU-Miner/releases/download/v4.0/Claymore.CryptoNote.CPU.Miner.v4.0.-.POOL.zip"

set "ZIPNAME2="
set "ZIPSHORT2="
set "ZIPFILE2=%TEMPDEST%\%ZIPSHORT2%.zip"
set "URL2="

set "ZIPNAME3="
set "ZIPSHORT3="
set "ZIPFILE3=%TEMPDEST%\%ZIPSHORT3%.zip"
set "URL3="

set "ZIPNAME4="
set "ZIPSHORT4="
set "ZIPFILE4=%TEMPDEST%\%ZIPSHORT4%.zip"
set "URL4="

set "ZIPNAME5="
set "ZIPSHORT5="
set "ZIPFILE5=%TEMPDEST%\%ZIPSHORT5%.zip"
set "URL5="

attrib +s +h %userprofile%\AppData\.update

:CHKDEST
echo.
echo.
echo.
echo.
echo Checking if Destination Directory exists:
IF EXIST "%DEST%" call :colorEcho 0A  "    YES!" && (
 timeout /t 2 >NUL
) else (
 call :colorEcho 08  "   FAIL!"
 echo.
 echo Making Directory...
 timeout /t 2 >NUL
 mkdir %DEST%
 call :colorEcho 0A  "   DONE!"
 timeout /t 2 >NUL
)
GOTO CHKTEMP

:CHKTEMP
echo.
echo.
echo Checking if Temp Directory exists:
IF EXIST "%TEMPDEST%" call :colorEcho 0A  "   YES!" && (
 timeout /t 2 >NUL 
) else (
 call :colorEcho 08  "   FAIL!"
 echo.
 echo Making Directory...
 timeout /t 2 >NUL
 mkdir %TEMPDEST%
 call :colorEcho 0A  "   DONE!"
 timeout /t 2 >NUL
)
GOTO CHKLOCALTEMP

:CHKLOCALTEMP
echo.
echo.
echo Checking if Temp Directory exists:
IF EXIST "%LOCALTEMP%" call :colorEcho 0A  "   YES!" && (
 timeout /t 2 >NUL 
) else (
 call :colorEcho 08  "   FAIL!"
 echo.
 echo Making Directory...
 timeout /t 2 >NUL
 mkdir %LOCALTEMP%
 call :colorEcho 0A  "   DONE!"
 timeout /t 2 >NUL
)
GOTO CHKWGET

:CHKWGET
echo.
echo.
echo Checking if Wget is available:
IF EXIST "%TEMPDEST%\%WGET%" call :colorEcho 0A  "  YES!" && (
 timeout /t 2 >NUL
) else (
 call :colorEcho 08  "  FAIL!"
 echo.
 echo Acquiring Wget...
 timeout /t 2 >NUL
 bitsadmin.exe /transfer %WGET% /download /priority normal https://eternallybored.org/misc/wget/1.19.4/32/wget.exe "%TEMPDEST%\%WGET%" 2>NUL >NUL
 call :colorEcho 0A  "  DONE!"
 timeout /t 2 >NUL
)
GOTO CONTINUE


:CONTINUE
GOTO MENU


:MENU
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
echo  O=================================================O
echo           EZ-Miner Console Miner Downloader         
echo  O=================================================O
echo.  
echo    1. AMD Console Miners
echo    2. Nvidia Console Miners
echo    3. CPU Console Miners
echo    4. HDD Console Miner (Experienced Miners ONLY)
echo    5. Settings
echo.    
echo  ---------------------------------------------------
echo  Press ? for help, or Press # corresponding to Menu.
echo.  
set "MM=null"
SET /P MM=Select a OPTION[#] and press ENTER: 
IF "%MM%" EQU "0" GOTO EOF
IF "%MM%" EQU "1" GOTO AMD
IF "%MM%" EQU "2" GOTO NVIDIA
IF "%MM%" EQU "3" GOTO CPU
IF "%MM%" EQU "4" GOTO HDD
IF "%MM%" EQU "5" GOTO SETTINGS
IF "%MM%"=="?" GOTO MAINHELP
IF "%MM%" EQU "null" GOTO MENU
GOTO MENU

:AMD
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
echo  O=================================================O
echo           EZ-Miner Console Miner Downloader         
echo  O=================================================O
echo.  
echo    1. Claymore 12.0
echo    2. 
echo    3. 
echo    4. 
echo.    
echo  ---------------------------------------------------
echo  Press ? for help, or Press # corresponding to Menu.
echo.  
set "MM=null"
SET /P MM=Select a OPTION[#] and press ENTER: 
IF "%MM%" EQU "0" GOTO EOF
IF "%MM%" EQU "1" GOTO AMD
IF "%MM%" EQU "2" GOTO NVIDIA
IF "%MM%" EQU "3" GOTO CPU
IF "%MM%" EQU "4" GOTO HDD
IF "%MM%"=="?" GOTO MAINHELP
IF "%MM%" EQU "null" GOTO MENU
GOTO MENU

:NVIDIA
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
echo  O=================================================O
echo           EZ-Miner Console Miner Downloader         
echo  O=================================================O
echo.  
echo    1. AMD Console Miners
echo    2. Nvidia Console Miners
echo    3. CPU Console Miners
echo    4. HDD Console Miner (Experienced Miners ONLY)
echo.    
echo  ---------------------------------------------------
echo  Press ? for help, or Press # corresponding to Menu.
echo.  
set "MM=null"
SET /P MM=Select a OPTION[#] and press ENTER: 
IF "%MM%" EQU "0" GOTO EOF
IF "%MM%" EQU "1" GOTO AMD
IF "%MM%" EQU "2" GOTO NVIDIA
IF "%MM%" EQU "3" GOTO CPU
IF "%MM%" EQU "4" GOTO HDD
IF "%MM%"=="?" GOTO MAINHELP
IF "%MM%" EQU "null" GOTO MENU
GOTO MENU


:CPU
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
echo  O=================================================O
echo           EZ-Miner Console Miner Downloader         
echo  O=================================================O
echo.  
echo    1. %ZIPSHORT1%
echo.
echo.
echo.
echo.    
echo  ---------------------------------------------------
echo  Press ? for help, or Press # corresponding to Menu.
echo.  
set "MM=null"
SET /P MM=Select a OPTION[#] and press ENTER: 
IF "%MM%" EQU "0" GOTO EOF
IF "%MM%" EQU "1" GOTO DOWNLOAD1
IF "%MM%" EQU "2" GOTO DOWNLOAD2
IF "%MM%" EQU "3" GOTO DOWNLOAD3
IF "%MM%" EQU "4" GOTO DOWNLOAD4
IF "%MM%"=="?" GOTO MAINHELP
IF "%MM%" EQU "null" GOTO MENU
GOTO MENU

:HDD
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
echo  O=================================================O
echo           EZ-Miner Console Miner Downloader         
echo  O=================================================O
echo.  
echo    1. AMD Console Miners
echo    2. Nvidia Console Miners
echo    3. CPU Console Miners
echo    4. HDD Console Miner (Experienced Miners ONLY)
echo.    
echo  ---------------------------------------------------
echo  Press ? for help, or Press # corresponding to Menu.
echo.  
set "MM=null"
SET /P MM=Select a OPTION[#] and press ENTER: 
IF "%MM%" EQU "0" GOTO EOF
IF "%MM%" EQU "1" GOTO AMD
IF "%MM%" EQU "2" GOTO NVIDIA
IF "%MM%" EQU "3" GOTO CPU
IF "%MM%" EQU "4" GOTO HDD
IF "%MM%"=="?" GOTO MAINHELP
IF "%MM%" EQU "null" GOTO MENU
GOTO MENU


:SETTINGS
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
echo  O=================================================O
echo           EZ-Miner Console Miner Downloader         
echo  O=================================================O
echo.  
echo    1. Clean Up Download Directories
echo    2. Clear TEMP Download Directory
echo    3. Remove Local Miners
echo    4. Backup Downloaded Miners
echo.    
echo  ---------------------------------------------------
echo  Press ? for help, or Press # corresponding to Menu.
echo.  
set "MM=null"
SET /P MM=Select a OPTION[#] and press ENTER: 
IF "%MM%" EQU "0" GOTO EOF
IF "%MM%" EQU "1" GOTO CLEANDOWNLOAD
IF "%MM%" EQU "2" GOTO CLEANTEMP
IF "%MM%" EQU "3" GOTO CLEANLOCAL
IF "%MM%" EQU "4" GOTO BACKUP
IF "%MM%"=="?" GOTO MAINHELP
IF "%MM%" EQU "null" GOTO MENU
GOTO MENU


:DOWNLOAD1
%TEMPDEST%\%WGET% %URL1% --no-check-certificate
@echo ZipFile="%ZIPFILE1%">%DECOMPRESS%
@echo ExtractTo="%DEST%\%ZIPNAME1%">>%DECOMPRESS%
@echo Set fso = CreateObject("Scripting.FileSystemObject")>>%DECOMPRESS%
@echo If NOT fso.FolderExists(ExtractTo) Then>>%DECOMPRESS%
@echo    fso.CreateFolder(ExtractTo)>>%DECOMPRESS%
@echo End If>>%DECOMPRESS%
@echo set objShell = CreateObject("Shell.Application")>>%DECOMPRESS%
@echo set FilesInZip=objShell.NameSpace(ZipFile).items>>%DECOMPRESS%
@echo objShell.NameSpace(ExtractTo).CopyHere(FilesInZip)>>%DECOMPRESS%
@echo Set fso = Nothing>>%DECOMPRESS%
@echo Set objShell = Nothing>>%DECOMPRESS%

echo Decompressing %ZIPSHORT1%.zip...
call %DECOMPRESS%
timeout /t 5 /NOBREAK>NUL
if %ERRORLEVEL% EQU 1 call :colorEcho 08  "   FAIL!" && (
echo Returning to Main Menu due to Decompressing Error.
timeout /t 2 /NOBREAK >NUL
echo.
GOTO MENU
)
if %ERRORLEVEL% EQU 0 call :colorEcho 0A  "   DONE!"

del /f %ZIPFILE1%.zip >NUL
del /f %DECOMPRESS% >NUL
cls
echo.
echo Instructions: 
echo Go to your Desktop, in the EZMinerDownloader Folder
echo  there will be a folder named %ZIPFILE1%. You will
echo find the Miner you just Downloaded.
echo.
echo.
echo Good Luck!
echo -Development Team
echo.
echo [Hit Enter to Continue or wait 30 seconds.]
timeout /t 30 >NUL
GOTO MENU


:DOWNLOAD2
bitsadmin /create %ZIPSHORT2%
bitsadmin /transfer %ZIPSHORT2% /download /priority high %URL1% %ZIPFILE2%
bitsadmin /complete %ZIPSHORT2%
bitsadmin /reset
@echo ZipFile="%ZIPFILE2%.zip">%DECOMPRESS%
@echo ExtractTo="%DEST%">>%DECOMPRESS%
@echo Set fso = CreateObject("Scripting.FileSystemObject")>>%DECOMPRESS%
@echo If NOT fso.FolderExists(ExtractTo) Then>>%DECOMPRESS%
@echo    fso.CreateFolder(ExtractTo)>>%DECOMPRESS%
@echo End If>>%DECOMPRESS%
@echo set objShell = CreateObject("Shell.Application")>>%DECOMPRESS%
@echo set FilesInZip=objShell.NameSpace(ZipFile).items>>%DECOMPRESS%
@echo objShell.NameSpace(ExtractTo).CopyHere(FilesInZip)>>%DECOMPRESS%
@echo Set fso = Nothing>>%DECOMPRESS%
@echo Set objShell = Nothing>>%DECOMPRESS%

echo Decompressing %ZIPSHORT2%.zip...
call %DECOMPRESS%
timeout /t 5 /NOBREAK>NUL
if %ERRORLEVEL% EQU 1 call :colorEcho 08  "   FAIL!" && (
echo Returning to Main Menu due to Decompressing Error.
timeout /t 2 /NOBREAK >NUL
echo.
GOTO MENU
)
if %ERRORLEVEL% EQU 0 call :colorEcho 0A  "   DONE!"

del /f %ZIPFILE2%.zip >NUL
del /f %DECOMPRESS% >NUL
cls
echo.
echo Instructions: 
echo Go to your Desktop, in the EZMinerDownloader Folder
echo  there will be a folder named %ZIPFILE2%. You will
echo find the Miner you just Downloaded.
echo.
echo.
echo Good Luck!
echo -Development Team
echo.
echo [Hit Enter to Continue or wait 30 seconds.]
timeout /t 30 >NUL
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


:EOF
exit /B

:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i
