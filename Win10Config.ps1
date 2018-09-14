# Michael Cerne - Removes apps, tiles, and basic reg tweaks

Get-AppxPackage -Name *WindowsCamera* | Remove-AppxPackage
Get-AppxPackage -Name *WindowsMaps* | Remove-AppxPackage
Get-AppxPackage -Name *WindowsSoundRecorder* | Remove-AppxPackage
Get-AppxPackage -Name *WindowsAlarms* | Remove-AppxPackage
Get-AppxPackage -Name *WindowsFeedbackHub* | Remove-AppxPackage
Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage
Get-AppxPackage -Name *WindowsPhone* | Remove-AppxPackage
Get-AppxPackage -Name *BingNews* | Remove-AppxPackage
Get-AppxPackage -Name *BingFinance* | Remove-AppxPackage
Get-AppxPackage -Name *BingSports* | Remove-AppxPackage
Get-AppxPackage -Name *BingWeather* | Remove-AppxPackage
Get-AppxPackage -Name *ZuneVideo* | Remove-AppxPackage
Get-AppxPackage -Name *ZuneMusic* | Remove-AppxPackage
Get-AppxPackage -Name *SkypeApp* | Remove-AppxPackage
Get-AppxPackage -Name *MicrosoftOfficeHub* | Remove-AppxPackage
Get-AppxPackage -Name *Messaging* | Remove-AppxPackage
Get-AppxPackage -Name *Office.OneNote* | Remove-AppxPackage
Get-AppxPackage -Name *OneConnect* | Remove-AppxPackage
Get-AppxPackage -Name *Getstarted* | Remove-AppxPackage
Get-AppxPackage -Name *Phone* | Remove-AppxPackage
Get-AppxPackage -Name *Sway* | Remove-AppxPackage
Get-AppxPackage -Name *Print3D* | Remove-AppxPackage
Get-AppxPackage -Name *Microsoft3DViewer* | Remove-AppxPackage
Get-AppxPackage -Name *3DBuilder* | Remove-AppxPackage
Get-AppxPackage -Name *NetworkSpeedTest* | Remove-AppxPackage
Get-AppxPackage -Name *RemoteDesktop* | Remove-AppxPackage
Get-AppxPackage -Name *Wallet* | Remove-AppxPackage
Get-AppxPackage -Name *XboxApp* | Remove-AppxPackage
Get-AppxPackage -Name *BubbleWitch* | Remove-AppxPackage
Get-AppxPackage -Name *HiddenCity* | Remove-AppxPackage
Get-AppxPackage -Name *Disney* | Remove-AppxPackage
Get-AppxPackage -Name *MarchofEmpires* | Remove-AppxPackage
Get-AppxPackage -Name *CandyCrush* | Remove-AppxPackage
Get-AppxPackage -Name *MicrosoftSolitaireCollection* | Remove-AppxPackage
Get-AppxPackage -Name *RoyalRev* | Remove-AppxPackage
Write-Host "Removed Appx"

(New-Object -Com Shell.Application).
    NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').
    Items() |
  %{ $_.Verbs() } |
  ?{$_.Name -match 'Un.*pin from Start'} |
  %{$_.DoIt()}
Write-Host "Removed Tiles"

New-ItemProperty -Path "Registry::HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" -Name "System.IsPinnedToNameSpaceTree" -Value "0" -PropertyType DWORD -Force | Out-Null
Write-Host "Removed OneDrive Integration"

New-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" -Name "CortanaConsent" -Value "0" -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" -Name "AllowSearchToUseLocation" -Value "0" -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Value "0" -PropertyType DWORD -Force | Out-Null
#New-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "ConnectedSearchUseWebOverMeteredConnections" -Value "0" -PropertyType DWORD -Force | Out-Null
#New-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -Value "0" -PropertyType DWORD -Force | Out-Null
#New-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "DisableWebSearch" -Value "0" -PropertyType DWORD -Force | Out-Null
#New-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "ConnectedSearchUseWeb" -Value "0" -PropertyType DWORD -Force | Out-Null
Write-Host "Disabled Cortana Web Search"

Write-Host "Modifications Finished"
Write-Host "Completed"
