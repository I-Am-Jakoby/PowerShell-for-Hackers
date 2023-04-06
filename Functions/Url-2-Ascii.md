## Extract the URI from the command-line arguments

```powershell
$webURL = $args[0]
```

## Registry Key Value
```powershell
"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -w h -NoP -Ep Bypass -File "C:\temp\myhandler.ps1" "%1"
```

## URL ENCODING EXAMPLE
```
https://example.com/search?q=hello world&category=books?sort=asc


https://example.com/search?q=hello%20world%26category=books%3Fsort=asc
```


## Define a function to convert URL-encoded characters to their ASCII value
```powershell
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
```


## Call the function to convert the URL-encoded characters in the input URL to ASCII
```powershell
$fullASCII = Convert-UrlEncodedToAscii $webURL
```

## Output the decoded and trimmed string in red text (DEBUGGING)
```powershell
Write-Host $fullASCII -ForegroundColor Red
```

## Execute a PowerShell command using the decoded and trimmed string as input
```powershell
$CMD = "powershell.exe -noexit $fullASCII"
$CMD | iex
```


# Full Code 

```powershell
# Extract the URI from the command-line arguments
$webURL = $args[0]

#$UrlEncodedString | clip

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
$CMD = "powershell.exe -noexit $fullASCII"
$CMD | iex
```
