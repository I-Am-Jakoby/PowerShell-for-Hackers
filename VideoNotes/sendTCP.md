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

        Write-Output "✔️ Message sent to $TargetIP  :  $TargetPort."
    } catch {
        Write-Error "⚠️ Error in sending message: $($_.Exception.Message)"
    }
}

# Load necessary assembly for Windows Forms
Add-Type -AssemblyName System.Windows.Forms

# Create the main form with dark background
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Chat Room'
$form.Size = New-Object System.Drawing.Size(600, 450)  # Adjusted form size
$form.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 48)
$form.AutoScaleMode = 'Dpi'

# Create a RichTextBox for displaying messages with dark theme
$richTextBoxDisplay = New-Object System.Windows.Forms.RichTextBox
$richTextBoxDisplay.Location = New-Object System.Drawing.Point(10, 10)
$richTextBoxDisplay.Size = New-Object System.Drawing.Size(460, 300)
$richTextBoxDisplay.Anchor = 'Top,Left,Right,Bottom'
$richTextBoxDisplay.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 30)
$richTextBoxDisplay.ForeColor = [System.Drawing.Color]::WhiteSmoke
$form.Controls.Add($richTextBoxDisplay)

# Create a textbox for typing messages with dark theme
$textBoxInput = New-Object System.Windows.Forms.TextBox
$textBoxInput.Location = New-Object System.Drawing.Point(10, 320)
$textBoxInput.Size = New-Object System.Drawing.Size(360, 20)
$textBoxInput.Anchor = 'Bottom,Left,Right'
$textBoxInput.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 30)
$textBoxInput.ForeColor = [System.Drawing.Color]::WhiteSmoke
$form.Controls.Add($textBoxInput)

# Create a button for sending messages with dark theme
$buttonSend = New-Object System.Windows.Forms.Button
$buttonSend.Location = New-Object System.Drawing.Point(380, 320)
$buttonSend.Size = New-Object System.Drawing.Size(90, 20)
$buttonSend.Anchor = 'Bottom,Right'
$buttonSend.Text = 'Send'
$buttonSend.BackColor = [System.Drawing.Color]::FromArgb(70, 70, 70)
$buttonSend.ForeColor = [System.Drawing.Color]::WhiteSmoke
$form.Controls.Add($buttonSend)

# Create textboxes for target IP and Port with labels and anchor them
$labelIP = New-Object System.Windows.Forms.Label
$labelIP.Location = New-Object System.Drawing.Point(10, 350)
$labelIP.Size = New-Object System.Drawing.Size(100, 20)
$labelIP.Text = "Target IP:"
$labelIP.ForeColor = [System.Drawing.Color]::White
$labelIP.Anchor = 'Bottom,Left'  # Anchor to bottom left
$form.Controls.Add($labelIP)

$textBoxIP = New-Object System.Windows.Forms.TextBox
$textBoxIP.Location = New-Object System.Drawing.Point(120, 350)
$textBoxIP.Size = New-Object System.Drawing.Size(150, 20)
$textBoxIP.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 30)
$textBoxIP.ForeColor = [System.Drawing.Color]::WhiteSmoke
$textBoxIP.Anchor = 'Bottom,Left'  # Anchor to bottom left
$form.Controls.Add($textBoxIP)

$labelPort = New-Object System.Windows.Forms.Label
$labelPort.Location = New-Object System.Drawing.Point(10, 380)
$labelPort.Size = New-Object System.Drawing.Size(100, 20)
$labelPort.Text = "Target Port:"
$labelPort.ForeColor = [System.Drawing.Color]::White
$labelPort.Anchor = 'Bottom,Left'  # Anchor to bottom left
$form.Controls.Add($labelPort)

$textBoxPort = New-Object System.Windows.Forms.TextBox
$textBoxPort.Location = New-Object System.Drawing.Point(120, 380)
$textBoxPort.Size = New-Object System.Drawing.Size(150, 20)
$textBoxPort.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 30)
$textBoxPort.ForeColor = [System.Drawing.Color]::WhiteSmoke
$textBoxPort.Anchor = 'Bottom,Left'  # Anchor to bottom left
$form.Controls.Add($textBoxPort)


# Modify the Send button's click event
$buttonSend.Add_Click({
    $message = $textBoxInput.Text
    $targetIP = $textBoxIP.Text
    $targetPort = $textBoxPort.Text

    if ($message -ne "" -and $targetIP -ne "" -and $targetPort -ne "") {
        Send-TcpMessage -TargetIP $targetIP -TargetPort $targetPort -Message $message
        $richTextBoxDisplay.AppendText("You: $message`r`n")
        $textBoxInput.Clear()
        $richTextBoxDisplay.ScrollToCaret()
    } else {
        [System.Windows.Forms.MessageBox]::Show("Please fill all fields", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    }
})

# Create a StatusStrip for the bottom of the form
$statusStrip = New-Object System.Windows.Forms.StatusStrip
$statusStrip.BackColor = [System.Drawing.Color]::FromArgb(70, 70, 70)
$statusLabel1 = New-Object System.Windows.Forms.ToolStripStatusLabel
$statusLabel1.Text = "Status: "
$statusLabel1.ForeColor = [System.Drawing.Color]::White
$statusLabel2 = New-Object System.Windows.Forms.ToolStripStatusLabel
$statusLabel2.Text = "Disconnected"  # Default status
$statusLabel2.ForeColor = [System.Drawing.Color]::Red
$statusStrip.Items.Add($statusLabel1)
$statusStrip.Items.Add($statusLabel2)
$form.Controls.Add($statusStrip)

# Show the form
$form.ShowDialog()
```
