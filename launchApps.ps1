function StartProcessIfNotRunning {
    param ([string]$ExecutablePath, [string]$ProcessName = $ExecutablePath, [string]$ArgumentList)

    if ($ProcessName -eq $ExecutablePath) {
        $ProcessName = [System.IO.Path]::GetFileNameWithoutExtension($ExecutablePath)
    }

    if (-not (Get-Process -Name $ProcessName -ErrorAction SilentlyContinue)) {
        if ($ArgumentList) { Start-Process -FilePath $ExecutablePath -ArgumentList $ArgumentList }
        else { Start-Process -FilePath $ExecutablePath }
        Start-Process -FilePath $ExecutablePath
        Write-Host "Launching $ProcessName"
    }
    else { Write-Host "$ProcessName already running" } 
}

function LaunchAllApps {
    StartProcessIfNotRunning -ExecutablePath "D:\Steam\steam.exe"
    StartProcessIfNotRunning -ExecutablePath "C:\Users\user\AppData\Local\DiscordPTB\Update.exe" -ProcessName "DiscordPTB" -ArgumentList "--processStart DiscordPTB.exe"
    StartProcessIfNotRunning -ExecutablePath "C:\Program Files\PowerToys\PowerToys.exe"
    StartProcessIfNotRunning -ExecutablePath "D:\Slava\QuickLook\QuickLook.exe"
    StartProcessIfNotRunning -ExecutablePath "D:\Slava\SuperF4\SuperF4.exe"
}

LaunchAllApps

Write-Host ""
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown') 