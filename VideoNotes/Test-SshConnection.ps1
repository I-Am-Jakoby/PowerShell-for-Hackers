function Test-SshConnection {
    param (
        [string]$IpAddress,
        [int]$Port = 22
    )

    $result = Test-NetConnection -ComputerName $IpAddress -Port $Port

    if ($result.TcpTestSucceeded) {
        Write-Host "SSH port on $IpAddress is open."
        return $true
    } else {
        Write-Host "SSH port on $IpAddress is closed or unreachable."
        return $false
    }
}
