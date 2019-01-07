<#
.SYNOPSIS
  PowerShell Profile
.DESCRIPTION
  This profile file contains settings, functions and links to other Dot sourced functions
  snippets that get loaded when starting any kind of PowerShell (terminal or ISE).
  Add this file to your $HOME\Documents\WindowsPowerShell\Profile.ps1 directory to make it work.
  e.g.: C:\Users\bwn\Documents\WindowsPowerShell
  Source of this code is available on C:\cloud\Code\PowerShell\
.PARAMETER <Parameter_Name>
  None
.INPUTS
 None
.OUTPUTS
  None
.NOTES
  Version:        1.1
  Author:         Bas Willemstijn
  Creation Date:  dec 17, 2018
  Purpose/Change: Initial profile.
                  FOR DEMONSTRATION PURPOSES ONLY. USE AT YOUR OWN RISK!
  
.EXAMPLE
  None
#>
#-----------------------------------------------------------[Execution]------------------------------------------------------------
# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Make transcrypt everytime I start
$now = Get-Date -Format 'dddd-hhmmtt'
Start-Transcript "C:\Users\bwn\OneDrive - MN\PSTranscripts\PS-Transcript-$now.txt"

# dot sorcing to my functions
. C:\Users\bwn\OneDrive\Code\PowerShell\MyFunctions.ps1
. C:\Users\bwn\OneDrive\Code\PowerShell\Office365Funtions.ps1

# Start PowerShell in specific location
Set-Location C:\Users\bwn\OneDrive\Code\
# Clear-Host

# Welcome message
$Guy = $env:Username.ToUpper()
Write-Host "You are now entering PowerShell: $Guy"
