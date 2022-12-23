$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$file = "PlayniteInstaller.exe"
$dlLink = "https://playnite.link/download/$file"
$InstallerPath = Join-Path $env:TEMP $file
(New-Object System.Net.WebClient).DownloadFile($dlLink, $InstallerPath)
# Playnite does not support silent install, so we will use an AutoHotkey script to automatically direct our input:
$scriptLink = "https://github.com/tylerlurie/App-Installers/raw/main/Other/Game%20Launchers/Install_Playnite_Inputs.exe"
$ahkScript = "Install_Playnite_Inputs.exe"
$ahkScriptPath = "$env:TEMP\$ahkScript"
(New-Object System.Net.WebClient).DownloadFile($scriptLink, $ahkScriptPath)
Start-Process $InstallerPath -Verb RunAs
Start-Process $ahkScriptPath -Wait -Verb RunAs
Remove-Item $ahkScriptPath
While (Test-Path -Path $InstallerPath)
{
	Remove-Item $InstallerPath -ErrorAction SilentlyContinue
}