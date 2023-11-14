


```powershell
function ListInstalledLanguages { 
	$List = Get-WinUserLanguageList
	foreach ($Item in $List) {
		New-Object PSObject -property @{ 'Tag' = "$($Item.LanguageTag)"; 'Autonym' = "$($Item.Autonym)"; 'English' = "$($Item.EnglishName)"; 'Spellchecking' = "$($Item.Spellchecking)"; 'Handwriting' = "$($Item.Handwriting)" }
	}
}

try {
	ListInstalledLanguages | Format-Table -property Tag,Autonym,English,Spellchecking,Handwriting
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
```
