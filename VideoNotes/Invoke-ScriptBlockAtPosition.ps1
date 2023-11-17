function Invoke-ScriptBlockAtPosition {
    param (
        [Parameter(Mandatory)]
        [scriptblock]$ScriptBlock,

        [int]$X = 0,
        [int]$Y = 0
    )

    # Save current cursor position to restore later
    $originalPosition = $Host.UI.RawUI.CursorPosition

    try {
        # Set cursor position
        $newPosition = New-Object System.Management.Automation.Host.Coordinates $X, $Y
        $Host.UI.RawUI.CursorPosition = $newPosition

        # Invoke the script block
        & $ScriptBlock
    }
    finally {
        # Restore original cursor position
        $Host.UI.RawUI.CursorPosition = $originalPosition
    }
}
