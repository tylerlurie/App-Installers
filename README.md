# App-Installers
This repository contains a collection of PowerShell scripts to download and automatically install the latest 64-bit version of a given application. These scripts also delete the installers they download, and occasionally other files they use, after installations are finished.

## Installations
For the most part, these scripts will download the MSI installers for applications whenever available. EXEs are downloaded for applications that do not support MSIs.

Applications are typically installed for all users whenever possible, and on a per-user basis when system-wide installation is not supported.

Installations are done silently with no setting configurations done in advance. This means most apps include a desktop shortcut by default. I intend to support applications that do not have silent install switches with AutoHotkey whenever feasible.

## Usage
To install a given application from this repository, you can either download an individual script and run it, or run the following line in PowerShell:
```
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString("https://raw.githubusercontent.com/tylerlurie/App-Installers/main/path/to/installer.ps1"))
```

It is preferable to use an Administrator instance PowerShell to avoid having to accept User Account Control promptings while installing applications, but it is not mandatory, as each installation command will prompt to elevate to administrative privileges if it needs them and does not already have them.

To install multiple apps with a single script, you can use an array of links. For example:
```
$links = @(
            "https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Web%20Browsers/Install_Firefox.ps1",
            "https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Documents/Install_Office365_HomePrem.ps1",
            "https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Documents/Install_Adobe_Reader.ps1",
            "https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Compression/Install_7-Zip.ps1",
            "https://github.com/tylerlurie/App-Installers/blob/main/Developer%20Tools/Install_Notepad%2B%2B.ps1",
            "https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Media/Install_VLC.ps1",
            "https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Messaging/Install_Zoom.ps1"
)

foreach ($link in $links)
{
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString($link))
}
```

