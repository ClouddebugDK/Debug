If(-not(Get-InstalledModule Get-IntuneManagementExtensionDiagnostics -ErrorAction silentlycontinue)){
    Install-Module -name Get-IntuneManagementExtensionDiagnostics -force -Confirm:$False
}
Import-Module Get-IntuneManagementExtensionDiagnostics
Get-IntuneManagementExtensionDiagnostics.ps1 -ShowAllTimelineEntries -ShowLogViewerUI 

 if (!($host.name -match "ISE")) {
    Write-Host ""
    Write-Host "Script Finalized"
    
    $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}