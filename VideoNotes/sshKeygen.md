
# PowerShell SSH Key Generator GUI

This PowerShell script provides a graphical user interface (GUI) for generating SSH keys. It allows users to specify key parameters and ensures that existing keys are not inadvertently overwritten.

## Features

- **Email Input**: For associating the key with an email address.
- **Key Type Selection**: Allows selection from RSA, DSA, ECDSA, and ED25519.
- **Folder Path Input**: To specify the directory where the SSH key will be stored.
- **Key Name Input**: To define the name of the key.
- **Key Existence Check**: Before generating a new key, the script checks if a key with the specified name already exists.
- **Public Key Display**: After key generation, the public key content is displayed.

## Requirements

- PowerShell environment with GUI support.
- `ssh-keygen` utility available on the system.

## Instructions

1. **Open PowerShell ISE or another PowerShell editor**:
    - Copy and paste the script into the editor.

2. **Run the Script**:
    - Execute the script to display the GUI.

3. **Fill in the Details**:
    - **Email**: Enter the email address to associate with the key.
    - **Key Type**: Choose the type of key (RSA, DSA, ECDSA, ED25519).
    - **Folder Path**: Specify the directory where you want to store the key. The script will create the directory if it does not exist.
    - **Key Name**: Provide the name for the key.

4. **Generate SSH Key**:
    - Click the 'Generate SSH Key' button.
    - If a key with the same name exists, a prompt will ask if you want to overwrite it.
  
5. **View Public Key**:
    - The public key content will be displayed in the text box after generation.

## Example Usage

```
Email: user@example.com
Key Type: rsa
Folder Path: C:\Users\username\.ssh
Key Name: my_ssh_key
```

Upon clicking 'Generate SSH Key', the script will create an RSA key with the name 'my_ssh_key' under 'C:\Users\username\.ssh', associating it with 'user@example.com'. If 'my_ssh_key' already exists, it will prompt for confirmation before overwriting.

## Notes

- Always ensure the folder path provided exists or is valid.
- Be cautious while handling and generating SSH keys. Ensure you're operating in a secure environment.

```powershell
Add-Type -AssemblyName System.Windows.Forms

# Create the main form
$form = New-Object System.Windows.Forms.Form
$form.Text = 'SSH Key Generator'
$form.Size = New-Object System.Drawing.Size(350,550)
$form.StartPosition = 'CenterScreen'

# Email Label and TextBox
$emailLabel = New-Object System.Windows.Forms.Label
$emailLabel.Location = New-Object System.Drawing.Point(10,20)
$emailLabel.Size = New-Object System.Drawing.Size(280,20)
$emailLabel.Text = 'Email:'
$form.Controls.Add($emailLabel)

$emailBox = New-Object System.Windows.Forms.TextBox
$emailBox.Location = New-Object System.Drawing.Point(10,40)
$emailBox.Size = New-Object System.Drawing.Size(320,20)
$form.Controls.Add($emailBox)

# Key Type Label and ComboBox
$keyTypeLabel = New-Object System.Windows.Forms.Label
$keyTypeLabel.Location = New-Object System.Drawing.Point(10,70)
$keyTypeLabel.Size = New-Object System.Drawing.Size(280,20)
$keyTypeLabel.Text = 'Key Type:'
$form.Controls.Add($keyTypeLabel)

$keyTypeBox = New-Object System.Windows.Forms.ComboBox
$keyTypeBox.Location = New-Object System.Drawing.Point(10,90)
$keyTypeBox.Size = New-Object System.Drawing.Size(320,20)
$keyTypeBox.Items.Add('rsa')
$keyTypeBox.Items.Add('dsa')
$keyTypeBox.Items.Add('ecdsa')
$keyTypeBox.Items.Add('ed25519')
$keyTypeBox.SelectedIndex = 0
$form.Controls.Add($keyTypeBox)

# Folder Path Label and TextBox
$folderPathLabel = New-Object System.Windows.Forms.Label
$folderPathLabel.Location = New-Object System.Drawing.Point(10,120)
$folderPathLabel.Size = New-Object System.Drawing.Size(280,20)
$folderPathLabel.Text = 'Folder Path:'
$form.Controls.Add($folderPathLabel)

$folderPathBox = New-Object System.Windows.Forms.TextBox
$folderPathBox.Location = New-Object System.Drawing.Point(10,140)
$folderPathBox.Size = New-Object System.Drawing.Size(320,20)
$folderPathBox.Text = "$HOME/.ssh"
$form.Controls.Add($folderPathBox)

# Key Name Label and TextBox
$keyNameLabel = New-Object System.Windows.Forms.Label
$keyNameLabel.Location = New-Object System.Drawing.Point(10,170)
$keyNameLabel.Size = New-Object System.Drawing.Size(280,20)
$keyNameLabel.Text = 'Key Name:'
$form.Controls.Add($keyNameLabel)

$keyNameBox = New-Object System.Windows.Forms.TextBox
$keyNameBox.Location = New-Object System.Drawing.Point(10,190)
$keyNameBox.Size = New-Object System.Drawing.Size(320,20)
$keyNameBox.Text = "id_rsa"
$form.Controls.Add($keyNameBox)

# Generate Button
$generateButton = New-Object System.Windows.Forms.Button
$generateButton.Location = New-Object System.Drawing.Point(10,220)
$generateButton.Size = New-Object System.Drawing.Size(320,30)
$generateButton.Text = 'Generate SSH Key'
$form.Controls.Add($generateButton)

# Public Key Contents TextBox
$publicKeyContentsBox = New-Object System.Windows.Forms.TextBox
$publicKeyContentsBox.Location = New-Object System.Drawing.Point(10,260)
$publicKeyContentsBox.Size = New-Object System.Drawing.Size(320,250)
$publicKeyContentsBox.Multiline = $true
$publicKeyContentsBox.ScrollBars = 'Vertical'
$form.Controls.Add($publicKeyContentsBox)

# Event handler for the button click
$generateButton.Add_Click({
    $email = $emailBox.Text
    $keyType = $keyTypeBox.SelectedItem
    $folderPath = $folderPathBox.Text
    $keyName = $keyNameBox.Text
    $keyPath = Join-Path -Path $folderPath -ChildPath $keyName
    $publicKeyPath = $keyPath + ".pub"

    # Check if folder exists, create if it doesn't
    if (-not (Test-Path -Path $folderPath)) {
        New-Item -Path $folderPath -ItemType Directory
    }

    # Check if the key already exists
    if (Test-Path -LiteralPath $keyPath -or Test-Path -LiteralPath $publicKeyPath) {
        $overwrite = [System.Windows.Forms.MessageBox]::Show("The key already exists. Do you want to overwrite it?", "Confirm Overwrite", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Warning)
        if ($overwrite -ne 'Yes') {
            return
        }
    }

    $sshKeygenCommand = {ssh-keygen -t $keyType -b 4096 -C "$email" -f "$keyPath" -N ""}
    Invoke-Expression $sshKeygenCommand

    # Read and display the public key
    if (Test-Path -LiteralPath $publicKeyPath) {
        $publicKeyContents = Get-Content $publicKeyPath
        $publicKeyContentsBox.Text = $publicKeyContents
    } else {
        $publicKeyContentsBox.Text = "Public key not found."
    }

    [System.Windows.Forms.MessageBox]::Show("SSH Key generated successfully!")
})

# Show the form
$form.ShowDialog()
```