## Currently Included Apps
* [.NET 3.1 Desktop Runtime](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Runtimes/Install_.NET_3.1_Desktop_Runtime.ps1)
* [.NET 5 Desktop Runtime](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Runtimes/Install_.NET_5_Desktop_Runtime.ps1)
* [.NET 6 Desktop Runtime](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Runtimes/Install_.NET_6_Desktop_Runtime.ps1)
* [.NET Framework 4.8](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Runtimes/Install_.NET_Framework_4.8.ps1)
* [7-Zip](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Compression/Install_7-Zip.ps1)
* [Adobe Reader](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Documents/Install_Adobe_Reader.ps1)
* [Amazon Games](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Other/Game%20Launchers/Install_Amazon_Games.ps1)
* [AnyDesk](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Utilities/Install_AnyDesk.ps1)
* [Audacity](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Media/Install_Audacity.ps1)
* [Avast](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Security/Install_Avast.ps1)
* [Bandicam](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Other/Screen%20Recorders/Install_Bandicam.ps1)
* [Battle.net](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Other/Game%20Launchers/Install_Battle.net.ps1)
* [Brave](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Web%20Browsers/Install_Brave.ps1)
* [Discord](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Messaging/Install_Discord.ps1)
* [Double Commander](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Other/File%20System%20Tools/Install_Double_Commander.ps1)
* [Dropbox](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Online%20Storage/Install_Dropbox.ps1)
* [EA App](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Other/Game%20Launchers/Install_EA_App.ps1)
* [emClient](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Messaging/Install_emClient.ps1)
* [Epic Games Launcher](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Other/Game%20Launchers/Install_Epic_Games_Launcher.ps1)
* [Everything](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Other/File%20System%20Tools/Install_Everything.ps1)
* [FileZilla](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Developer%20Tools/Install_FileZilla.ps1)
* [Firefox](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Web%20Browsers/Install_Firefox.ps1)
* [foobar2000](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Media/Install_foobar2000.ps1)
* [Free Download Manager](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Utilities/Install_Free_Download_Manager.ps1)
* [FreeCommander](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Other/File%20System%20Tools/Install_FreeCommander.ps1)
* [FreeOffice](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Documents/Install_FreeOffice.ps1)
* [GIMP](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Imaging/Install_GIMP.ps1)
* [GOG Galaxy](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Other/Game%20Launchers/Install_GOG_Galaxy.ps1)
* [Google Chrome](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Web%20Browsers/Install_Google_Chrome.ps1)
* [Google Drive for Desktop](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Online%20Storage/Install_Google_Drive_for_Desktop.ps1)
* [Greenshot](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Imaging/Install_Greenshot.ps1)
* [Honeyview](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Imaging/Install_Honeyview.ps1)
* [iTunes](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Media/Install_iTunes.ps1)
* [JDK](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Developer%20Tools/Install_JDK.ps1)
* [K-Lite Codec Pack Full](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Media/Install_K-Lite_Codec_Pack_Full.ps1)
* [LibreOffice](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Documents/Install_LibreOffice.ps1)
* [Malwarebytes](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Security/Install_Malwarebytes.ps1)
* [Microsoft Teams for Home or Small Business](https://github.com/tylerlurie/App-Installers/blob/main/Messaging/Install_Microsoft_Teams_Home_Small_Business.ps1)
* [Microsoft Teams for Work or School](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Messaging/Install_Microsoft_Teams_Work_School.ps1)
* [Notepad++](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Developer%20Tools/Install_Notepad%2B%2B.ps1)
* [OBS Studio](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Other/Screen%20Recorders/Install_OBS_Studio.ps1)
* [Office 365 Apps for Business](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Documents/Install_Office365_Business.ps1)
* [Office 365 Apps for Enterprise](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Documents/Install_Office365_Enterprise.ps1)
* [Office 365 Personal](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Documents/Install_Office365_HomePrem.ps1)
* [Opera](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Web%20Browsers/Install_Opera.ps1)
* [Oracle VM VirtualBox](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Other/Virtualization%20Software/Install_Oracle_VM_VirtualBox.ps1)
* [Origin](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Other/Game%20Launchers/Install_Origin.ps1)
* [PDFCreator](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Documents/Install_PDFCreator.ps1)
* [PeaZip](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Compression/Install_PeaZip.ps1)
* [Playnite](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Other/Game%20Launchers/Install_Playnite.ps1)
* [PotPlayer](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Media/Install_PotPlayer.ps1)
* [PuTTY](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Developer%20Tools/Install_PuTTY.ps1)
* [Python 2.7](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Developer%20Tools/Install_Python_2.7.ps1)
* [Python 3](https://github.com/tylerlurie/App-Installers/blob/main/Developer%20Tools/Install_Python_3.ps1)
* [qBittorrent](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/File%20Sharing/Install_qBittorrent.ps1)
* [Revo Uninstaller](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Utilities/Install_Revo_Uninstaller.ps1)
* [Sandboxie-Plus](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Other/Virtualization%20Software/Install_Sandboxie-Plus.ps1)
* [ShareX](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Imaging/Install_ShareX.ps1)
* [Signal](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Messaging/Install_Signal.ps1)
* [Soft Organizer](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Utilities/Install_Soft_Organizer.ps1)
* [Spotify](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Media/Install_Spotify.ps1)
* [Steam](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Other/Game%20Launchers/Install_Steam.ps1)
* [Sublime Text](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Developer%20Tools/Install_Sublime_Text.ps1)
* [Sumatra PDF](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Documents/Install_Sumatra_PDF.ps1)
* [TeamSpeak](https://github.com/tylerlurie/App-Installers/blob/main/Messaging/Install_TeamSpeak.ps1)
* [TeamViewer](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Utilities/Install_TeamViewer.ps1)
* [Telegram](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Messaging/Install_Telegram.ps1)
* [Thunderbird](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Messaging/Install_Thunderbird.ps1)
* [Tidal](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Media/Install_Tidal.ps1)
* [Total Commander](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Other/File%20System%20Tools/Install_Total_Commander.ps1)
* [Ubisoft Connect](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Other/Game%20Launchers/Install_Ubisoft_Connect.ps1)
* [UltraViewer](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Utilities/Install_UltraViewer.ps1)
* [Visual C++ Redistributable](https://github.com/tylerlurie/App-Installers/blob/main/Runtimes/Install_VCRedist-x64.ps1)
* [Visual Studio Code](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Developer%20Tools/Install_Visual_Studio_Code.ps1)
* [Visual Studio Community](https://github.com/tylerlurie/App-Installers/blob/main/Developer%20Tools/Install_Visual_Studio_Community.ps1)
* [Vivaldi](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Web%20Browsers/Install_Vivaldi.ps1)
* [VLC media player](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Media/Install_VLC.ps1)
* [VMware Player](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Other/Virtualization%20Software/Install_VMware_Player.ps1)
* [WinRAR](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Compression/Install_WinRAR.ps1)
* [WinSCP](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Developer%20Tools/Install_WinSCP.ps1)
* [Zoom](https://raw.githubusercontent.com/tylerlurie/App-Installers/main/Messaging/Install_Zoom.ps1)