$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$file = "vs_Community.exe"
$dlLink = "https://aka.ms/vs/17/release/$file"
$InstallerPath = Join-Path $env:TEMP $file
(New-Object System.Net.WebClient).DownloadFile($dlLink, $InstallerPath)
Start-Process $InstallerPath -Wait -ArgumentList "--includeRecommended --quiet --norestart" -Verb RunAs
Remove-Item $InstallerPath