function Ensure-ProfileExists {
    # Check if the profile file exists
    if (-not (Test-Path -Path $PROFILE)) {
        # If the profile doesn't exist, create it along with the directory if necessary
        $profileDirectory = Split-Path -Path $PROFILE
        if (-not (Test-Path -Path $profileDirectory)) {
            New-Item -ItemType Directory -Path $profileDirectory -Force
        }
        New-Item -ItemType File -Path $PROFILE -Force
        Write-Host "Profile created at $PROFILE"
    } else {
        Write-Host "Profile already exists at $PROFILE"
    }
}
