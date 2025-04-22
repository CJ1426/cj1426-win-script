<#move start button to correct position#>
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -name TaskbarAl -value 0

<#hide taskview button#>
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -name ShowTaskViewButton -value 0

<#hide widget button#>
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -name TaskbarMn -value 0

<#remove search bar#>
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -name SearchboxTaskbarMode -value 0

<#disable bing search#>
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -name BingSearchEnabled -value 0

<#disable file search#>
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -name Start_SearchFiles -value 0

<#show file extension#>
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -name HideFileExt -value 0

<#small icon in taskbar#>
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -name TaskbarSmallIcons -value 1

<#hide copilot icon#>
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -name ShowCopilotButton -value 0

<#set application theme preference to use Darkmode#>
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name AppsUseLightTheme -Value 0

<#set System Theme to use Darkmode#>
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name SystemUsesLightTheme -Value 0

<#disable transparent#>
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name EnableTransparency -Value 0

<#hide recommend session in start menu#>
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Explorer" -Name HideRecommendedSection -Value 1

<#use old context menu#>
New-Item -Path "HKLM:\SOFTWARE\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" -Name InProcServer32 -Value "" -Force

<#ref:https://github.com/ChrisTitusTech/winutil/blob/main/config/tweaks.json#>
<#disable Activity history#>
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name EnableActivityFeed -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name PublishUserActivities -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name UploadUserActivities -Value 0

<#disable Location Tracking#>
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name Value -Value "Deny"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" -Name SensorPermissionState -Value 0
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" -Name Status -Value 0
Set-ItemProperty -Path "HKLM:\SYSTEM\Maps" -Name AutoUpdateEnabled -Value 0

<#stop install default game#>
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Name DisableWindowsConsumerFeatures -Value 1

<#disable wifi sence#>
Set-ItemProperty -Path "HMLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Name Value -Value 0
Set-ItemProperty -Path "HMLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" -Name Value -Value 0

<#remove copilot#>
Set-ItemProperty -Path "HMLM:\Software\Policies\Microsoft\Windows\WindowsCopilot" -Name TurnOffWindowsCopilot -Value 1
Set-ItemProperty -Path "HMCU:\Software\Policies\Microsoft\Windows\WindowsCopilot" -Name TurnOffWindowsCopilot -Value 1
dism /online /remove-package /package-name:Microsoft.Windows.Copilot

<#disable recall#>
Set-ItemProperty -Path "HMLM:\Software\Policies\Microsoft\Windows\WindowsAI" -Name DisableAIDataAnalysis -Value 1
DISM /Online /Disable-Feature /FeatureName:Recall /Quiet /NoRestart

<#disable stickykeys#>
Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name Flags -Value 510

#disable startmenu search suggesion
New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Force
Set-ItemProperty -Path "HKCUL:\SOFTWARE\Policies\Microsoft\Windows\Explorer\" -Name DisableSearchBoxSuggestions -value 1 -force

# windows defender stop sample
Set-MpPreference -SubmitSamplesConsent 2 -ErrorAction SilentlyContinue

#disable effect 
set-ItemProperty -path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -name VisualFXSetting -value 2

#set wallpaper to black
set-ItemProperty -path "HKCU:\Control Panel\Desktop" -name wallpaper -value ""

#disable transperency effect
set-ItemProperty -path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -name EnableTransparency -value 0

#disable accentcolor taskbar and title
set-ItemProperty -path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -name ColorPrevalence -value 0
set-ItemProperty -path "HKCU:\SOFTWARE\Microsoft\Windows\DWM" -name ColorPrevalence -value 0
set-ItemProperty -path "HKCU:\SOFTWARE\Microsoft\Windows\DWM" -name EnableWindowColorization -value 0

#update setting
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class User32 {
    [DllImport("user32.dll")]
    public static extern int SendMessageW(IntPtr hWnd, int msg, int wParam, int lParam);
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern IntPtr FindWindow(string className, string windowName);
}
"@

$WM_SETTINGCHANGE = 0x001A
$HWND_BROADCAST = [IntPtr]::Zero
$SendMessage = [User32]::SendMessageW($HWND_BROADCAST, $WM_SETTINGCHANGE, 0, 0)

Stop-Process -name explorer -force