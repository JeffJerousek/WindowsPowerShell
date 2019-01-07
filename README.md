# Intro
This repository contains my personal Windows 10 PowerShell default configurations for use on multiple workstations. This way I stay synchronised on my preferences between multiple workstations.

This Git repository should be synced with the default windows PowerShell folder in your Documents folder,
e.g.: C:\Users\bwn\Documents\WindowsPowerShell.

# Profile settings
Change the default profile settings on all consoles by editing the ``Profile.ps1`` file.

# Additional functions
The Profile.ps1 file contains a referral (. sourcing) to specific functions that I use frequently. These are located in the following files:  
* MyFuntions.ps1
* Office365Functions.ps1

# PowerShell Console here
To be able to open a PowerShell console from the context menu, use:  
* Add-PowerShelltoContextMenu.reg
* Add-PowerShelltoShiftContextMenu.reg

You can remove these options with the 'remove-' option.

# PowerShell Script Template here
To be able to start a PowerShell script template from the context menu, use:  
* Add-Ps1ToNewFileMenu.reg
* Add-Ps1WithTemplateToNewFileMenu.reg
* Add-Ps1WithTemplateToNewFileMenu-mn.reg (for my professional workstation)

You can remove these options with the 'remove-' option.

# Additional modules
Some PowerShell commands / functions require installation of some additional modules.  
These modules are:  
* The Microsoft Online Services Sign-In Assistant for IT Professionals RTW (http://aka.ms/t01i1o).
* The Microsoft Azure Active Directory Module for Windows PowerShell (http://aka.ms/siqtee).
* The SharePoint Online Management Shell at http://aka.ms/f04q5o.
* The Skype for Business Online module for Windows
PowerShell at http://go.microsoft.com/fwlink/?LinkId=294688.
