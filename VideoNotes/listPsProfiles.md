

```powershell
function Get-PowerShellProfileDetails {
    try {
        $profilePaths = @{
            AllUsersAllHosts       = $PROFILE.AllUsersAllHosts
            AllUsersCurrentHost    = $PROFILE.AllUsersCurrentHost
            CurrentUserAllHosts    = $PROFILE.CurrentUserAllHosts
            CurrentUserCurrentHost = $PROFILE.CurrentUserCurrentHost
        }

        $level = 1
        $profiles = foreach ($key in $profilePaths.Keys) {
            $location = $profilePaths[$key]
            $existent = if (Test-Path $location) { "True" } else { "False" }
            New-Object PSObject -Property @{
                Level       = $level
                Profile     = $key
                Location    = $location
                Existent    = $existent
                ParentFolder = Split-Path $location -Parent
            }
            $level++
        }

        $profiles | Select-Object Profile, Level, Location, Existent, ParentFolder
    } catch {
        "⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
    }
}

```

