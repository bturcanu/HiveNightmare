# Check if the system is vulnerable to HiveNightmare
$SAMFilePath = "$env:windir\system32\config\SAM"
$Acl = Get-Acl $SAMFilePath
$AccessRules = $Acl.GetAccessRules($true, $true, [System.Security.Principal.NTAccount])
$NonAdminAccessRules = $AccessRules | Where-Object { $_.AccessControlType -eq 'Allow' -and $_.IdentityReference -notmatch 'S-1-5-32-544' }
if ($NonAdminAccessRules) {
    Write-Host "HiveNightmare vulnerability detected!"
} else {
    Write-Host "System is not vulnerable to HiveNightmare."
}