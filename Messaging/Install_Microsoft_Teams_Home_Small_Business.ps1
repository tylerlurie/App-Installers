$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$redirectLink = "https://teams.live.com/downloads/desktopcontextualinstaller?env=life&plat=windows&intent=life&download=true"
$request = [System.Net.WebRequest]::Create($redirectLink)
$request.AllowAutoRedirect=$false
$response=$request.GetResponse()
$dlLink = $response.GetResponseHeader("Location")
$file = [System.Web.HttpUtility]::UrlDecode([System.IO.Path]::GetFileName($dlLink)) -split "=" -replace "`"", "" | Select-Object -Last 1
$InstallerPath = Join-Path $env:TEMP $file
(New-Object System.Net.WebClient).DownloadFile($dlLink, $InstallerPath)
Start-Process $InstallerPath -Wait -ArgumentList "-s" -Verb RunAs
Wait-Process "MSTeamsSetup_c_l_"
Remove-Item $InstallerPath