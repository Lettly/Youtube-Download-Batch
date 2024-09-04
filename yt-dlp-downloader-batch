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

rem Check for Mp3_OR_Mp4.txt file
if exist Mp3_OR_Mp4.txt (
    for /f "tokens=* delims=" %%x in (Mp3_OR_Mp4.txt) do set mp=%%x
    if /i "%mp%"=="mp4" goto mp4
    if /i "%mp%"=="mp3" goto mp3
)

rem Ask user for format
set /p format_type="Do you want to download [video/audio]? "
if /i "%format_type%"=="video" goto mp4
if /i "%format_type%"=="audio" goto mp3
goto errset

rem Download video or playlist
:mp4
cd ..
cd Lib
set /p id="Enter video or playlist URL: "
echo.

rem Fetch format information and display options
yt-dlp -F %id% > formats.txt 2> error.log
if errorlevel 1 goto errfetch

echo Available formats:
echo.
for /f "tokens=1,2,3,* delims= " %%A in ('findstr /r /v "^format" formats.txt') do (
    set "desc=%%D"
    set "desc=!desc:~1!"
    if "%%B"=="video" (
        echo %%A | Video | %%C | !desc!
    )
)
echo.

set /p format="Enter the format code you want to download (e.g., 22, 140): "
echo.

yt-dlp -f %format% -o %dir%\%%(title)s.%%(ext)s %id%
if errorlevel 1 goto errfetch
pause
cd ..
goto start

rem Download audio file
:mp3
cd ..
cd Lib
set /p id="Enter video or playlist URL: "
echo.

yt-dlp -f "bestaudio" --extract-audio --audio-format mp3 -o %dir%\%%(title)s.%%(ext)s %id%
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
