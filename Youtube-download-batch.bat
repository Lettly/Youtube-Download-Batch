@echo off
setlocal enabledelayedexpansion

:start
cls
echo Made with love by Lettly
echo.
cd Setting

rem Get the directory to save files
for /f "tokens=* delims=" %%x in (DirToSave.txt) do set dir=%%x
if "%dir%"=="" goto errset

rem Handle download copy settings
for /f "tokens=* delims=" %%x in (DownloadCopy.txt) do set dow=%%x
if /i "%dow%"=="Y" goto start2
if /i "%dow%"=="N" goto start1
goto errset

rem Download video or playlist
:start2
cd ..
cd Lib
set /p id="Enter video or playlist URL: "
echo.

rem Fetch format information and display in CLI
yt-dlp -F %id% 2> error.log
if errorlevel 1 goto errfetch

rem Pause to allow the user to see available formats before proceeding
pause

rem Prompt user to select a format
set /p format="Enter the format code you want to download (e.g., 22, 140): "
echo.

rem Download the selected format
yt-dlp -f %format% -o Download\%%(title)s.%%(ext)s %id%
yt-dlp -f %format% -o %dir%\%%(title)s.%%(ext)s %id%
if errorlevel 1 goto errfetch
pause
cd ..
goto start

rem Download audio file
:start1
cd ..
cd Lib
set /p id="Enter video or playlist URL: "
echo.

rem Fetch format information and display in CLI
yt-dlp -F %id% 2> error.log
if errorlevel 1 goto errfetch

rem Pause to allow the user to see available formats before proceeding
pause

rem Prompt user to select a format
set /p format="Enter the format code you want to download (e.g., 22, 140): "
echo.

rem Download the selected format
yt-dlp -f %format% -o %dir%\%%(title)s.%%(ext)s %id%
if errorlevel 1 goto errfetch
pause
cd ..
goto start

rem Handle errors during fetch or download
:errfetch
echo An error occurred. Please check the error.log file for details.
echo.
pause
goto start

rem Handle error for empty settings
:errset
echo This is an empty file in the folder setting, please fill out correctly all the settings
echo.
pause
goto start
