$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$file = "fdm_x64_setup.exe"
$dlLink = "https://dn3.freedownloadmanager.org/6/latest/$file"
$InstallerPath = Join-Path $env:TEMP $file
(New-Object System.Net.WebClient).DownloadFile($dlLink, $InstallerPath)
Start-Process $InstallerPath -Wait -ArgumentList "/SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART" -Verb RunAs
Remove-Item $InstallerPath