# Load required assemblies
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create the form
$form = New-Object System.Windows.Forms.Form
$form.Size = New-Object System.Drawing.Size(800,600)
$form.Text = "Live HTML Renderer"
$form.MinimumSize = New-Object System.Drawing.Size(800,600)

# Create a menu with a full-screen option
$menu = New-Object System.Windows.Forms.MainMenu
$menuItem = $menu.MenuItems.Add("View")
$menuItemFullScreen = $menuItem.MenuItems.Add("Toggle Full-Screen")
$menuItemFullScreen.add_Click({
    $form.WindowState = if ($form.WindowState -eq 'Normal') { 'Maximized' } else { 'Normal' }
})

$form.Menu = $menu

# Create the text area
$textArea = New-Object System.Windows.Forms.RichTextBox
$textArea.Location = New-Object System.Drawing.Point(10,10)
$textArea.Size = New-Object System.Drawing.Size(380,580)
$textArea.Anchor = 'Top,Left,Bottom'
$textArea.Multiline = $true
$textArea.ScrollBars = 'Vertical'
$form.Controls.Add($textArea)

# Create the WebBrowser control
$webBrowser = New-Object System.Windows.Forms.WebBrowser
$webBrowser.Location = New-Object System.Drawing.Point(400,10)
$webBrowser.Size = New-Object System.Drawing.Size(380,580)
$webBrowser.Anchor = 'Top,Right,Bottom'
$form.Controls.Add($webBrowser)

# Function to render HTML
$renderHtml = {
    $webBrowser.DocumentText = $textArea.Text
}

# Set event handler for text change
$textArea.add_TextChanged($renderHtml)

# Show the form
$form.ShowDialog()
