<#
.SYNOPSIS
  PowerShell Profile
.DESCRIPTION
  This profile file contains settings, functions and links to other Dot sourced functions
  snippets that get loaded when starting any kind of PowerShell (terminal or ISE).
  Call this file Profile.ps1 and add it to your %USERPROFILE%\Documents\WindowsPowerShell directory 
  to let PowerShell pick this file up and load it every time the Shell starts.
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
Start-Transcript "C:\PS-Transcript-$now.txt"

# dot sorcing to my functions
#. %USERPROFILE%\Documents\WindowsPowerShell\MyFunctions.ps1
#. %USERPROFILE%\Documents\WindowsPowerShell\Office365Funtions.ps1

# Start PowerShell in specific location
#Set-Location %USERPROFILE%\Documents\WindowsPowerShell
# Clear-Host

# Welcome message
$Guy = $env:Username.ToUpper()
Write-Host "You are now entering PowerShell: $Guy"
