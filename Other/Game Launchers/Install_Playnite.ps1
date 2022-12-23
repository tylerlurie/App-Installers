$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$file = "PlayniteInstaller.exe"
$dlLink = "https://playnite.link/download/$file"
$InstallerPath = Join-Path $env:TEMP $file
(New-Object System.Net.WebClient).DownloadFile($dlLink, $InstallerPath)
# Playnite does not support silent install, so we will use an AutoHotkey script to automatically direct our input:
$ahkScript = "Install_Playnite_Inputs.exe"
$ahkScriptPath = "$env:TEMP\$ahkScript" # TODO: Pull this from GitHub so the user doesn't need to have both files on the system
Start-Process $InstallerPath -Verb RunAs
Start-Process $ahkScript -Wait -Verb RunAs
While (Test-Path -Path $InstallerPath)
{
	Remove-Item $InstallerPath -ErrorAction SilentlyContinue
}