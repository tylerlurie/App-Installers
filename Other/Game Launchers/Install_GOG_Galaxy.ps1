$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$dlLink = (Invoke-WebRequest -UseBasicParsing -Uri "https://www.gog.com/galaxy" | Select-Object -ExpandProperty Links | Where-Object {$_.href -like "*/download/*"} | Select-Object -ExpandProperty href | Select-Object -First 1) -split "\?" | Select-Object -First 1
$file = $dlLink -split "/" | Select-Object -Last 1
$InstallerPath = Join-Path $env:TEMP $file
(New-Object System.Net.WebClient).DownloadFile($dlLink, $InstallerPath)
Start-Process $InstallerPath -Verb RunAs
While ($null -eq $(Get-Process -Name "GalaxySetup.tmp" -ErrorAction SilentlyContinue))
{
	Start-Sleep -Seconds 1.0
}
Stop-Process -Name "GalaxySetup.tmp" -Force
$finalInstaller = Join-Path $env:TEMP ((Get-ChildItem -Path "$env:TEMP\GalaxyInstaller_*" | Select-Object -ExpandProperty Name | Select-Object -First 1) + "\GalaxySetup.exe")
While (!(Test-Path $finalInstaller))
{
	Start-Sleep -Seconds 1.0
}
$InstallerPath = $finalInstaller
Start-Process $InstallerPath -Wait -ArgumentList "/VERYSILENT /NORESTART" -Verb RunAs
While (Test-Path -Path "$env:TEMP\$file")
{
	Remove-Item "$env:TEMP\$file" -ErrorAction SilentlyContinue
}