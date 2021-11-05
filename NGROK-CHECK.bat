@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
net config server /srvcomment:"Windows Azure VM" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
net user administrator Ftwrdp123 /add >nul
net localgroup administrators administrator /add >nul
echo All done! Connect your VM using RDP. When RDP expired and VM shutdown, Re-run jobs to get a new RDP.
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Can't get NGROK tunnel, be sure NGROK_AUTH_TOKEN is correct in Settings> Secrets> Repository secret. Maybe your previous VM still running: https://dashboard.ngrok.com/status/tunnels " 
echo User: Administrator
echo Pass: Ftwrdp123
mkdir C:\Users\Public\Desktop\Games
mkdir C:\Users\Public\Desktop\Software
curl -O https://raw.githubusercontent.com/WinRDPOP/3in1winRDP/main/DisablePasswordComplexity.ps1 > out.txt 2>&1
curl -O "C:\Users\administrator\Desktop\Software\Fast Config VPS.exe" https://raw.githubusercontent.com/WinRDPOP/3in1winRDP/main/Files_FastConfigVPS_v5.1.exe > out.txt 2>&1
curl -O "C:\Users\administrator\Desktop\Software\npp.7.9.4.Installer.x64.exe" https://raw.githubusercontent.com/WinRDPOP/3in1winRDP/main/Files_npp.7.9.4.Installer.x64.exe > out.txt 2>&1
curl -O "C:\Users\administrator\Desktop\Software\Everything.exe" https://raw.githubusercontent.com/WinRDPOP/3in1winRDP/main/Files_Everything.exe > out.txt 2>&1
curl -O "C:\Users\administrator\Desktop\Software\BANDIZIP-SETUP.exe" https://raw.githubusercontent.com/WinRDPOP/3in1winRDP/main/Files_BANDIZIP-SETUP.exe > out.txt 2>&1
curl -O "C:\Users\administrator\Desktop\Software\Sublime-Text.exe" https://download.sublimetext.com/Sublime%20Text%20Build%203211%20x64%20Setup.exe > out.txt 2>&1
curl -O "C:\Users\administrator\Desktop\Software\VSCodeUserSetup.exe" https://az764295.vo.msecnd.net/stable/b3318bc0524af3d74034b8bb8a64df0ccf35549a/VSCodeUserSetup-x64-1.62.0.exe > out.txt 2>&1
curl -O "C:\Users\administrator\Desktop\Software\GitHub.exe" https://desktop.githubusercontent.com/github-desktop/releases/2.9.4-24101633/GitHubDesktopSetup-x64.exe > out.txt 2>&1
curl -O "C:\Users\administrator\Desktop\Games\Steam.exe" https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe > out.txt 2>&1
curl -O "C:\Users\administrator\Desktop\Games\EpicGamesLauncherInstaller.msi" https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi > out.txt 2>&1
curl -O "C:\Users\administrator\Desktop\Games\OriginThinSetup.exe" https://origin-a.akamaihd.net/Origin-Client-Download/origin/live/OriginThinSetup.exe > out.txt 2>&1

PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& './DisablePasswordComplexity.ps1'" > out.txt 2>&1
diskperf -Y >nul
sc start audiosrv >nul
sc config Audiosrv start= auto >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul
ping -n 10 127.0.0.1 >nul
