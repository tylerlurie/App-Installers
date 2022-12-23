$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$zipFile = "FreeCommanderXE-32-public_setup.zip"
$zipPath = Join-Path $env:TEMP $zipFile
$outDir = $zipFile -replace ".{4}$" # Remove .zip extension
$dlLink = "https://freecommander.com/downloads/$zipFile"
(New-Object System.Net.WebClient).DownloadFile($dlLink, $zipPath)
Expand-Archive -Path $zipPath -DestinationPath (Join-Path $env:TEMP $outDir)
$InstallerPath = [IO.Path]::Combine($env:TEMP, $outDir, "FreeCommanderXE-32-public_setup.exe")
Start-Process $InstallerPath -Wait -ArgumentList "/SP- /VERYSILENT /NORESTART" -Verb RunAs
Remove-Item (Join-Path $env:TEMP $outDir) -Recurse -Force
Remove-Item $zipPath