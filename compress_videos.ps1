param (
    [string]$InputFile,
    [string]$OutputFile
)

# Video Compression Utility for AnbuMani Birthday Website
# Optimized for mobile zero-latency playback (H.264 + AAC + FastStart)

$ffmpegExe = "C:\Users\sakth\AppData\Local\Microsoft\WinGet\Packages\Gyan.FFmpeg.Essentials_Microsoft.Winget.Source_8wekyb3d8bbwe\ffmpeg-9.0.1-essentials_build\bin\ffmpeg.exe"

if (-not (Test-Path $ffmpegExe)) {
    $ffmpegCmd = Get-Command ffmpeg -ErrorAction SilentlyContinue
    if ($ffmpegCmd) { $ffmpegExe = $ffmpegCmd.Source }
}

if (-not (Test-Path $ffmpegExe)) {
    Write-Host "FFmpeg not found. Please verify installation." -ForegroundColor Red
    exit 1
}

$videosDir = Join-Path $PSScriptRoot "videos"
if (-not (Test-Path $videosDir)) { New-Item -ItemType Directory -Path $videosDir -Force }

if ($InputFile -and $OutputFile) {
    Write-Host "Compressing $InputFile -> $OutputFile..." -ForegroundColor Cyan
    & $ffmpegExe -y -i $InputFile -vcodec libx264 -crf 26 -preset fast -vf "scale='min(720,iw)':-2" -acodec aac -b:a 128k -movflags +faststart $OutputFile
    Write-Host "Compression complete!" -ForegroundColor Green
    exit 0
}

# If no parameters provided, look for any video files in the videos/ folder or current directory
$sourceVideos = Get-ChildItem -Path $videosDir -Filter "*.mp4" | Where-Object { $_.Name -notlike "*_compressed.mp4" -and $_.Name -notlike "comedy_*.mp4" }

if ($sourceVideos.Count -eq 0) {
    Write-Host "Usage: .\compress_videos.ps1 <input_video.mp4> <output_video.mp4>" -ForegroundColor Yellow
    Write-Host "Example: .\compress_videos.ps1 my_hostel_video.mp4 videos\comedy_1.mp4" -ForegroundColor Cyan
    Write-Host "`nOr simply drop raw videos into the 'videos' folder and run this script!" -ForegroundColor White
} else {
    $idx = 1
    foreach ($v in $sourceVideos) {
        $outPath = Join-Path $videosDir "comedy_$idx.mp4"
        Write-Host "Compressing $($v.Name) -> $outPath ..." -ForegroundColor Cyan
        & $ffmpegExe -y -i $v.FullName -vcodec libx264 -crf 26 -preset fast -vf "scale='min(720,iw)':-2" -acodec aac -b:a 128k -movflags +faststart $outPath
        Write-Host "Created $outPath (Optimized for Android 0-lag playback)" -ForegroundColor Green
        $idx++
    }
}
