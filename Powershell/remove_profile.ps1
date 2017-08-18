<# file: remove_profile
    This will rename a given profile so that a fresh login can be performed on that
    user. 
    Steps:
        1. Check this is not the same user as profile removal request
        2. Rename Registry
        3. Rename Folder
#>

$prof_name = "chad.o"
$prof_to_remove = ""

<# Profile folders to rename. These might be windows version specifica and need to be adjusted #>
$prof_folder = "c:\temp\" + $prof_name.ToString()
$prof_folder_renamed = "c:\temp\" + $prof_name.ToString() + ".old"


$profiles = Get-Childitem HKLM:"\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\ProfileList\\" -ErrorAction SilentlyContinue

<# Error check that you are not the same user you want to remove #>
if($env:UserName.ToString().ToLower() -eq $prof_name.ToLower()) {
    "You are trying to remove a Profile from the same profile user. You logged in as: '" + $env:UserName.ToString() + "' and you are trying to remove: '" + $prof_name + "'"
    <# Exit if profile is the same user #>
    break   
}

<# Finds the profile according to the variable $prof_name and
    sets this to the variable $prof_to_remove. #>
function remove_registry_profile() {
    foreach($profile in $profiles) {
        foreach($p in $profile) { 
            if($p.GetValue("ProfileImagePath").ToString() -like "*" + $prof_name) {         
                $prof_to_remove = $p
                <# TODO: Add rename of registry key. #>
            }
        }
    }
}

<# Try to rename the profile folder #>
function remove_folder() {
    try {
        Rename-Item $prof_folder $prof_folder_renamed -ErrorAction Stop
    } Catch {
        "Error: " + $_.Exception.Message
    }
}

<# -- MAIN -- #>
remove_registry_profile
remove_folder

