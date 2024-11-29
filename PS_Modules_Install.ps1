Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

### Here is a list of Powershell modules to install for O365 management
### Select the ones you need, installing too many modules can lead to autocomplete being slow
### Autocomplete is slow when the Az modules are installed, not the ones below

### The list of all Graph modules can be found here:
### https://learn.microsoft.com/en-us/powershell/module/?view=graph-powershell-1.0
Install-Module -Name Microsoft.Graph.Users -Force -AllowClobber
Install-Module -Name Microsoft.Graph.Groups -Force -AllowClobber
Install-Module -Name Microsoft.Graph.Calendar -Force -AllowClobber
Install-Module -Name Microsoft.Graph.Reports -Force -AllowClobber
Install-Module -Name Microsoft.Graph.Security -Force -AllowClobber
Install-Module -Name Microsoft.Graph.Teams -Force -AllowClobber
Install-Module -Name Microsoft.Graph.DeviceManagement -Force -AllowClobber
Install-Module -Name Microsoft.Graph.Identity.DirectoryManagement -Force -AllowClobber
Install-Module -Name Microsoft.Graph.Identity.SignIns -Force -AllowClobber

### Legacy Modules can still be useful
Install-Module -Name AzureAD -Force -AllowClobber
Import-Module AzureAd

Install-Module -Name MSOnline -Force -AllowClobber
Import-Module MSOnline 

Install-Module -Name ExchangeOnlineManagement -Force -AllowClobber
Import-Module ExchangeOnlineManagement

Install-Module -Name SharePointPnPPowerShellOnline -Force -AllowClobber
Import-Module SharePointPnPPowerShellOnline

Install-Module -Name ImportExcel -Force -AllowClobber

### Install/Update all help files for installed modules
Write-Host "Download help files..."
Update-Help -Force
