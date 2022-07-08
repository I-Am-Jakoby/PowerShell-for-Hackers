$mypath = $MyInvocation.MyCommand.Path
Write-Output "Path of the script : $mypath"

if ($Host.Name -eq "ConsoleHost")
{
    Write-Host "Press any key to continue..."
    $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp") > $null
}
