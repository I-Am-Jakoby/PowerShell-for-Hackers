```powershell
# Load necessary assembly for Windows Forms
Add-Type -AssemblyName System.Windows.Forms

# Create the main form with dark background
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Chat Room'
$form.Size = New-Object System.Drawing.Size(500, 400)  # Adjusted form size to accommodate buttons
$form.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 48)
$form.AutoScaleMode = 'Dpi'

# Create a RichTextBox for displaying messages with dark theme
$richTextBoxDisplay = New-Object System.Windows.Forms.RichTextBox
$richTextBoxDisplay.Location = New-Object System.Drawing.Point(10, 10)
$richTextBoxDisplay.Size = New-Object System.Drawing.Size(360, 280)
$richTextBoxDisplay.Anchor = 'Top,Left,Right,Bottom'
$richTextBoxDisplay.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 30)
$richTextBoxDisplay.ForeColor = [System.Drawing.Color]::WhiteSmoke
$form.Controls.Add($richTextBoxDisplay)

# Create a textbox for typing messages with dark theme
$textBoxInput = New-Object System.Windows.Forms.TextBox
$textBoxInput.Location = New-Object System.Drawing.Point(10, 300)
$textBoxInput.Size = New-Object System.Drawing.Size(260, 20)
$textBoxInput.Anchor = 'Bottom,Left,Right'
$textBoxInput.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 30)
$textBoxInput.ForeColor = [System.Drawing.Color]::WhiteSmoke
$form.Controls.Add($textBoxInput)

# Create a button for sending messages with dark theme
$buttonSend = New-Object System.Windows.Forms.Button
$buttonSend.Location = New-Object System.Drawing.Point(280, 300)
$buttonSend.Size = New-Object System.Drawing.Size(90, 20)
$buttonSend.Anchor = 'Bottom,Right'
$buttonSend.Text = 'Send'
$buttonSend.BackColor = [System.Drawing.Color]::FromArgb(70, 70, 70)
$buttonSend.ForeColor = [System.Drawing.Color]::WhiteSmoke
$form.Controls.Add($buttonSend)

# Add an event handler for the Send button
$buttonSend.Add_Click({
    $richTextBoxDisplay.AppendText("You: $($textBoxInput.Text)`r`n")
    $textBoxInput.Clear()
    $richTextBoxDisplay.ScrollToCaret()
})

# Create a StatusStrip for the bottom of the form
$statusStrip = New-Object System.Windows.Forms.StatusStrip
$statusStrip.BackColor = [System.Drawing.Color]::FromArgb(70, 70, 70)
$statusLabel1 = New-Object System.Windows.Forms.ToolStripStatusLabel
$statusLabel1.Text = "Status: "
$statusLabel1.ForeColor = [System.Drawing.Color]::White
$statusLabel2 = New-Object System.Windows.Forms.ToolStripStatusLabel
$statusLabel2.Text = "Connected ✅"
$statusLabel2.ForeColor = [System.Drawing.Color]::GreenYellow
$statusStrip.Items.Add($statusLabel1)
$statusStrip.Items.Add($statusLabel2)
$form.Controls.Add($statusStrip)

# Define button properties
$buttonWidth = 80
$buttonHeight = 20
$initialButtonTop = 10
$buttonSpacing = 40

# Function to create a button
function Create-Button {
    param ($text, $top)
    $button = New-Object System.Windows.Forms.Button
    $button.Location = New-Object System.Drawing.Point(400, $top)
    $button.Size = New-Object System.Drawing.Size($buttonWidth, $buttonHeight)
    $button.Anchor = 'Top,Right'  # Anchor set to Top and Right
    $button.Text = $text
    $button.BackColor = [System.Drawing.Color]::FromArgb(70, 70, 70)
    $button.ForeColor = [System.Drawing.Color]::WhiteSmoke
    return $button
}

# Create and add buttons
$buttonSearch = Create-Button -text 'Search' -top $initialButtonTop
$form.Controls.Add($buttonSearch)

$buttonSendFile = Create-Button -text 'Send File' -top ($initialButtonTop + $buttonSpacing)
$form.Controls.Add($buttonSendFile)

$buttonClearChat = Create-Button -text 'Clear Chat' -top ($initialButtonTop + 2 * $buttonSpacing)
$form.Controls.Add($buttonClearChat)

$buttonSettings = Create-Button -text 'Settings' -top ($initialButtonTop + 3 * $buttonSpacing)
$form.Controls.Add($buttonSettings)

# Event handlers for buttons (placeholders for actual functionality)
#$buttonSearch.Add_Click({ # Add search functionality here })
#$buttonSendFile.Add_Click({ # Add file sending functionality here })
#$buttonClearChat.Add_Click({ $richTextBoxDisplay.Clear() })
#$buttonSettings.Add_Click({ # Add settings functionality here })

# Show the form
$form.ShowDialog()
```

