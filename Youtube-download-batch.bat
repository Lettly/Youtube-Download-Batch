@echo off

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
yt-dlp -F %id% > formats.txt

rem Display available formats with additional details
echo Available formats:
echo.
echo Format Code^|Type^|Resolution^|Description
for /f "tokens=1,2,3,* delims= " %%A in (formats.txt) do (
    if "%%A" neq "format" (
        set "desc=%%D"
        if "%%B"=="video" (
            echo %%A^|Video^|%%C^|%desc%
        ) else if "%%B"=="audio" (
            echo %%A^|Audio^|N/A^|%desc%
        )
    )
)
echo.

rem Prompt user to select a format
set /p format="Enter the format code you want to download (e.g., 22, 140): "
echo.

rem Download the selected format
yt-dlp -f %format% -o Download\%%(title)s.%%(ext)s %id%
yt-dlp -f %format% -o %dir%\%%(title)s.%%(ext)s %id%
pause
cd ..
goto start

rem Download audio file
:start1
cd ..
cd Lib
set /p id="Enter video or playlist URL: "
echo.
yt-dlp -F %id% > formats.txt

rem Display available formats with additional details
echo Available formats:
echo.
echo Format Code^|Type^|Resolution^|Description
for /f "tokens=1,2,3,* delims= " %%A in (formats.txt) do (
    if "%%A" neq "format" (
        set "desc=%%D"
        if "%%B"=="video" (
            echo %%A^|Video^|%%C^|%desc%
        ) else if "%%B"=="audio" (
            echo %%A^|Audio^|N/A^|%desc%
        )
    )
)
echo.

rem Prompt user to select a format
set /p format="Enter the format code you want to download (e.g., 22, 140): "
echo.

rem Download the selected format
yt-dlp -f %format% -o %dir%\%%(title)s.%%(ext)s %id%
pause
cd ..
goto start

rem Handle error for empty settings
:errset
echo This is an empty file in the folder setting, please fill out correctly all the settings
echo.
pause
goto start
