```powershell
function Send-TcpMessage {
    param(
        [Parameter(Mandatory = $true)]
        [string]$TargetIP,

        [Parameter(Mandatory = $true)]
        [int]$TargetPort,

        [Parameter(Mandatory = $true)]
        [string]$Message
    )

    try {
        $IP = [System.Net.Dns]::GetHostAddresses($TargetIP)[0] 
        $Address = [System.Net.IPAddress]::Parse($IP) 
        $Socket = New-Object System.Net.Sockets.TCPClient($Address, $TargetPort) 
        $Stream = $Socket.GetStream() 
        $Writer = New-Object System.IO.StreamWriter($Stream)
        $Writer.WriteLine($Message)
        $Writer.Flush()
        $Stream.Close()
        $Socket.Close()

        Write-Output "✔️ Message sent to $TargetIP : $TargetPort."
    } catch {
        Write-Error "⚠️ Error in sending message: $($_.Exception.Message)"
    }
}
```
