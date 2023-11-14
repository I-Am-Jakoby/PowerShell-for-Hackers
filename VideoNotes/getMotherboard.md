


```powershell
try {
	Get-WmiObject -Class Win32_BaseBoard
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
}
```
