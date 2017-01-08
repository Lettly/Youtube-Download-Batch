@echo off

:start
cls
echo Made with love by Lettly
echo.
cd Setting
for /f "tokens=* delims=" %%x in (DirToSave.txt) do set dir=%%x
if %dir%=="" goto errset
for /f "tokens=* delims=" %%x in (DownloadCopy.txt) do set dow=%%x
if %dow%==Y goto start2
if %dow%==y goto start2
if %dow%=="" goto errset
cd ..
goto start1

:start2
cd ..
cd Lib
set /p id="Enter video url:"
youtube-dl --extract-audio --audio-format "mp3" --audio-quality 0 --youtube-skip-dash-manifest -o Download\%%(title)s-%%(id)s.%%(ext)s %id%
youtube-dl --extract-audio --audio-format "mp3" --audio-quality 0 --youtube-skip-dash-manifest -o %dir%\%%(title)s-%%(id)s.%%(ext)s %id%
pause
cd ..
goto start

:start1
cd Lib
set /p id="Enter video url:"
youtube-dl --extract-audio --audio-format "mp3" --audio-quality 0 --youtube-skip-dash-manifest -o %dir%\%%(title)s-%%(id)s.%%(ext)s %id%
pause
cd ..
goto start

:errset
echo This is an empty file in the folder setting, please fill out correctly all the settings
echo.
pause
goto start