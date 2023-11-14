

```powershell
param([string]$path = "$PWD")

try {
	$stopWatch = [system.diagnostics.stopwatch]::startNew()

	$path = Resolve-Path "$path"
	Write-Progress "Scanning $path for empty folders..."
	[int]$count = 0
	Get-ChildItem "$path" -attributes Directory -recurse -force | Where-Object { @(Get-ChildItem $_.FullName -force).Count -eq 0 } | ForEach-Object {
		"📂$($_.FullName)"
		$count++
	}
	Write-Progress -completed " "
	[int]$Elapsed = $stopWatch.Elapsed.TotalSeconds
	"✔️ Found $count empty directories within 📂$path in $elapsed sec" 
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
```
