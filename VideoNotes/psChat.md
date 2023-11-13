# Load necessary assembly for Windows Forms
Add-Type -AssemblyName System.Windows.Forms

# Create the main form with dark background
$form = New-Object System.Windows.Forms.Form
$form.Text = 'PS Chat'
$form.Size = New-Object System.Drawing.Size(400, 300)
$form.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 48)
$form.AutoScaleMode = 'Dpi'

# Create a RichTextBox for displaying messages with dark theme
$richTextBoxDisplay = New-Object System.Windows.Forms.RichTextBox
$richTextBoxDisplay.Location = New-Object System.Drawing.Point(10, 10)
$richTextBoxDisplay.Size = New-Object System.Drawing.Size(360, 200)
$richTextBoxDisplay.Anchor = 'Top,Left,Right,Bottom'
$richTextBoxDisplay.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 30)
$richTextBoxDisplay.ForeColor = [System.Drawing.Color]::WhiteSmoke
$form.Controls.Add($richTextBoxDisplay)

# Create a textbox for typing messages with dark theme
$textBoxInput = New-Object System.Windows.Forms.TextBox
$textBoxInput.Location = New-Object System.Drawing.Point(10, 220)
$textBoxInput.Size = New-Object System.Drawing.Size(260, 20)
$textBoxInput.Anchor = 'Bottom,Left,Right' # Anchored to the left, bottom, and right
$textBoxInput.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 30)
$textBoxInput.ForeColor = [System.Drawing.Color]::WhiteSmoke
$form.Controls.Add($textBoxInput)

# Create a button for sending messages with dark theme
$buttonSend = New-Object System.Windows.Forms.Button
$buttonSend.Location = New-Object System.Drawing.Point(280, 220)
$buttonSend.Size = New-Object System.Drawing.Size(90, 20)
$buttonSend.Anchor = 'Bottom,Right'
$buttonSend.Text = 'Send'
$buttonSend.BackColor = [System.Drawing.Color]::FromArgb(70, 70, 70)
$buttonSend.ForeColor = [System.Drawing.Color]::WhiteSmoke
$form.Controls.Add($buttonSend)

# Add an event handler for the Send button
$buttonSend.Add_Click({
    # For demo purposes, we just display the typed message in the richTextBoxDisplay
    # In a real application, you would send this message to the server and receive responses
    $richTextBoxDisplay.AppendText("You: $($textBoxInput.Text)`r`n")
    $textBoxInput.Clear()
    $richTextBoxDisplay.ScrollToCaret()
})

# Adding a Status Bar to the existing form
$statusBar = New-Object System.Windows.Forms.StatusBar
$form.Controls.Add($statusBar)

# Update the status bar with messages
$statusBar.Text = "Connected" # This can be dynamically updated based on application status


# Show the form
$form.ShowDialog()
