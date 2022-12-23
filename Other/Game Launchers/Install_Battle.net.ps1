$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$file = "Battle.net-Setup.exe"
$dlLink = "https://us.battle.net/download/getInstaller?os=win&installer=$file"
$InstallerPath = Join-Path $env:TEMP $file
(New-Object System.Net.WebClient).DownloadFile($dlLink, $InstallerPath)
Start-Process $InstallerPath -ArgumentList "--lang=enUS --installpath=`"C:\Program Files (x86)\Battle.net`"" -Verb RunAs
While ($null -eq $(Get-Process -Name "Battle.net" -ErrorAction SilentlyContinue))
{
	Start-Sleep -Seconds 1.0
}
Stop-Process -Name "Battle.net" -ErrorAction SilentlyContinue # Prevent process from starting afterward
Wait-Process "Battle.net-Setup" -ErrorAction SilentlyContinue
Remove-Item $InstallerPath