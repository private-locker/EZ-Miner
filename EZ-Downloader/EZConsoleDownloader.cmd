@echo off
title EZ-Miner Downloader v0.1b
mode con: cols=70 lines=25
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)

REM VARIABLES
set "LOCALDIR=%~dp0"
set "DESKTOP=%USERPROFILE%\Desktop"
set "DEST=%DESKTOP%\EZ-Miner"
set "DECOMPRESS=%DEST%\decomp.vbs"
set "MINERDIR=%DESKTOP%\EZ-Miner\Downloader"
set "backup=%DEST%\backup_%date:~-10,2%%date:~-7,2%%date:~-4,4%.zip"
set "compress=%DEST%\compress.vbs"
set "WGET=wget.exe"

REM ZIP URLS AND DOWNLOAD LOCATIONS
set "ZIPNAME1=Claymore XMR CPU v4.0"
set "ZIPSHORT1=Claymore.CryptoNote.CPU.Miner.v4.0.-.POOL"
set "ZIPFILE1=%LOCALDIR%%ZIPSHORT1%.zip"
set "URL1=https://github.com/nanopool/Claymore-XMR-CPU-Miner/releases/download/v4.0/Claymore.CryptoNote.CPU.Miner.v4.0.-.POOL.zip"

set "ZIPNAME2=Claymore Dual Ethereum v11.8"
set "ZIPSHORT2=Claymore.s.Dual.Ethereum.Decred_Siacoin_Lbry_Pascal_Blake2s_Keccak.AMD.NVIDIA.GPU.Miner.v11.8"
set "ZIPFILE2=%LOCALDIR%%ZIPSHORT2%.zip"
set "URL2=https://github.com/nanopool/Claymore-Dual-Miner/releases/download/v11.8/Claymore.s.Dual.Ethereum.Decred_Siacoin_Lbry_Pascal_Blake2s_Keccak.AMD.NVIDIA.GPU.Miner.v11.8.zip"

set "ZIPNAME3=Claymore ZEC + BTG v12.6"
set "ZIPSHORT3=Claymore.s.ZCash.AMD.GPU.Miner.v12.6"
set "ZIPFILE3=%LOCALDIR%%ZIPSHORT3%.zip"
set "URL3=https://github.com/nanopool/ClaymoreZECMiner/releases/download/v12.6/Claymore.s.ZCash.AMD.GPU.Miner.v12.6.zip"

set "ZIPNAME4=EWBFs CUDA Zcash Miner v0.3.4b"
set "ZIPSHORT4=Zec.miner.0.3.4b"
set "ZIPFILE4=%LOCALDIR%%ZIPSHORT4%.zip"
set "URL4=https://github.com/nanopool/ewbf-miner/releases/download/v0.3.4b/Zec.miner.0.3.4b.zip"

set "ZIPNAME5="
set "ZIPSHORT5="
set "ZIPFILE5=%DESKTOP%\%ZIPSHORT5%.zip"
set "URL5="

set "ZIPNAME6="
set "ZIPSHORT6="
set "ZIPFILE6=%DESKTOP%\%ZIPSHORT5%.zip"
set "URL5="

set "ZIPNAME7="
set "ZIPSHORT7="
set "ZIPFILE7=%DESKTOP%\%ZIPSHORT5%.zip"
set "URL5="

set "ZIPNAME8="
set "ZIPSHORT8="
set "ZIPFILE8=%TEMPDEST%\%ZIPSHORT5%.zip"
set "URL5="

set "ZIPNAME9="
set "ZIPSHORT9="
set "ZIPFILE9=%TEMPDEST%\%ZIPSHORT5%.zip"
set "URL5="

REM check if EZ-Miner folder on Desktop
:CHKLOCAL
echo.
echo.
echo Checking EZ-Miner folder exists:
IF EXIST "%DEST%" call :colorEcho 0A  "   YES!" && (
 timeout /t 2 >NUL 
) else (
 call :colorEcho 0C  "   FAIL!"
 echo.
 echo Making Directory...
 timeout /t 2 >NUL
 mkdir "%DEST%"
 call :colorEcho 0A  "   DONE!"
 timeout /t 2 >NUL
)
IF NOT EXIST "%MINERDIR%" mkdir "%MINERDIR%"
GOTO CHKWGET

