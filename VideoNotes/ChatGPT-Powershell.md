### Explain My Payloads

```powershell
invoke-AIExplain -Value (irm jakoby.lol/hackerquiz)

invoke-AIExplain -Value (irm https://raw.githubusercontent.com/dfinke/PowerShellAI/master/Public/Get-OpenAIEmbeddings.ps1)

```

### Ai Powered Portscan

```powershell
# Command to get all open ports

$ports = Get-NetTCPConnection | Where-Object { $_.State -eq 'Established' } | Select-Object LocalPort, RemotePort | Sort-Object LocalPort, RemotePort -Unique

# Example array for this demo

$ports = @(22)
```

```powershell
# Custom function to load array of ports into custom prompt to generate a security report

function Invoke-portReport ($ports){
$date = Get-Date -Format "yyyy-MM-dd"
$name = $env:username
$Script:portReport = Get-GPT4Completion -Content "can you generate a pentesting report inserting the $date and $name highlighting the dangers of having the following ports open: $ports"
}
```

### Generating Dalle Image

```powershell
Get-DalleImage -Description "a cat in a rockband"
```
