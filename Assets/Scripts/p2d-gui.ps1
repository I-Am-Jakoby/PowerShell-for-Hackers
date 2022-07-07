Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();

[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);'

[Console.Window]::ShowWindow([Console.Window]::GetConsoleWindow(), 0)

<# 
.NAME
    p2d
#>

#-------------------------------------------------------------------------------------------------------
Function Get-Folder($initialDirectory="")

{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")|Out-Null

    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.Description = "Select a folder"
    $foldername.rootfolder = "MyComputer"
    $foldername.SelectedPath = $initialDirectory

    if($foldername.ShowDialog() -eq "OK")
    {
        $folder += $foldername.SelectedPath
    }
    return $folder
}

#-------------------------------------------------------------------------------------------------------


Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$LabelColor = "black"

$Button = 'system.Windows.Forms.Button'

$Form                                 = New-Object system.Windows.Forms.Form
$Form.ClientSize                      = New-Object System.Drawing.Point(400,500)
$Form.text                            = "Powershell to Ducky Script Converter"
$Form.TopMost                         = $false

$SourceLabel                          = New-Object system.Windows.Forms.Label
$SourceLabel.ForeColor                = $LabelColor
$SourceLabel.text                     = "Powershell File:"
$SourceLabel.AutoSize                 = $true
$SourceLabel.location                 = New-Object System.Drawing.Point(15,15)
$SourceLabel.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$MLabel                               = New-Object system.Windows.Forms.Label
$MLabel.ForeColor                	  = 'red'
$MLabel.text                     	  = "Mandatory"
$MLabel.AutoSize                	  = $true
$MLabel.location                 	  = New-Object System.Drawing.Point(200,15)
$MLabel.Font                   	  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$SourceTextBox                        = New-Object system.Windows.Forms.TextBox
$SourceTextBox.multiline              = $false
$SourceTextBox.Size 		        = New-Object System.Drawing.Size(300,60)
$SourceTextBox.location               = New-Object System.Drawing.Point(15,40)
$SourceTextBox.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$btnFileBrowser                       = New-Object -TypeName $Button
$btnFileBrowser.BackColor             = '#1a80b6'
$btnFileBrowser.text                  = 'Browse'
$btnFileBrowser.width                 = 96
$btnFileBrowser.height                = 30
$btnFileBrowser.location              = New-Object System.Drawing.Point(15,70)
$btnFileBrowser.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$btnFileBrowser.ForeColor             = '#ffffff'

$OutputLabel                          = New-Object system.Windows.Forms.Label
$OutputLabel.ForeColor                = $LabelColor
$OutputLabel.text                     = "Output Path:"
$OutputLabel.AutoSize                 = $true
$OutputLabel.location                 = New-Object System.Drawing.Point(15,110)
$OutputLabel.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$M2Label                              = New-Object system.Windows.Forms.Label
$M2Label.ForeColor                	  = 'red'
$M2Label.text                     	  = "Mandatory"
$M2Label.AutoSize                	  = $true
$M2Label.location                 	  = New-Object System.Drawing.Point(200,110)
$M2Label.Font                   	  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$OutputTextBox                        = New-Object system.Windows.Forms.TextBox
$OutputTextBox.multiline              = $false
$OutputTextBox.Size 		        = New-Object System.Drawing.Size(300,60)
$OutputTextBox.location               = New-Object System.Drawing.Point(15,135)
$OutputTextBox.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$btnFolderBrowser                      = New-Object -TypeName $Button
$btnFolderBrowser.BackColor            = '#1a80b6'
$btnFolderBrowser.text                 = 'Browse'
$btnFolderBrowser.width                = 96
$btnFolderBrowser.height               = 30
$btnFolderBrowser.location             = New-Object System.Drawing.Point(15,165)
$btnFolderBrowser.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$btnFolderBrowser.ForeColor            = '#ffffff'

