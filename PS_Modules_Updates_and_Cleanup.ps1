### This script will update all Powershell modules versions
### Then it will uninstall module versions older than the lastest one

# Update all modules
Update-Module -Force

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
            Write-Host "Uninstalling module $($v.Name) version $($v.Version)"
            # Uninstall old version
            Uninstall-Module -Name $v.Name -RequiredVersion $v.Version -Force
        }
    }
}
