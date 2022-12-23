$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$file = "soft-organizer-setup.exe"
$dlLink = "https://files.chemtable.com/so/$file"
$InstallerPath = Join-Path $env:TEMP $file
(New-Object System.Net.WebClient).DownloadFile($dlLink, $InstallerPath)
Start-Process $InstallerPath -ArgumentList "/SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART" -Verb RunAs
While ($null -eq $(Get-Process -Name "SoftOrganizer" -ErrorAction SilentlyContinue))
{
	Start-Sleep -Seconds 1.0
}
Stop-Process -Name "SoftOrganizer" -ErrorAction SilentlyContinue # Prevent process from starting afterward
Wait-Process "soft-organizer-setup"
Remove-Item $InstallerPath