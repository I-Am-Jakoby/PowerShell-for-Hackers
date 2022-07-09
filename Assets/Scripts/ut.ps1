$fileA = Get-Content -Path ($MyInvocation.MyCommand.Path)

$fileB = (Invoke-webrequest -URI "https://raw.githubusercontent.com/I-Am-Jakoby/PowerShell-for-Hackers/main/Assets/Scripts/ut.ps1").Content

if(Compare-Object -ReferenceObject $($fileA) -DifferenceObject $($fileB))

 {"files are different"}

Else {"Files are the same"}

if ($Host.Name -eq "ConsoleHost")
{
    Write-Host "Press any key to continue..."
    $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp") > $null
}
