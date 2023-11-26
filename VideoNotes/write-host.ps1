function Write-Host {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$false, ValueFromRemainingArguments=$true)]
        [Object[]]
        $Object,

        [ConsoleColor]
        $ForegroundColor,

        [ConsoleColor]
        $BackgroundColor,

        [switch]
        $NoNewline,

        [string]
        $LogPath
    )

    # Convert objects to a single string
    $output = $Object -join ' '

    # Call the original Write-Host with the parameters
    Microsoft.PowerShell.Utility\Write-Host $output -ForegroundColor $ForegroundColor -BackgroundColor $BackgroundColor -NoNewline:$NoNewline

    # Custom logic for logging
    if ($LogPath) {
        Add-Content -Path $LogPath -Value $output
    }
}
