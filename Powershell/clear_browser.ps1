# file: clear_browser.ps1
# $softwarelist can have multiple by using a ',' between each process name.
# This script was place in a scheduled task to run after 5pm each night. This is 
# to ensure that I am no longer logged into any services that could be comprimised

$softwarelist = 'chrome'
# Get all processes of the above list and force close them before continuing
get-process |
    Where-Object {$_.ProcessName -match $softwarelist} |
    stop-process -force

# Items to delete
$Items = @('Archived History',
            'Cache\*',
            'Cookies',
            'History',
            'Login Data',
            'Top Sites',
            'Visited Links',
            'Web Data')
$Folder = "$($env:LOCALAPPDATA)\Google\Chrome\User Data\Default"

# For each item delete the files
$Items | ForEach-Object { 
    if((Test-Path -Path "$Folder\$_" )){
        Remove-Item "$Folder\$_" 
    }
}

# Stop the Powershell Process (the hosting window)
stop-process -Id $PID
