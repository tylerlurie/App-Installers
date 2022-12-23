$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$file = "PotPlayerSetup64.exe"
$dlLink = "https://t1.daumcdn.net/potplayer/PotPlayer/Version/Latest/$file"
$InstallerPath = Join-Path $env:TEMP $file
(New-Object System.Net.WebClient).DownloadFile($dlLink, $InstallerPath)
Start-Process $InstallerPath -Wait -ArgumentList "/S" -Verb RunAs
Remove-Item $InstallerPath