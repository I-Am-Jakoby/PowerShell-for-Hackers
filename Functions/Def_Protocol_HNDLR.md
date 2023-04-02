```powershell
New-Item -Path "HKCR:\ps" -Force | Out-Null
New-ItemProperty -Path "HKCR:\ps" -Name "(Default)" -Value "URL:ps Protocol" -PropertyType String -Force | Out-Null
New-ItemProperty -Path "HKCR:\ps" -Name "URL Protocol" -Value "" -PropertyType String -Force | Out-Null
New-ItemProperty -Path "HKCR:\ps\shell\open\command" -Name "(Default)" -Value '"$env:userprofile\Documents\myhandler.ps1" "%1"' `
-PropertyType String -Force | Out-Null
```



```powershell
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -w h -Ep Bypass -File "$env:userprofile\Documents\myhandler.ps1" "%1"
```


```powershell
# Extract the URI from the command-line arguments
$webURL = $args[0]

# Define a function to convert URL-encoded characters to their ASCII value
function Convert-UrlEncodedToAscii {
    param(
        [Parameter(Mandatory=$true)][string]$UrlEncodedString
    )
    
    # Decode the URL-encoded string to plain text
    $decoded = [System.Uri]::UnescapeDataString($UrlEncodedString)
    
    # Define a regular expression to match URL-encoded characters
    $regex = '%([0-9a-fA-F]{2})'
    
    # Loop through all matches of URL-encoded characters and replace them with their ASCII value
    $asciiString = ""
    ([regex]$regex).Matches($decoded) | ForEach-Object {
        $asciiValue = [int][byte]::Parse($_.Groups[1].Value, "HexNumber")
        $asciiString += [char]$asciiValue
    }
    
    # Remove all URL-encoded characters from the decoded string
    $remainingString = $decoded.Replace($regex, '')
    
    # Trim the string up to the first occurrence of "//"
    $index = $remainingString.IndexOf("//")
    if ($index -ge 0) {
        $remainingString = $remainingString.Substring($index + 2)
    }
    
    # Combine the ASCII string and the remaining string
    $decodeOutput = $asciiString + $remainingString
    
    # Trim the last character from the string
    $decodeOutput = $decodeOutput.Substring(0, $decodeOutput.Length - 1)
    
    # Return the decoded and trimmed string
    return $decodeOutput
}

# Call the function to convert the URL-encoded characters in the input URL to ASCII
$fullASCII = Convert-UrlEncodedToAscii $webURL

# Output the decoded and trimmed string in red text
Write-Host $fullASCII -ForegroundColor Red

# Execute a PowerShell command using the decoded and trimmed string as input
$CMD = "powershell.exe $fullASCII"
$CMD | iex

```
