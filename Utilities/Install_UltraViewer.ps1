$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$file = Invoke-WebRequest -UseBasicParsing -Uri "https://www.ultraviewer.net/en/download.html" | Select-Object -ExpandProperty Links | Where-Object {$_.href -like "*UltraViewer_setup_*.exe"} | Select-Object -ExpandProperty href | Select-Object -First 1
$dlLink = "https://www.ultraviewer.net/en/$file"
$InstallerPath = Join-Path $env:TEMP $file
(New-Object System.Net.WebClient).DownloadFile($dlLink, $InstallerPath)
Start-Process $InstallerPath -Wait -ArgumentList "/VERYSILENT /NORESTART" -Verb RunAs
Remove-Item $InstallerPath