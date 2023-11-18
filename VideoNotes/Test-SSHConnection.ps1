function Test-SSHConnection {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Username,

        [Parameter(Mandatory=$true)]
        [string]$ServerIP
    )

    ssh -q -o BatchMode=yes -o ConnectTimeout=5 $Username@$ServerIP 'exit 0'
    if ($? -eq $true) {
        Write-Host "SSH connection to $ServerIP successful"
    } else {
        Write-Host "SSH connection to $ServerIP failed"
    }
}