$PayloadLabel                          = New-Object system.Windows.Forms.Label
$PayloadLabel.ForeColor                = $LabelColor
$PayloadLabel.text                     = "Payload Name: "
$PayloadLabel.AutoSize                 = $true
$PayloadLabel.location                 = New-Object System.Drawing.Point(15,205)
$PayloadLabel.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$PayloadTextBox                        = New-Object system.Windows.Forms.TextBox
$PayloadTextBox.multiline              = $false
$PayloadTextBox.Size 		         = New-Object System.Drawing.Size(300,60)
$PayloadTextBox.location               = New-Object System.Drawing.Point(15,230)
$PayloadTextBox.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$AuthorLabel                          = New-Object system.Windows.Forms.Label
$AuthorLabel.ForeColor                = $LabelColor
$AuthorLabel.text                     = "Author Name: "
$AuthorLabel.AutoSize                 = $true
$AuthorLabel.location                 = New-Object System.Drawing.Point(15,270)
$AuthorLabel.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$AuthorTextBox                        = New-Object system.Windows.Forms.TextBox
$AuthorTextBox.multiline              = $false
$AuthorTextBox.Size 		         = New-Object System.Drawing.Size(300,60)
$AuthorTextBox.location               = New-Object System.Drawing.Point(15,295)
$AuthorTextBox.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$DescriptionLabel                     = New-Object system.Windows.Forms.Label
$DescriptionLabel.ForeColor           = $LabelColor
$DescriptionLabel.text                = "Description"
$DescriptionLabel.AutoSize            = $true
$DescriptionLabel.location            = New-Object System.Drawing.Point(15,340)
$DescriptionLabel.Font                = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$DescriptionBox 			        = New-Object System.Windows.Forms.TextBox
$DescriptionBox.Location 	        = New-Object System.Drawing.Point(15,365) 
$DescriptionBox.Size 		        = New-Object System.Drawing.Size(300,60) 
$DescriptionBox.Multiline 	        = $true 
$DescriptionBox.AcceptsReturn         = $true 

$button_ok = New-Object -TypeName System.Windows.Forms.Button
$button_ok.Size = New-Object -TypeName System.Drawing.Size(75,23)
$button_ok.Location = New-Object -TypeName System.Drawing.Size(250,450)
$button_ok.Text = 'OK'

$Form.controls.AddRange(@($btnFileBrowser, $SourceLabel, $SourceTextBox, $MLabel, $OutputLabel, $M2Label, $OutputTextBox, $btnFolderBrowser, $PayloadLabel, $PayloadTextBox, $AuthorLabel, $AuthorTextBox, $DescriptionLabel, $DescriptionBox, $button_ok))


#region Logic 

#-------------------------------------------------------------------------------------------------------
#Source Browse button click event

$btnFileBrowser.Add_Click({
Add-Type -AssemblyName System.windows.forms | Out-Null
#Creating an object for OpenFileDialog to a Form
$OpenDialog = New-Object -TypeName System.Windows.Forms.OpenFileDialog
#Initiat browse path can be set by using initialDirectory
$OpenDialog.initialDirectory = $initialDirectory
$OpenDialog.ShowDialog() | Out-Null
$filePath = $OpenDialog.filename
#Assigining the file choosen path to the text box
$SourceTextBox.Text = $filePath 
})
#-------------------------------------------------------------------------------------------------------
#Output Browse button click event

$btnFolderBrowser.Add_Click({
$folder = Get-Folder
#Assigining the file choosen path to the text box
$OutputTextBox.Text = $folder 
})
#-------------------------------------------------------------------------------------------------------

# The action on the button
$button_ok.Add_Click({

	$Source = $SourceTextBox.Text

	$Output = $OutputTextBox.Text

	$Payload = $PayloadTextBox.Text

	$Author = $AuthorTextBox.Text

	$Description = $DescriptionBox.Text
	
	if (!$Payload) { $Payload = "DuckyPayload" }

	if (!$Output) { $Output = [Environment]::GetFolderPath("Desktop") }

	$Delay = 250
	
	$FilePath = ($Output+"\"+$Payload+".txt")

	$converted = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes((Get-Content -Path $Source -Raw -Encoding UTF8)))

	$numChar = $converted.length
	$Time = $numChar/140 
	$estTime = [math]::Round($Time,2)

	function splitLines{
		While ($converted)
		{ 
		$x,$converted = ([char[]]$converted).where({$_},'Split',$incriment)
		$x -join ''
		}
	}

	$lSplit = splitLines

	echo "REM     This payload was generated using I am Jakoby's Powershell to DuckyScript Converter." >> $FilePath
	echo "REM     See how you can do the same here: https://github.com/I-Am-Jakoby/PowerShell-for-Hackers `n" >> $FilePath
	echo "REM --> $numChar Characters: Estimated $estTime seconds to execute `n" >> $FilePath

	if ($Payload)      { echo "REM		Title:       $Payload"        >> $FilePath}
	if ($Author)       { echo "REM		Author:      $Author"         >> $FilePath}
	if ($Description)  { echo "REM		Description: $Description"    >> $FilePath}

	echo "" >> $FilePath
	echo "GUI r" >> $FilePath
	echo "DELAY $Delay" >> $FilePath
	echo "STRING powershell" >> $FilePath
	echo "DELAY $Delay" >> $FilePath
	echo "ENTER" >> $FilePath
	echo "DELAY $Delay" >> $FilePath
	echo "STRING powershell -enc " >> $FilePath
	echo "DELAY $Delay" >> $FilePath

	echo "STRING $converted" >> $FilePath

	notepad $FilePath
	
	$form.Close()

})
$form_main.Controls.Add($button_ok)
$form_main.AcceptButton = $button_ok


#-------------------------------------------------------------------------------------------------------

#endregion

[void]$Form.ShowDialog()
