if (-not (Get-Module -ListAvailable Get-IntuneManagementExtensionDiagnostics -ErrorAction silentlycontinue)){
    Install-Module -name Get-IntuneManagementExtensionDiagnostics -force -Confirm:$False
}

Get-IntuneManagementExtensionDiagnostics.ps1 -ShowAllTimelineEntries

 if (!($host.name -match "ISE")) {
    Write-Host ""
    Write-Host "Script Finalized"
    
    $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}