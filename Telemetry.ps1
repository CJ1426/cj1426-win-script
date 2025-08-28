new-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -type Dword -Name AllowTelemetry -Value 0
new-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -type Dword -Name AllowTelemetry -Value 0
set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -name "ContentDeliveryAllowed" - value 0
set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -name "OemPreInstalledAppsEnabled" - value 0
set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -name "PreInstalledAppsEnabled" - value 0
set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -name "PreInstalledAppsEverEnabled" - value 0
set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -name "SilentInstalledAppsEnabled" - value 0
set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -name "SubscribedContent-338387Enabled" - value 0
set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -name "SubscribedContent-338388Enabled" - value 0
set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -name "SubscribedContent-338389Enabled" - value 0
set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -name "SubscribedContent-353698Enabled" - value 0
set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -name "SystemPaneSuggestionsEnabled" - value 0
set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -name "NumberOfSIUFInPeriod" - value 0
new-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -type Dword -Name DoNotShowFeedbackNotifications -Value 1
new-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -type Dword -Name DisableTailoredExperiencesWithDiagnosticData -Value 1
new-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" -type Dword -Name DisabledByGroupPolicy -Value 1
set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting" -name Disabled -value 1
set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" -name DODownloadMode - Value 1
set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Remote Assistance" -name fAllowToGetHelp - Value 0
set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" -name EnthusiastMode - Value 1
set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -name ShowTaskViewButton - Value 0
set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -name PeopleBand -value 0
set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -name LaunchTo -value 1
set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -name LongPathsEnabled -value 1
set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -name SystemResponsiveness -Value 0
set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -name NetworkThrottlingIndex -Value 4294967295
set-ItemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -name ClearPageFileAtShutdown -value 0
set-ItemProperty -path "HKLM:\SYSTEM\ControlSet001\Services\Ndu" -name Start -value 2
new-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" -type Dword -Name EnableFeeds -Value 0
set-ItemProperty -path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds" -name ShellFeedsTaskbarViewMode -Valie 2
new-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -type Dword -Name HideSCAMeetNow -Value 1
set-ItemProperty -path "HKCU:\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" -name ScoobeSystemSettingEnabled -value 0

Disable-ScheduledTask -taskpath "\Microsoft\Windows\Maps\" -taskname MapsToastTask
Disable-ScheduledTask -taskpath "\Microsoft\Windows\Maps\" -taskname MapsUpdateTask
Disable-ScheduledTask -taskpath "\Microsoft\Windows\Application Experience\" -taskname MareBackup
Disable-ScheduledTask -taskpath "\Microsoft\Windows\Application Experience\" -taskname StartupAppTask
Disable-ScheduledTask -taskpath "\Microsoft\Windows\Application Experience\" -taskname PcaPatchDbTask
Disable-ScheduledTask -taskpath "\Microsoft\Windows\Application Experience\" -taskname "Microsoft Compatibility Appraiser"
Disable-ScheduledTask -taskpath "\Microsoft\Windows\Customer Experience Improvement Program\" -taskname Consolidator
Disable-ScheduledTask -taskpath "\Microsoft\Windows\Customer Experience Improvement Program\" -taskname UsbCeip
Disable-ScheduledTask -taskpath "\Microsoft\Windows\DiskDiagnostic\" -taskname Microsoft-Windows-DiskDiagnosticDataCollector
Disable-ScheduledTask -taskpath "\Microsoft\Windows\Feedback\Siuf\" -taskname DmClient
Disable-ScheduledTask -taskpath "\Microsoft\Windows\Feedback\Siuf\" -taskname DmClientOnScenarioDownload
Disable-ScheduledTask -taskpath "\Microsoft\Windows\Windows Error Reporting\" -taskname QueueReporting