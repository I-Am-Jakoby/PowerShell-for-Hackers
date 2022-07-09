$file = "$env:TMP\test.ps1"
iwr https://raw.githubusercontent.com/I-Am-Jakoby/PowerShell-for-Hackers/main/Assets/Scripts/ut2.ps1 -o $file
$text = [IO.File]::ReadAllText($file)
[IO.File]::WriteAllText($file, $text.TrimEnd())

$file2 = ($MyInvocation.MyCommand.Path)

if((Get-FileHash $file).hash  -ne (Get-FileHash $file2).hash)
 {“files are different”}
Else {“Files are the same”}

if ($Host.Name -eq "ConsoleHost")
{
	$response = read-host "Press a to abort, any other key to continue."
	$aborted = $response -eq "a"
}
