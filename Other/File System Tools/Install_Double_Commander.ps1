$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
#$dlLink = Invoke-WebRequest -UseBasicParsing -Uri "https://sourceforge.net/p/doublecmd/wiki/Download/" | Select-Object -ExpandProperty Links | Where-Object {$_.href -like "*doublecmd-*.x86_64-win64.msi*"} | Select-Object -ExpandProperty href
$dlLink = ((((Invoke-WebRequest -UseBasicParsing -Uri "https://sourceforge.net/p/doublecmd/wiki/Download/" | Select-Object -ExpandProperty Links | Where-Object {$_.href -like "*doublecmd-*.x86_64-win64.msi*"} | Select-Object -ExpandProperty href) -replace "http://", "https://cfhcable.dl.") -replace "/projects/", "/project/") -replace "/files", "") -replace "/download", ""
$file = $dlLink -split "/" | Select-Object -Last 1
$InstallerPath = Join-Path $env:TEMP $file
(New-Object System.Net.WebClient).DownloadFile($dlLink, $InstallerPath)
Start-Process msiexec.exe -Wait -ArgumentList "/i $InstallerPath /qn" -Verb RunAs
Remove-Item $InstallerPath