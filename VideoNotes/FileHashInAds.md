


```powershell
function Set-FileHashInADS {
    param (
        [Parameter(Mandatory=$true)]
        [string]$FilePath
    )

    # Check if the file exists
    if (-not (Test-Path -Path $FilePath)) {
        Write-Error "File not found: $FilePath"
        return
    }

    # Calculate the hash of the file
    $fileHash = $null
    try {
        $fileHash = Get-FileHash -Path $FilePath -Algorithm SHA256 | Select-Object -ExpandProperty Hash
    } catch {
        Write-Error "Failed to calculate hash for file: $FilePath. Error: $_"
        return
    }

    # Create/overwrite the ADS named 'hash' with the file hash
    $hashStreamPath = "$FilePath"+":hash"
    try {
        Set-Content -Path $hashStreamPath -Value $fileHash
        Write-Host "Hash stored in alternate data stream 'hash' for file $FilePath"
    } catch {
        Write-Error "Failed to write hash to alternate data stream for file: $FilePath. Error: $_"
    }
}
```
