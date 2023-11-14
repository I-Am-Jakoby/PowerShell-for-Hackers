


```powershell
try {
	Get-NetAdapterBinding -name '*' -componentID 'ms_tcpip6' | Format-Table -autoSize -property Name,Enabled 
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
}
```
