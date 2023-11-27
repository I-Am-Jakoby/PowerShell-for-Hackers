function Start-TcpListener {
    param(
        [int]$Port = 80,
        [string]$LogFile = "root\logs\log.txt"
    )

    # Ensure the logs directory exists
    $logDir = Split-Path -Path $LogFile -Parent
    if (-not (Test-Path -Path $logDir)) {
        New-Item -ItemType Directory -Path $logDir
    }

    # Loop to keep the listener running
    while ($true) {
        # Create a TCP Listener
        $listener = New-Object System.Net.Sockets.TcpListener '0.0.0.0', $Port
        $listener.Start()

        try {
            # Wait for a client connection
            $client = $listener.AcceptTcpClient()

            # Get the network stream
            $stream = $client.GetStream()
            $reader = New-Object System.IO.StreamReader($stream)

            # Read data from the client
            $data = $reader.ReadToEnd()

            # Append data to the log file
            Add-Content -Path $LogFile -Value $data

            # Clean up
            $reader.Close()
            $client.Close()
        }
        finally {
            $listener.Stop()
        }
    }
}
