# HiveNightmare
**This repository contains two PowerShell scripts that are designed to help you detect and remediate the HiveNightmare vulnerability on your Windows system.**

## Description

HiveNightmare, also known as SeriousSAM, is a Windows vulnerability that allows non-administrative users to access sensitive registry hives such as SAM, SYSTEM, and SECURITY. These hives contain sensitive information that can be exploited by attackers to elevate privileges and gain unauthorized access to the system.

`DetectHiveNightmare.ps1`
This script checks if your system is vulnerable to the HiveNightmare vulnerability. It does this by inspecting the access control list (ACL) of the SAM file and checking if any non-administrative users have access to it.

`RemediateHiveNightmare.ps1`
This script attempts to remediate the HiveNightmare vulnerability on your system. It requires administrative privileges to run and performs the following actions:

1. Restricts access to the contents of the system folder.
2. Removes VSS shadow copies that might contain sensitive information.

## Usage
### Prerequisites
* PowerShell 5.1 or higher
* Administrative privileges (for `RemediateHiveNightmare.ps1`)

### Detecting the vulnerability
1. Open PowerShell.
2. Navigate to the directory containing `DetectHiveNightmare.ps1`.
3. Run the script: `.\DetectHiveNightmare.ps1`.

If your system is vulnerable, the script will display "HiveNightmare vulnerability detected!". If not, it will display "System is not vulnerable to HiveNightmare."

### Remediation
1. Open PowerShell as an administrator.
2. Navigate to the directory containing `RemediateHiveNightmare.ps1`.
3. Run the script: `.\RemediateHiveNightmare.ps1`.

The script will restrict access to the system folder and remove VSS shadow copies. If the operation is successful, it will display "VSS shadow copies deleted successfully." Otherwise, it will display "Failed to delete VSS shadow copies."
