$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$file = "TIDALSetup.exe"
$dlLink = "https://download.tidal.com/desktop/$file"
$InstallerPath = Join-Path $env:TEMP $file
(New-Object System.Net.WebClient).DownloadFile($dlLink, $InstallerPath)
Start-Process $InstallerPath -Wait -ArgumentList "-s" -Verb RunAs
Wait-Process "TIDALSetup"
Remove-Item $InstallerPath