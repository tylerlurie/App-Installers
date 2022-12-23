$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$dlLink = Invoke-WebRequest -UseBasicParsing -Uri "https://getgreenshot.org/downloads/" | Select-Object -ExpandProperty Links | Where-Object {$_.href -like "*Greenshot-INSTALLER-*-RELEASE.exe"} | Select-Object -ExpandProperty href
$file = $dlLink -split "/" | Select-Object -Last 1
$InstallerPath = Join-Path $env:TEMP $file
(New-Object System.Net.WebClient).DownloadFile($dlLink, $InstallerPath)
Start-Process $InstallerPath -ArgumentList "/VERYSILENT /NORESTART" -Verb RunAs
While ($null -eq $(Get-Process -Name "Greenshot" -ErrorAction SilentlyContinue))
{
	Start-Sleep -Seconds 1.0
}
Remove-Item $InstallerPath