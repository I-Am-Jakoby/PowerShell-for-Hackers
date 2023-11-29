function OpenFormsOnSecondaryMonitors {
    [CmdletBinding()]
    param ()

    process {
        # Load System.Windows.Forms assembly for accessing monitor details and form handling
        Add-Type -AssemblyName System.Windows.Forms

        # Retrieve all screens connected to the system
        $screens = [System.Windows.Forms.Screen]::AllScreens

        # Iterate through each screen and open a form if it's not the primary monitor
        foreach ($screen in $screens) {
            if (-not $screen.Primary) {
                # Create a new form
                $form = New-Object System.Windows.Forms.Form
                $form.Text = "Secondary Monitor Form - $($screen.DeviceName)"
                $form.WindowState = 'Maximized'
                $form.FormBorderStyle = 'None'
                $form.StartPosition = 'Manual'
                $form.Bounds = $screen.Bounds

                # Show the form
                $form.Show()
            }
        }
    }
}
