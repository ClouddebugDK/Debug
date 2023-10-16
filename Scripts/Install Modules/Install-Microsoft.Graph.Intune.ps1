# Install the required NuGet provider if not already installed
if (-not (Get-PackageProvider -Name NuGet -ListAvailable -ErrorAction SilentlyContinue)) {
    Install-PackageProvider -Name NuGet -Force
}

# Define required modules
$requiredModules = @("Microsoft.Graph.Intune")

foreach ($module in $requiredModules) {
    if (-not (Get-Module -Name $module -ListAvailable)) {
        Install-Module -Name $module -Force -Scope CurrentUser
        Write-Host "$module module has been installed."
    } else {
        Write-Host "$module module already exists. Checking for updates."
        $latestVersion = (Find-Module -Name $module).Version
        $installedVersion = (Get-Module -Name $module).Version

        if ($latestVersion -gt $installedVersion) {
            Write-Host "Updating $module module to version $latestVersion."
            Update-Module -Name $module -Force
        } else {
            Write-Host "Latest version of $module module is already installed."
        }
    }
}
