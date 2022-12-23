$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$redirectLink = "https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x86"
$request = [System.Net.WebRequest]::Create($redirectLink)
$request.AllowAutoRedirect=$false
$response=$request.GetResponse()
$dlLink = $response.GetResponseHeader("Location")
$file = "DiscordSetup.exe"
$InstallerPath = Join-Path $env:TEMP $file
(New-Object System.Net.WebClient).DownloadFile($dlLink, $InstallerPath)
Start-Process $InstallerPath -Wait -ArgumentList "-s" -Verb RunAs
Wait-Process -Name "DiscordSetup"
Remove-Item $InstallerPath