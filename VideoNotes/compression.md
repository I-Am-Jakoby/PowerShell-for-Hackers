# PowerShell Command Encoder/Decoder

This README explains the use of two PowerShell functions: `Encode-Command` and `Decode-Command`. The `Encode-Command` function is used to compress and Base64 encode a PowerShell command, while the `Decode-Command` function decodes and executes the encoded command.

## Encode-Command Function

This function compresses a given PowerShell command using Gzip and encodes it in Base64.

Usage
To use these functions:

Encode a command: $encoded = Encode-Command -Command 'Write-Output "Hello, World!"'
Decode and execute the command: Decode-Command -EncodedCommand $encoded

```powershell
function Encode-Command {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Command
    )

    # Convert command to byte array
    $byteArray = [System.Text.Encoding]::ASCII.GetBytes($Command)

    # Compress the byte array
    $memoryStream = New-Object System.IO.MemoryStream
    $gzipStream = New-Object System.IO.Compression.GzipStream $memoryStream, ([System.IO.Compression.CompressionMode]::Compress)
    $gzipStream.Write($byteArray, 0, $byteArray.Length)
    $gzipStream.Close()

    # Convert compressed data to Base64
    $encodedCommand = [Convert]::ToBase64String($memoryStream.ToArray())
    $memoryStream.Close()

    return $encodedCommand
}
```

```powershell
function Decode-Command {
    param(
        [Parameter(Mandatory=$true)]
        [string]$EncodedCommand
    )

    # Convert from Base64 to byte array
    $decodedBytes = [Convert]::FromBase64String($EncodedCommand)

    # Decompress the byte array
    $memoryStream = New-Object System.IO.MemoryStream($decodedBytes, 0, $decodedBytes.Length)
    $gzipStream = New-Object System.IO.Compression.GzipStream($memoryStream, [System.IO.Compression.CompressionMode]::Decompress)
    $streamReader = New-Object System.IO.StreamReader($gzipStream)
    $decompressedCommand = $streamReader.ReadToEnd()

    # Execute the decompressed command
    Invoke-Expression $decompressedCommand

    $gzipStream.Close()
    $memoryStream.Close()
}
```
