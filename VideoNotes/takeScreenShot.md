


```powershell
function Take-Screenshot {
    param(
        [string]$FilePath = ""
    )

    # Determine the default file path if not provided
    if ($FilePath -eq "") {
        $PicturesPath = [Environment]::GetFolderPath('MyPictures')
        $ScreenshotsPath = Join-Path $PicturesPath "Screenshots"

        # Create Screenshots folder if it doesn't exist
        if (-not (Test-Path $ScreenshotsPath -PathType Container)) {
            New-Item -Path $ScreenshotsPath -ItemType Directory | Out-Null
        }

        $Time = Get-Date
        $Filename = "$($Time.Year)-$($Time.Month)-$($Time.Day)T$($Time.Hour)-$($Time.Minute)-$($Time.Second).png"
        $FilePath = Join-Path $ScreenshotsPath $Filename
    }

    try {
        Add-Type -Assembly System.Windows.Forms
        $ScreenBounds = [System.Windows.Forms.SystemInformation]::VirtualScreen
        $ScreenshotObject = New-Object System.Drawing.Bitmap $ScreenBounds.Width, $ScreenBounds.Height
        $DrawingGraphics = [System.Drawing.Graphics]::FromImage($ScreenshotObject)
        $DrawingGraphics.CopyFromScreen($ScreenBounds.Location, [System.Drawing.Point]::Empty, $ScreenBounds.Size)
        $ScreenshotObject.Save($FilePath)
        $ScreenshotObject.Dispose()
        $DrawingGraphics.Dispose()

        Write-Output "✔️ Screenshot saved to $FilePath"
    } catch {
        Write-Error "⚠️ Error in taking screenshot: $($_.Exception.Message)"
    }
}

```
