<# PowerShell script to extract all Policy's from gpresult
   and display them in a clean view. This will allow for
   N-Able to review settings.
   Append this to a lig file as I have added a timestamp.
#>
$gp_results = gpresult /R /V 

$results_as_array = $gp_results -split "`r`n"

<# This is the final return values #>
$final_hash = @{}

<# Run through the results and only show the required settings.
   These are stored in a Hash (final_hash) That can be output
   to a file (append).
#>
foreach ($item in $results_as_array) { 
    if ($item.Trim().StartsWith("Policy:")) {
        $item2 = $item.Trim().Replace("Policy:", "")
        $key = $item2.Trim()

    } elseif($item.Trim().StartsWith("Computer Setting:")) {
        $item3 = $item.Trim().Replace("Computer Setting:", "")
        $value = $item3.Trim()
    }

    if ($key -ne $null -and $value -ne $null -and -not ($final_hash.ContainsKey($key.Trim()))) {
        $final_hash.Add($key.Trim(), $value.Trim())
        $key = $null
        $value = $null
    }
 }

 <# Get the date for the date stamp, this is so the file can be appended too.
 #>
 $date_ = Get-Date
 $date_.ToShortDateString()



<# Simple formatting for file output #>
 foreach ($item in $final_hash.Keys) {
    $item + "=" + $final_hash.$item
 }
 <# New line to separate days for easy reading log #>
 "`r`n"
