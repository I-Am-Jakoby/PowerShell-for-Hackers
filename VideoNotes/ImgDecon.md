
# Load required assemblies
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Function to get image metadata
function Get-ImageMetadata {
    param ([string]$imagePath)

    $image = [System.Drawing.Image]::FromFile($imagePath)
    $metadata = @{
        "Name"      = [System.IO.Path]::GetFileName($imagePath)
        "FilePath"  = $imagePath
        "Width"     = $image.Width
        "Height"    = $image.Height
        "Format"    = $image.RawFormat.ToString()
        # Add more properties as needed
    }

    $image.Dispose()
    return $metadata
}

# Create the form with dark theme settings
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Image Metadata Viewer'
$form.Size = New-Object System.Drawing.Size(500, 600) # Adjusted form size
$form.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 48) # Dark background color
$form.AutoScaleMode = 'Dpi'

# Panel for the PictureBox
$panel = New-Object System.Windows.Forms.Panel
$panel.Size = New-Object System.Drawing.Size(470, 310) # Slightly larger than the PictureBox
$panel.Location = New-Object System.Drawing.Point(15, 15) # Adjust location as needed
$panel.BackColor = [System.Drawing.Color]::White # Border color
$form.Controls.Add($panel)

# PictureBox
$pictureBox = New-Object System.Windows.Forms.PictureBox
$pictureBox.Size = New-Object System.Drawing.Size(460, 300) # Set the PictureBox size
$pictureBox.SizeMode = "Zoom" # Scale the image proportionally
$pictureBox.Location = New-Object System.Drawing.Point(5, 5) # Adjust location to be inside the Panel
$pictureBox.BackColor = [System.Drawing.Color]::Transparent # Optional, for PictureBox background
$panel.Controls.Add($pictureBox)

# Load and display image
$imagePath = "C:\Users\micha\Desktop\zsec.png" # Use your specified image path
$pictureBox.Image = [System.Drawing.Image]::FromFile($imagePath)

# Get and display image metadata
$metadata = Get-ImageMetadata -imagePath $imagePath
$yPos = 340
foreach ($key in $metadata.Keys) {
    $label = New-Object System.Windows.Forms.Label
    $label.Text = "${key}:"
    $label.Location = New-Object System.Drawing.Point(20, $yPos)
    $label.Size = New-Object System.Drawing.Size(80, 20)
    $label.ForeColor = [System.Drawing.Color]::White
    $form.Controls.Add($label)

    $textBox = New-Object System.Windows.Forms.TextBox
    $textBox.Text = $metadata[$key]
    $textBox.Location = New-Object System.Drawing.Point(100, $yPos)
    $textBox.Size = New-Object System.Drawing.Size(380, 20)
    $textBox.ReadOnly = $true
    $form.Controls.Add($textBox)

    $yPos += 30
}

# Show the form
$form.ShowDialog()

