### This script will update all Powershell modules versions
### Then it will uninstall module versions older than the lastest one

# Get all installed modules
$allPSmodules = Get-InstalledModule

# Search for new version of each module and update if needed
foreach($m in $allPSmodules){
    Write-host "Looking for new version of module: $($m.Name). Current version: $($m.Version) " -ForegroundColor Cyan -NoNewline
    $find = Find-Module -Name $m.Name -Repository PSGallery
    if($find.Version -gt $m.Version){
        Write-Host " | New version: $($find.Version)" -ForegroundColor Yellow
        Update-Module -Name $m.Name -Force
    } else {
        Write-Host "No new version" -ForegroundColor Cyan
    }
}

# Get all installed modules
$allPSmodules = Get-InstalledModule


foreach($m in $allPSmodules){
    # Get all versions for each module
    $allVersions = Get-InstalledModule -Name $m.Name -AllVersions | sort version -Descending

    # Get the highest version to make sure we don't delete this one
    $highestVersion = ($allVersions | measure version -Maximum).Maximum

    foreach($v in $allVersions){
        # Skip the highest version
        if($v.version -ne $highestVersion){
            # Uninstall old version
            Write-Host "Uninstalling module $($v.Name) version $($v.Version)"
            Uninstall-Module -Name $v.Name -RequiredVersion $v.Version -Force
        }
    }
}
