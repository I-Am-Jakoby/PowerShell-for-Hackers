$a = Get-Content -Path ($MyInvocation.MyCommand.Path)

$b = (Invoke-webrequest -URI "https://github.com/I-Am-Jakoby/PowerShell-for-Hackers/blob/main/Assets/Scripts/ut.ps1").Content

$update = $a -eq $b

echo $update

if ($Host.Name -eq "ConsoleHost")
{
    Write-Host "Press any key to continue..."
    $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp") > $null
}
