# Convert-Cmdlet Function

## Description
The `Convert-Cmdlet` function is a PowerShell utility designed to encode the names of PowerShell cmdlets. It replaces each character in a given cmdlet name with an index from a randomized set of valid characters, then constructs a new string representation of that cmdlet.

## Usage

### Syntax
```powershell
$result = Convert-Cmdlet -cmdlet '<cmdlet-name>'
```

### Parameters
- `-cmdlet`: The name of the PowerShell cmdlet you want to convert.

### Examples
```powershell
# Convert the cmdlet 'Get-Process'
$encodedCmdlet = Convert-Cmdlet -cmdlet 'Get-Process'
Write-Host $encodedCmdlet
```

## Function Code
```powershell
function Convert-Cmdlet {
    param (
        [string]$cmdlet
    )

    # All valid characters in a cmdlet name
    $valid = ('-0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.ToCharArray() | Sort-Object { Get-Random }) -join ''
    $replaceWith = $valid.ToCharArray()
    $extractedCharArray = @()
    $cmdletCharArray = $cmdlet.ToCharArray()

    # Loop through each character within the cmdlet
    ForEach ($char in $cmdletCharArray) {
        If ($char -in $replaceWith) {
            $extractedCharArray += $([array]::IndexOf($replaceWith, $char))
        }
    }

    $NewValue = "& ((""$valid"")[$($extractedCharArray -join ',')] -join '')"
    return $NewValue
}
```

## Notes
- The function generates a unique encoding for each cmdlet based on a randomized set of valid characters.
- This encoding is primarily for demonstration purposes and should be tested before use in production environments.
