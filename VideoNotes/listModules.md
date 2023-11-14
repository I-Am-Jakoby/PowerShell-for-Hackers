


```powershell
try {
    $modules = Get-Module -ListAvailable
    if ($modules) {
        $modules | Select-Object Name, Version, ModuleType, ExportedCommands | Format-Table -AutoSize
    } else {
        "No modules available."
    }
} catch {
    "⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
}

```
