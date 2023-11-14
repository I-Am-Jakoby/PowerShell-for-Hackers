


```powershell
param([string]$path = "$PWD")

try {
	$stopWatch = [system.diagnostics.stopwatch]::startNew()

	$path = Resolve-Path "$path"
	Write-Progress "Scanning $path for encrypted files..."
	[int]$count = 0
	Get-ChildItem "$path" -attributes Encrypted -recurse | Foreach-Object {
		"📄$($_.FullName)"
		$count++
	}
	Write-Progress -completed " "
	[int]$elapsed = $stopWatch.Elapsed.TotalSeconds
	"✔️ Found $count encrypted files within 📂$path in $elapsed sec" 
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
```
