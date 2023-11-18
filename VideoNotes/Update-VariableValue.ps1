function Update-VariableValue {
    param (
        [string]$FilePath = "/root/.config/powershell/Microsoft.PowerShell_profile.ps1",
        [string]$VariableName = "lastUpdate",
        [string]$NewValue = "your_new_value_here"
    )

    # Read the script from the file
    $script = [System.IO.File]::ReadAllText($FilePath)

    # Parse the script into an AST
    $ast = [System.Management.Automation.Language.Parser]::ParseInput($script, [ref]$null, [ref]$null)

    # Find all Assignment Statements
    $assignments = $ast.FindAll({ $args[0] -is [System.Management.Automation.Language.AssignmentStatementAst] }, $true)

    # Filter for the specific variable
    $targetAssignment = $assignments | Where-Object { $_.Left.VariablePath.UserPath -eq $VariableName }

    if ($targetAssignment) {
        # Extract the full extent of the assignment statement
        $extent = $targetAssignment.Extent

        # Replace the value of the variable
        $script = $script.Remove($extent.StartOffset, $extent.Text.Length)
        $script = $script.Insert($extent.StartOffset, "`$$VariableName = '$NewValue'")

        # Write the updated script back to the file
        [System.IO.File]::WriteAllText($FilePath, $script)
        Write-Output "Updated `$VariableName variable in $FilePath"
    } else {
        Write-Output "`$$VariableName variable not found in $FilePath"
    }
}

# Usage example
Update-VariableValue -VariableName "lastUpdate" -NewValue "cookies"
