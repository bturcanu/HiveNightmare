# Require administrative privileges
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "This script must be run as an administrator" -ForegroundColor Red
    exit
}

# Restrict access to contents of system folder
icacls %windir%\system32\config\*.* /inheritance:e

# Remove VSS shadow copies
vssadmin delete shadows /for=$env:SystemDrive /Quiet
 
# Print results 
if ($LASTEXITCODE -eq 0) {
    Write-Host "VSS shadow copies deleted successfully." -ForegroundColor Green
} else {
    Write-Host "Failed to delete VSS shadow copies." -ForegroundColor Red
}