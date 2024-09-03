@echo off

cd Setting

rem Get the directory to save files
for /f "tokens=* delims=" %%x in (DirToSave.txt) do set dir=%%x
set /p dir1="Select the folder where you want to download the file [%dir%]: "
IF [%dir1%] == [] goto Dirend

:dirset
echo %Dir1%>DirToSave.txt
:Dirend
echo.
goto DC

rem Handle download copy settings
:DC
for /f "tokens=* delims=" %%x in (DownloadCopy.txt) do set dow=%%x
if /i "%dow%" == "Y" goto DCy
if /i "%dow%" == "N" goto DCn

:DCy
set /p dow1=Want to make a copy of the downloaded file in the folder: "Lib/Download" [Y/n]: 
IF [%dow1%] == [] goto DCend
IF /i [%dow1%] == [y] goto DCset
IF /i [%dow1%] == [n] goto DCset
goto ErrSetDC

:DCn
set /p dow1=Want to make a copy of the downloaded file in the folder: "Lib/Download" [y/N]: 
IF [%dow1%] == [] goto DCend
IF /i [%dow1%] == [y] goto DCset
IF /i [%dow1%] == [n] goto DCset
goto ErrSetDC

:DCset
echo %dow1%> DownloadCopy.txt
:DCend
echo.
goto end

rem Error handling for invalid download copy options
:ErrSetDC
cls
echo You have entered an invalid option. Try again.
pause
cls
goto DC

:end
pause
