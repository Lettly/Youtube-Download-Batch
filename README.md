# youtube-download-batch

## Overview

This batch script facilitates downloading video or audio from URLs using `yt-dlp`. It reads settings from configuration files and allows you to select formats and destinations for your downloads.

## Requirements

1. **yt-dlp**: Make sure `yt-dlp.exe` is placed in the `Lib` folder within the same directory as the batch script.
2. **Windows**: All scripts are intended for Windows OS

## Configuration

1. **Settings Folder**:
   - `DirToSave.txt`: Should contain the path where files will be saved. The path should be absolute.
   - `DownloadCopy.txt`: Should contain `Y` if you want to save a copy of the file to the `Lib` folder, or `N` if not.

## Initial Setup

Before running the main script, you need to configure the settings. 

1. **Run the Settings Script**:
   - Double-click `Settings.bat` to configure your download settings.
   - Follow the prompts to set up `DirToSave.txt` and `DownloadCopy.txt`.

2. **Configuration Files**:
   - `DirToSave.txt`: Enter the full path where you want the files to be saved.
   - `DownloadCopy.txt`: Enter `Y` if you want to save a copy of the file to the `Download` folder as well, or `N` if not.

## Usage

1. **Run the Batch File**:
   - Double-click `youtube_download_batch.bat` to execute the script.

2. **Follow the Prompts**:
   - **Enter Video or Playlist URL**: Provide the URL of the video or playlist you want to download.
   - **Select Format Code**: After fetching format information, enter the format code you want to download.

3. **Download Options**:
   - If `DownloadCopy.txt` contains `Y`, the script will save the file in both the `Download` folder and the directory specified in `DirToSave.txt`.
   - If `DownloadCopy.txt` contains `N`, the script will save the file only in the directory specified in `DirToSave.txt`.

## Error Handling

- **Error During Fetch or Download**: If an error occurs, the script will display a message and log details in `error.log`.
- **Empty Settings**: If `DirToSave.txt` or `DownloadCopy.txt` are empty or not properly set up, the script will prompt you to correct the settings.

## Example

1. **Settings Files**:
   - `DirToSave.txt`: `C:\Users\Admin\Downloads`
   - `DownloadCopy.txt`: `Y`

2. **Script Execution**:
   - When prompted, enter the URL of the video or playlist.
   - Choose the format code you wish to download.
   - The script will download the file to both the `Download` folder and `C:\Users\Admin\Downloads`.

## Troubleshooting

- **No Files Downloaded**: Ensure `yt-dlp.exe` is present in the `Lib` folder and that `DirToSave.txt` and `DownloadCopy.txt` are correctly configured.
- **Error Messages**: Check `error.log` for detailed error messages if the script encounters issues during fetching or downloading.

-----

- **`merge_media.bat`**: A batch file for running `ffmpeg`
- **`ffplay_launcher.bat`**: A batch file for launching `ffplay` with different playback options.
- **`ffprobe_launcher.bat`**: A batch file for running `ffprobe` with various information display options.
- **`Lib`**: Folder containing `ffplay.exe` and `ffprobe.exe`.

## `ffplay_launcher.bat`

This batch file provides a simple menu for playing media files using `ffplay`. Users can choose from several options to customize playback.

### Options:

1. **Play Video**: Play the selected video file.
2. **Play Audio**: Play the selected audio file without video.
3. **Play Video in Fullscreen**: Play the video file in fullscreen mode.
4. **Play Video with Audio Disabled**: Play the video file with audio disabled.
5. **Play Video with Video Disabled**: Play the audio file only, without video.
6. **Play from URL**: Play media from a given URL.

### Usage:

1. Double-click `ffplay_launcher.bat` to run it.
2. Select an option by entering the corresponding number.
3. Enter the path or URL of the media file when prompted.

## `ffprobe_launcher.bat`

This batch file allows users to extract and display various types of information from media files using `ffprobe`.

### Options:

1. **Show Basic Info**: Display basic information about the media file, including format and streams.
2. **Show Detailed Info**: Display detailed and pretty-printed information about the media file.
3. **Show Stream Info**: Display information about the streams in the media file.
4. **Show Format Info**: Display information about the format of the media file.

### Usage:

1. Double-click `ffprobe_launcher.bat` to run it.
2. Select an option by entering the corresponding number.
3. Enter the path or URL of the media file when prompted.

## Notes

- Ensure that the paths or URLs you enter are correct and accessible.
- The batch files assume that `ffplay.exe` and `ffprobe.exe` are located in the `Lib` folder. Adjust the paths in the batch files if the folder structure is different.

## `merge_media.bat`

2. **Follow the Prompts**:
   - **Folder Path**: Enter the full path to the folder containing your video and audio files.
   - **Video File**: Enter the filename of the video file (e.g., `video.mp4` or `video.mpeg`).
   - **Audio File**: Enter the filename of the audio file (e.g., `audio.mp3`).
   - **Video Codec**: Specify the video codec (e.g., `libx264` for H.264, or `copy` to keep the original codec).
   - **Audio Codec**: Specify the audio codec (e.g., `aac`, or `copy` to keep the original codec).
   - **Output File**: Enter the desired name for the output file (e.g., `output.mp4`). If you don't provide an `.mp4` extension, it will be added automatically.

## Features

- **UTF-8 Encoding**: Handles filenames and paths with non-Latin and special characters.
- **Codec Flexibility**: Allows you to choose both video and audio codecs.
- **Error Handling**: Provides clear error messages if files or directories are not found or if there are issues with FFmpeg.

## Troubleshooting

- **Folder or File Not Found**: Ensure that the paths and filenames are correct and that they match the files in your specified directory.
- **FFmpeg Issues**: Make sure `ffmpeg.exe` is correctly placed in the `Lib` folder and is accessible.

## Example

Here is an example of how to use the script:

1. **Folder Path**: `C:\Users\Admin\Downloads\Videos`
2. **Video File**: `sample_video.mp4`
3. **Audio File**: `background_music.mp3`
4. **Video Codec**: `libx264`
5. **Audio Codec**: `aac`
6. **Output File**: `final_output.mp4`

The script will merge `sample_video.mp4` and `background_music.mp3` into a new file called `final_output.mp4` using the specified codecs.

## License

This script is provided "as-is" without warranty of any kind. Feel free to use and modify it according to your needs.


