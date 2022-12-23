$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$dlLink = Invoke-WebRequest -UseBasicParsing -Uri "https://www.fosshub.com/qBittorrent.html" | Select-Object -ExpandProperty Links | Where-Object {$_.href -like "*qbittorrent_[0-9].[0-9].[0-9]_x64_setup.exe"} | Select-Object -ExpandProperty href
$file = $dlLink -split "=" | Select-Object -Last 1
$InstallerPath = Join-Path $env:TEMP $file
(New-Object System.Net.WebClient).DownloadFile($dlLink, $InstallerPath)
Start-Process $InstallerPath -Wait -ArgumentList "/S" -Verb RunAs
Remove-Item $InstallerPath