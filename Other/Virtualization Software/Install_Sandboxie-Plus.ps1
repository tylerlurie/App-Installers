$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$dlLink = Invoke-WebRequest -UseBasicParsing -Uri "https://sandboxie-plus.com/downloads/" | Select-Object -ExpandProperty Links | Where-Object {$_.href -like "*Sandboxie-Plus-x64-*.exe"} | Select-Object -ExpandProperty href
$file = $dlLink -split "/" | Select-Object -Last 1
$InstallerPath = Join-Path $env:TEMP $file
(New-Object System.Net.WebClient).DownloadFile($dlLink, $InstallerPath)
Start-Process $InstallerPath -Wait -ArgumentList "/SP- /VERYSILENT /NORESTART /ALLUSERS" -Verb RunAs
Remove-Item $InstallerPath