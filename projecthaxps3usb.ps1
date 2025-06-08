# run as admin plz

function Write-Color ($text, $color='White') {
    Write-Host $text -ForegroundColor $color
}

Write-Color "🚀 Project HAX USB Formatter Installer" Cyan
Write-Color "Please enter your USB drive letter (like E): " Yellow
$drive = Read-Host

if (-not (Test-Path "$drive:\")) {
    Write-Color "❌ Drive $drive not found! Exiting..." Red
    exit
}

Write-Color "⚠️ Formatting drive $drive to FAT32 (THIS WILL ERASE ALL DATA)..." Magenta
Format-Volume -DriveLetter $drive -FileSystem FAT32 -Force -Confirm:$false

$ps3Path = "$drive:\PS3\UPDATE"
Write-Color "📁 Creating folders $ps3Path" Green
New-Item -Path $ps3Path -ItemType Directory -Force | Out-Null

$url = "https://example.com/PS3UPDAT.PUP" # your hosted file url here
$destination = Join-Path $ps3Path "PS3UPDAT.PUP"

Write-Color "📥 Downloading update file..." Cyan
Invoke-WebRequest -Uri $url -OutFile $destination -UseBasicParsing -Verbose

Write-Color "✅ Done! Your USB is ready for PS3." Green
