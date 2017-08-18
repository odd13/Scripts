<# file: remove_profile
    This will rename a given profile so that a fresh login can be performed on that
    user. 
    Steps:
        1. Check this is not the same user as profile removal request
        2. Rename Registry
        3. Rename Folder
#>

<# Rename $prof_name to be the profile you wish to remove #>
$prof_name = "test"
$prof_to_remove = ""


<# Profile folders to rename. These might be windows version specific and need to be adjusted #>
$prof_folder = $env:USERPROFILE.Remove($env:USERPROFILE.Length - $env:USERNAME.Length) + $prof_name.ToString()
$prof_folder_renamed = $env:USERPROFILE.Remove($env:USERPROFILE.Length - $env:USERNAME.Length) + $prof_name.ToString() + ".old"


<# $profiles = Get-Childitem HKLM:"\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\ProfileList\\" -ErrorAction SilentlyContinue#>
$profiles = Get-Childitem HKLM:"\\SOFTWARE\\Mozilla\MaintenanceService\\" 

<# Error check that you are not the same user you want to remove #>
if($env:UserName.ToString().ToLower() -eq $prof_name.ToLower()) {
    "You are trying to remove a Profile from the same profile user. You logged in as: '" + $env:UserName.ToString() + "' and you are trying to remove: '" + $prof_name + "'"
    <# Exit if profile is the same user #>
       
}

<# Finds the profile according to the variable $prof_name and
    sets this to the variable $prof_to_remove. #>
function rename_registry_profile() {
    foreach($profile in $profiles) {
    
        foreach($p in $profile) {
            if($p.GetValue("ProfileImagePath") -and -not $profile.PSChildName.EndsWith(".old")){
                if($p.GetValue("ProfileImagePath").ToString() -eq $prof_name) {  
                    $prof_to_remove = $p.PSPath
                    $new_name = $p.PSChildName + ".old"
                    <# REMOVE COMMENT
                    Rename-Item -Path $prof_to_remove -NewName $new_name
                    #>
                    $profile.PSChildName + " - IS renamed."
                } 
            } else {
                $profile.PSChildName + " - NOT renamed."
            }
        }
    }
}

<# Try to rename the profile folder #>
function rename_folder() {
    try {
        <# REMOVE COMMENT
        Rename-Item $prof_folder $prof_folder_renamed -ErrorAction Stop
        #>
        "Renamed folder: " + $prof_folder + " to: " + $prof_folder_renamed
    } Catch {
        "Error: " + $_.Exception.Message
    }
}

<# -- MAIN -- #>
rename_registry_profile
rename_folder
