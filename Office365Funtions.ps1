
#Requires -RunAsAdministrator
<#
.SYNOPSIS
  PowerShell Functions
.DESCRIPTION
   This file contains special Office 365 PowerShell management functions that get loaded
   when starting up a PowerShell session.
   . sources these functions to your PowerShell Profile for easy management of Office 365
   For more information about . sourcing, see:
   https://github.com/Willemstijn/PowerShell-Generic/wiki/Changing-the-PowerShell-profile#loading-dot-sourced-scripts-in-the-profile
.PARAMETER <Parameter_Name>
  None
.INPUTS
 None
.OUTPUTS
  None
.NOTES
  Version:        1.0
  Author:         Bas Willemstijn
  Creation Date:  jan 15, 2018
  Purpose/Change: Initial file.
                  FOR DEMONSTRATION PURPOSES ONLY. USE AT YOUR OWN RISK!
.EXAMPLE
  None
#>
#-----------------------------------------------------------[Functions]------------------------------------------------------------
function Connect-Office365 {
Import-Module MSOnline
$cred = Get-Credential
Connect-MsolService -Credential $cred

# Check for the right tenant domain and show the output to screen
$domain = Get-MsolDomain
write-host -foregroundcolor Green 'You are now connected to:' $domain.name
# write-output 'You are now connected to:' $domain.name 
}

function Connect-SharePointOnline {
Param(
   [Parameter()]
   [ValidateNotNullOrEmpty()]
   [string]$tenant=$(throw "Tenant is mandatory, please provide a value.")
   ) #end param
Set-executionpolicy -ExecutionPolicy Unrestricted
Import-Module Microsoft.Online.SharePoint.PowerShell
#$cred = Get-Credential
Connect-SPOService -Url https://$tenant-admin.sharepoint.com #-Credential $cred
write-host -foregroundcolor Green 'Remember to check with Get-SPOSite that you are connected to the right Tenant!'
}

function Connect-ExchangeOnline {
Set-executionpolicy -ExecutionPolicy Unrestricted
$cred = Get-Credential
$session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $cred -Authentication Basic -AllowRedirection
Import-PSSession $session
}

function Connect-SkypeOnline {
Set-executionpolicy -ExecutionPolicy Unrestricted
Import-Module SkypeOnlineConnector
$cred = Get-Credential
$session = New-CsOnlineSession -Credential $cred
Import-PSSession $session
}

function Get-MsolAdmins {
Get-MsolRole  | Sort-Object -Property name |
# Where-Object {$_.Name -ne 'Directory Writers' -and $_.Name -ne 'Directory Readers'} | 
    ForEach-Object {
        Write-Output $_.Name
        Get-MsolRoleMember -RoleObjectId $_.ObjectId |
        Get-MSOLUser | Select DisplayName,UserPrincipalName,BlockCredential,IsLicensed,LastPasswordChangeTimestamp | 
        Format-Table 
        }
    }

function Get-AllSpoSites {
Get-SPOSite -Detailed | Export-Csv -LiteralPath c:/temp/SPOSites.csv -NoTypeInformation
}