REM check if Wget is still available
:CHKWGET
echo.
echo.
echo Checking if Wget is available:
IF EXIST "%MINERDIR%\%WGET%" call :colorEcho 0A  "   YES!" && (
 timeout /t 2 >NUL
) else (
 call :colorEcho 0C  "   FAIL!"
 echo.
 echo Acquiring Wget...
 timeout /t 2 >NUL
 bitsadmin.exe /transfer %WGET% /download /priority normal https://eternallybored.org/misc/wget/1.19.4/32/wget.exe "%MINERDIR%\%WGET%" 2>NUL >NUL
 call :colorEcho 0A  "   DONE!"
 timeout /t 2 >NUL
)
GOTO MENU

:MENU
title EZ-Miner Downloader v0.1b
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
echo  O=================================================O
echo           EZ-Miner Console Miner Downloader         
echo  O=================================================O
echo.  
call :colorEcho 0D "   1." 
echo  - AMD Console Miners
echo.
call :colorEcho 0D "   2." 
echo  - Nvidia Console Miners
echo.
call :colorEcho 0D "   3." 
echo  - CPU Console Miners
echo.
call :colorEcho 0D "   4." 
echo  - HDD Console Miner (Experienced Miners ONLY)
echo.
call :colorEcho 0D "   5."
echo  - Settings
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
title EZ-Miner Downloader - AMD v0.1b
echo.
echo.
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
call :colorEcho 04 "   1."
echo - %ZIPNAME2%
echo.
call :colorEcho 04 "   2."
echo - %ZIPNAME3%
echo.
call :colorEcho 04 "   3."
echo. 
echo.
call :colorEcho 04 "   4." 
echo.    
echo  ---------------------------------------------------
echo  Press ? for help, or Press # corresponding to Menu.
echo.  
set "MM=null"
SET /P MM=Select a OPTION[#] and press ENTER: 
IF "%MM%" EQU "0" GOTO MENU
IF "%MM%" EQU "1" GOTO DOWNLOAD2
IF "%MM%" EQU "2" GOTO DOWNLOAD3
IF "%MM%" EQU "3" GOTO CPU
IF "%MM%" EQU "4" GOTO HDD
IF "%MM%"=="?" GOTO MAINHELP
IF "%MM%" EQU "null" GOTO MENU
GOTO MENU

:NVIDIA
title EZ-Miner Downloader - NVidia v0.1b
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
echo  O=================================================O
echo           EZ-Miner Console Miner Downloader         
echo  O=================================================O
echo.  
call :colorEcho 02 "   1." 
echo  - %ZIPNAME2%
echo.
call :colorEcho 02 "   2." 
echo  - %ZIPNAME4%
echo.
call :colorEcho 02 "   3." 
echo  - CPU Console Miners
echo.
call :colorEcho 02 "   4."
echo  - HDD Console Miner (Experienced Miners ONLY)
echo.    
echo  ---------------------------------------------------
echo  Press ? for help, or Press # corresponding to Menu.
echo.  
set "MM=null"
SET /P MM=Select a OPTION[#] and press ENTER: 
IF "%MM%" EQU "0" GOTO MENU
IF "%MM%" EQU "1" GOTO DOWNLOAD2
IF "%MM%" EQU "2" GOTO DOWNLOAD4
IF "%MM%" EQU "3" GOTO CPU
IF "%MM%" EQU "4" GOTO HDD
IF "%MM%"=="?" GOTO MAINHELP
IF "%MM%" EQU "null" GOTO MENU
GOTO MENU


:CPU
title EZ-Miner Downloader - CPU v0.1b
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
echo  O=================================================O
echo           EZ-Miner Console Miner Downloader         
echo  O=================================================O
echo.  
call :colorEcho 09 "   1." 
echo  - %ZIPSHORT1%
echo.
call :colorEcho 09 "   2."
echo.
echo.
call :colorEcho 09 "   3." 
echo.
echo.
echo.    
echo  ---------------------------------------------------
echo  Press ? for help, or Press # corresponding to Menu.
echo.  
set "MM=null"
SET /P MM=Select a OPTION[#] and press ENTER: 
IF "%MM%" EQU "0" GOTO MENU
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
IF "%MM%" EQU "0" GOTO DISABLED1
IF "%MM%" EQU "1" GOTO DISABLED1
IF "%MM%" EQU "2" GOTO DISABLED1
IF "%MM%" EQU "3" GOTO DISABLED1
IF "%MM%" EQU "4" GOTO DISABLED1
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
echo  O=================================================O
echo           EZ-Miner Console Miner Downloader         
echo  O=================================================O
echo.  
call :colorEcho 0E "   1." 
echo  - Clean Up Download Directories
echo.
call :colorEcho 0E "   2." 
echo  - Remove Wget
echo.
call :colorEcho 0E "   3." 
echo  - Remove Local Miners
echo.
call :colorEcho 0E "   4." 
echo  - Backup Downloaded Miners
echo.    
echo  ---------------------------------------------------
echo  Press ? for help, or Press # corresponding to Menu.
echo.  
set "MM=null"
SET /P MM=Select a OPTION[#] and press ENTER: 
IF "%MM%" EQU "0" GOTO SETTINGS
IF "%MM%" EQU "1" GOTO CLEANDOWNLOAD
IF "%MM%" EQU "2" GOTO DELWGET
IF "%MM%" EQU "3" GOTO CLEANLOCAL
IF "%MM%" EQU "4" GOTO BACKUP
IF "%MM%"=="?" GOTO MAINHELP
IF "%MM%" EQU "null" GOTO MENU
GOTO MENU


:DOWNLOAD1
"%MINERDIR%\%WGET%" %URL1% --no-check-certificate 
@echo ZipFile="%ZIPFILE1%">"%DECOMPRESS%"
@echo ExtractTo="%MINERDIR%\%ZIPNAME1%">>"%DECOMPRESS%"
@echo Set fso = CreateObject("Scripting.FileSystemObject")>>"%DECOMPRESS%"
@echo If NOT fso.FolderExists(ExtractTo) Then>>"%DECOMPRESS%"
@echo    fso.CreateFolder(ExtractTo)>>"%DECOMPRESS%"
@echo End If>>"%DECOMPRESS%"
@echo set objShell = CreateObject("Shell.Application")>>"%DECOMPRESS%"
@echo set FilesInZip=objShell.NameSpace(ZipFile).items>>"%DECOMPRESS%"
@echo objShell.NameSpace(ExtractTo).CopyHere(FilesInZip)>>"%DECOMPRESS%"
@echo Set fso = Nothing>>"%DECOMPRESS%"
@echo Set objShell = Nothing>>"%DECOMPRESS%"

echo Decompressing %ZIPSHORT1%.zip...
call "%DECOMPRESS%"
timeout /t 5 /NOBREAK>NUL
if %ERRORLEVEL% EQU 1 call :colorEcho 0C  "   FAIL!" && (
echo Returning to Main Menu due to Decompressing Error.
timeout /t 2 /NOBREAK >NUL
echo.
GOTO MENU
)
if %ERRORLEVEL% EQU 0 call :colorEcho 0A  "   DONE!"

del /f "%ZIPFILE1%" >NUL
del /f "%DECOMPRESS%" >NUL
cls
echo.
call :colorEcho 0A "               SUCCESS!     "
echo.
echo Instructions: 
echo Go to your Desktop, in the EZMinerDownloader Folder
echo  there will be a folder named %ZIPNAME1%. You will
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
"%MINERDIR%\%WGET%" %URL2% --no-check-certificate 
@echo ZipFile="%ZIPFILE2%">"%DECOMPRESS%"
@echo ExtractTo="%MINERDIR%\%ZIPNAME2%">>"%DECOMPRESS%"
@echo Set fso = CreateObject("Scripting.FileSystemObject")>>"%DECOMPRESS%"
@echo If NOT fso.FolderExists(ExtractTo) Then>>"%DECOMPRESS%"
@echo    fso.CreateFolder(ExtractTo)>>"%DECOMPRESS%"
@echo End If>>"%DECOMPRESS%"
@echo set objShell = CreateObject("Shell.Application")>>"%DECOMPRESS%"
@echo set FilesInZip=objShell.NameSpace(ZipFile).items>>"%DECOMPRESS%"
@echo objShell.NameSpace(ExtractTo).CopyHere(FilesInZip)>>"%DECOMPRESS%"
@echo Set fso = Nothing>>"%DECOMPRESS%"
@echo Set objShell = Nothing>>"%DECOMPRESS%"

echo Decompressing %ZIPSHORT2%.zip...
call "%DECOMPRESS%"
timeout /t 5 /NOBREAK>NUL
if %ERRORLEVEL% EQU 1 call :colorEcho 0C  "   FAIL!" && (
echo Returning to Main Menu due to Decompressing Error.
timeout /t 2 /NOBREAK >NUL
echo.
GOTO MENU
)
if %ERRORLEVEL% EQU 0 call :colorEcho 0A  "   DONE!"

del /f "%ZIPFILE2%" >NUL
del /f "%DECOMPRESS%" >NUL
cls
echo.
call :colorEcho 0A "               SUCCESS!     "
echo.
echo Instructions: 
echo Go to your Desktop, in the EZMinerDownloader Folder
echo there will be a folder named %ZIPNAME2%. You will
echo find the Miner you just Downloaded.
echo.
echo.
echo Good Luck!
echo -Development Team
echo.
echo [Hit Enter to Continue or wait 30 seconds.]
timeout /t 30 >NUL
GOTO MENU

:DOWNLOAD3
"%MINERDIR%\%WGET%" %URL3% --no-check-certificate 
@echo ZipFile="%ZIPFILE3%">"%DECOMPRESS%"
@echo ExtractTo="%MINERDIR%\%ZIPNAME3%">>"%DECOMPRESS%"
@echo Set fso = CreateObject("Scripting.FileSystemObject")>>"%DECOMPRESS%"
@echo If NOT fso.FolderExists(ExtractTo) Then>>"%DECOMPRESS%"
@echo    fso.CreateFolder(ExtractTo)>>"%DECOMPRESS%"
@echo End If>>"%DECOMPRESS%"
@echo set objShell = CreateObject("Shell.Application")>>"%DECOMPRESS%"
@echo set FilesInZip=objShell.NameSpace(ZipFile).items>>"%DECOMPRESS%"
@echo objShell.NameSpace(ExtractTo).CopyHere(FilesInZip)>>"%DECOMPRESS%"
@echo Set fso = Nothing>>"%DECOMPRESS%"
@echo Set objShell = Nothing>>"%DECOMPRESS%"

echo Decompressing %ZIPSHORT3%.zip...
call "%DECOMPRESS%"
timeout /t 5 /NOBREAK>NUL
if %ERRORLEVEL% EQU 1 call :colorEcho 0C  "   FAIL!" && (
echo Returning to Main Menu due to Decompressing Error.
timeout /t 2 /NOBREAK >NUL
echo.
GOTO MENU
)
if %ERRORLEVEL% EQU 0 call :colorEcho 0A  "   DONE!"

del /f "%ZIPFILE3%" >NUL
del /f "%DECOMPRESS%" >NUL
cls
echo.
call :colorEcho 0A "               SUCCESS!     "
echo.
echo Instructions: 
echo Go to your Desktop, in the EZMinerDownloader Folder
echo there will be a folder named %ZIPNAME3%. You will
echo find the Miner you just Downloaded.
echo.
echo.
echo Good Luck!
echo -Development Team
echo.
echo [Hit Enter to Continue or wait 30 seconds.]
timeout /t 30 >NUL
GOTO MENU

:DOWNLOAD4
"%MINERDIR%\%WGET%" %URL4% --no-check-certificate 
@echo ZipFile="%ZIPFILE4%">"%DECOMPRESS%"
@echo ExtractTo="%MINERDIR%\%ZIPNAME4%">>"%DECOMPRESS%"
@echo Set fso = CreateObject("Scripting.FileSystemObject")>>"%DECOMPRESS%"
@echo If NOT fso.FolderExists(ExtractTo) Then>>"%DECOMPRESS%"
@echo    fso.CreateFolder(ExtractTo)>>"%DECOMPRESS%"
@echo End If>>"%DECOMPRESS%"
@echo set objShell = CreateObject("Shell.Application")>>"%DECOMPRESS%"
@echo set FilesInZip=objShell.NameSpace(ZipFile).items>>"%DECOMPRESS%"
@echo objShell.NameSpace(ExtractTo).CopyHere(FilesInZip)>>"%DECOMPRESS%"
@echo Set fso = Nothing>>"%DECOMPRESS%"
@echo Set objShell = Nothing>>"%DECOMPRESS%"

echo Decompressing %ZIPSHORT4%.zip...
call "%DECOMPRESS%"
timeout /t 5 /NOBREAK>NUL
if %ERRORLEVEL% EQU 1 call :colorEcho 0C  "   FAIL!" && (
echo Returning to Main Menu due to Decompressing Error.
timeout /t 2 /NOBREAK >NUL
echo.
GOTO MENU
)
if %ERRORLEVEL% EQU 0 call :colorEcho 0A  "   DONE!"

del /f "%ZIPFILE4%" >NUL
del /f "%DECOMPRESS%" >NUL
cls
echo.
call :colorEcho 0A "               SUCCESS!     "
echo.
echo Instructions: 
echo Go to your Desktop, in the EZMinerDownloader Folder
echo there will be a folder named %ZIPNAME2%. You will
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
call :colorEcho 0C  "     DISABLED! "
echo.
echo Will be ENABLED soon!
echo.
echo.
timeout /t 3 /NOBREAK >NUL
goto MENU

:BACKUP
@echo Set WshShell = WScript.CreateObject("WScript.Shell")>"%compress%"
@echo Set fso = CreateObject("Scripting.FileSystemObject")>>"%compress%"
@echo Set objShell = CreateObject("Shell.Application")>>"%compress%"
@echo Set objArgs = WScript.Arguments>>"%compress%"
@echo Set zip = fso.CreateTextFile(objArgs(1))>>"%compress%"
@echo zip.Write Chr(80) ^& Chr(75) ^& Chr(5) ^& Chr(6) ^& String(18, 0)>>"%compress%"
@echo zip.Close>>"%compress%"
@echo WScript.Sleep 500>>"%compress%"
@echo Set target = objShell.NameSpace(objArgs(1))>>"%compress%"
@echo Set src = objShell.NameSpace(objArgs(0)).Items>>"%compress%"
@echo target.CopyHere src>>"%compress%"
@echo WScript.Sleep 10000>>"%compress%"
IF EXIST "%backup%" del /f "%backup%" >NUL
timeout /t 1 /NOBREAK >NUL
cscript "%compress%" "%MINERDIR%" "%backup%" 2>NUL >NUL
timeout /t 5 /NOBREAK>NUL
if %ERRORLEVEL% EQU 1 call :colorEcho 0C  "   FAIL!" && (
echo Returning to Main Menu due to Compressing Error.
del /f "%compress%" >NUL
del /f "%backup%" >NUL
del /f "%backup%~*" >NUL
timeout /t 2 /NOBREAK >NUL
echo.
GOTO MENU
)
if %ERRORLEVEL% EQU 0 call :colorEcho 0A  "   DONE!"
echo.
echo Checking File Integrity...
echo.
set maxbytesize=1000
FOR /F "usebackq" %%A IN ('%backup%') DO set size=%%~zA
if %size% LSS %maxbytesize% (
    del /f "%backup%">NUL
	del /f "%compress%">NUL
	echo Backup Failed... Trying again..	
	GOTO BACKUP
) ELSE (
    call :colorEcho 0A "  Backup successfully created! 
	echo.
)
echo.
echo Cleaning Up Temp files...
del /f "%backup%~*" 2>NUL >NUL
del /f "%compress%" >NUL 
echo.
PAUSE
goto MENU

:DELWGET
cls
echo.
echo.
echo.
echo Are you sure you wish to remove Wget?
echo Wget will be redownloaded next time you execute this script
echo.
set "RM=null"
set /p RM=(Y)es/(N)o:  
IF "%RM%" EQU "Y" goto WGETDELETE
IF "%RM%" EQU "y" goto WGETDELETE
IF "%RM%" EQU "N" GOTO MENU 
IF "%RM%" EQU "n" GOTO MENU else (
goto DELWGET )
goto MENU

:WGETDELETE
cls
echo Wget is being removed from your system...
del "%MINERDIR%\%WGET%"
echo.
IF EXIST "%MINERDIR%\%WGET%" call :colorEcho 0C "%WGET% was unable to be removed from your system, please ensure it is not running in the background"
timeout /t 3 /NOBREAK >NUL
IF NOT EXIST "%MINERDIR%\%WGET%" call :colorEcho 0A "          %WGET% successfully deleted"
echo.
echo.
call :colorEcho 0C "   Please note that wget will be reacquired upon next execution"
echo.
echo.
PAUSE
goto MENU

:CLEANLOCAL
cls
echo Are you sure you wish to remove all miners from "%MINERDIR%"?
echo.
set "RM=null"
set /p RM=(Y)es/(N)o: 
IF "%RM%" EQU "Y" goto DELMINERS
IF "%RM%" EQU "y" goto DELMINERS
IF "%RM%" EQU "N" goto MENU
IF "%RM%" EQU "n" goto MENU else (
goto CLEANLOCAL ) 
goto MENU

:DELMINERS
cls
echo Miners are being removed from your system...
rmdir "%MINERDIR%" /S /Q
echo.
IF EXIST "%MINERDIR%" call :colorEcho 0C "Some miners were unable to be removed, please ensure none are running."
IF NOT EXIST "%MINERDIR%" call :colorEcho 0A "     Miners have been successfully removed from your system"
echo.
echo.
PAUSE
goto MENU


:EOF
exit /B

:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i

