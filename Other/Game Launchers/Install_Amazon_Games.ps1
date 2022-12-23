$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$file = "AmazonGamesSetup.exe"
$dlLink = "https://download.amazongames.com/$file"
$InstallerPath = Join-Path $env:TEMP $file
(New-Object System.Net.WebClient).DownloadFile($dlLink, $InstallerPath)
# No silent install for this installer... Fortunately, no interaction needed
Start-Process $InstallerPath -Verb RunAs
While ($null -eq $(Get-Process -Name "Amazon Games UI" -ErrorAction SilentlyContinue))
{
	Start-Sleep -Seconds 1.0
}
Stop-Process -Name "Amazon Games UI" -Force
Wait-Process -Name "AmazonGamesSetup"
Remove-Item $InstallerPath