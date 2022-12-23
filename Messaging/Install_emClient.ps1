$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$dlLink = "https://www.emclient.com/dist/latest/setup.msi"
$contentHeaders = Invoke-WebRequest -UseBasicParsing -Uri $dlLink | Select-Object -ExpandProperty Headers
$file = ([System.Net.Mime.ContentDisposition]::new($contentHeaders["Content-Disposition"])).FileName
$InstallerPath = Join-Path $env:TEMP $file
(New-Object System.Net.WebClient).DownloadFile($dlLink, $InstallerPath)
Start-Process msiexec.exe -Wait -ArgumentList "/i `"$InstallerPath`" /qn" -Verb RunAs
Remove-Item $InstallerPath