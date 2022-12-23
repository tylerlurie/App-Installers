$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$file = "EAappInstaller.exe"
$dlLink = "https://origin-a.akamaihd.net/EA-Desktop-Client-Download/installer-releases/$file"
$InstallerPath = Join-Path $env:TEMP $file
(New-Object System.Net.WebClient).DownloadFile($dlLink, $InstallerPath)
Start-Process $InstallerPath -Wait -ArgumentList "/S" -Verb RunAs
While ($null -eq $(Get-Process -Name "EADesktop" -ErrorAction SilentlyContinue))
{
	Start-Sleep -Seconds 1.0
}
Stop-Process -Name "EADesktop" -ErrorAction SilentlyContinue # Prevent process from starting afterward
Remove-Item $InstallerPath