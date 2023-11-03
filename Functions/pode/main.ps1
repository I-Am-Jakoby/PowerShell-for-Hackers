Import-Module -Name Pode, Pode.Web

#$ver = "$PSVersionTable.psversion.major"

$ver = "7"
                                
$iPID = $pid

function cInfo {
	$computerSystem = Get-CimInstance CIM_ComputerSystem
	$computerName = $computerSystem.Name
	$computerModel = $computerSystem.Model
	$computerManufacturer = $computerSystem.Manufacturer

	return $computerName, $computerModel, $computerManufacturer
}

function cookie {return (pwd).path}


Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8080 -Protocol Http
	# Add-PodeEndpoint -Hostname example.pode.com -Port 8080 -Protocol Http
	
	# Show-PodeGui -Title 'Basic Server'

    New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging -Levels @("Error", "Warning")
    New-PodeLoggingMethod -Terminal | Enable-PodeRequestLogging

    Use-PodeWebTemplates -Title "$env:username" -Theme Dark -HideSidebar
	
# --------------------------------------------------------------------------------------

Set-PodeWebHomePage -Layouts @(
    New-PodeWebHero -Title 'Welcome!' -Message 'This is the home page' -Content @(
        New-PodeWebText -Value 'Here is some text!' -InParagraph -Alignment Center
    )
)

# --------------------------------------------------------------------------------------
	Enable-PodeSessionMiddleware -Duration 120 -Extend

	New-PodeAuthScheme -Form | Add-PodeAuth -Name Example -ScriptBlock {
		param($username, $password)

		# Mock user data store
		$users = @{
			'Jakoby' = @{
				ID = 'Jako302'
				Name = 'Jakoby'
				Type = 'Human'
				Password = 'password' # Replace with actual password
			}
			'Redd' = @{
				ID = 'Redd004'
				Name = 'Redd'
				Type = 'Human'
				Password = 'password'  # Replace with actual password
			}
		}

		# Check if user exists and if password matches
		$user = $users[$username]
		if ($user -and $user.Password -eq $password) {
			# Return the user details without the password
			return @{
				User = @{
					ID = $user.ID
					Name = $user.Name
					Type = $user.Type
				}
			}
		}

		# Return nothing if the authentication fails
		return $null
	}

	Set-PodeWebLoginPage -Authentication Example

# --------------------------------------------------------------------------------------
	Set-PodeWebHomePage -Layouts @(
		New-PodeWebHero -Title 'Welcome!' -Message 'This is the home page' -Content @(
			New-PodeWebText -Value 'Here is some text!' -InParagraph -Alignment Center
		)
	)
# --------------------------------------------------------------------------------------

    # social
    Set-PodeWebSocial -Type GitHub -Url 'https://github.com/badgerati'
    Set-PodeWebSocial -Type Twitter -Url 'https://twitter.com/Badgerati' -Tooltip '@Badgerati'

    $navDiv = New-PodeWebNavDivider
    $navPode = New-PodeWebNavDropdown -Name 'Social' -Icon 'cellphone-iphone' -Items @(
		New-PodeWebNavLink -Name 'Twitter' -Url 'https://twitter.com' -Icon 'twitter'
		New-PodeWebNavLink -Name 'Facebook' -Url 'https://facebook.com' -Icon 'facebook'
		New-PodeWebNavDivider
		New-PodeWebNavLink -Name 'YouTube' -Url 'https://youtube.com' -Icon 'youtube'
		New-PodeWebNavLink -Name 'Twitch' -Url 'https://twitch.tv' -Icon 'twitch'
	)
    $navPodeWeb = New-PodeWebNavLink -Name 'Help' -Url 'https://badgerati.github.io/Pode.Web/' -Icon 'help-circle'
    $navYT = New-PodeWebNavLink -Name 'Tools' -Url 'Tools' -Icon 'tools' 
    $navGH = New-PodeWebNavLink -name 'Payloads' -Url 'https://github.com/kprocyszyn/About-PowerShell' -Icon 'virus'

    Set-PodeWebNavDefault -Items $navPode, $navDiv, $navPodeWeb, $navDiv, $navYT, $navDiv, $navGH


    Add-PodeWebPage -Name 'Services' -Icon 'usb-flash-drive' -ScriptBlock {
        New-PodeWebContainer -Content @(
            New-PodeWebTable -Name 'Services' -DataColumn "Name" -SimpleFilter -ScriptBlock {
                foreach ($svc in (Get-Service)) {
                    [ordered]@{
                        Name      = $svc.Name
                        Status    = "$($svc.Status)"
                        StartType = "$($svc.StartType)"
                        Actions   = @(
                            New-PodeWebButton -Name 'Stop' -Icon 'Stop-Circle' -IconOnly -ScriptBlock {
                                Stop-Service -Name ($WebEvent.Data.Value) -Force | Out-Null
                                Show-PodeWebToast -Message "$($WebEvent.Data.Value) stopped"
                                Sync-PodeWebTable -Id $ElementData.Parent.ID
                            }
                            New-PodeWebButton -Name 'Start' -Icon 'Play-Circle' -IconOnly -ScriptBlock {
                                Start-Service -Name ($WebEvent.Data.Value) #| Out-Null
                                Show-PodeWebToast -Message "$($WebEvent.Data.Value) started"
                                Sync-PodeWebTable -Id $ElementData.Parent.ID
                            }
                        )
                    }
                }
            }
        )
    }

    Add-PodeWebPage -Name 'Form' -ScriptBlock {
        New-PodeWebCard -Content @(
			New-PodeWebText -Value get-location		
            New-PodeWebForm -Name 'Example' -ScriptBlock {
                $WebEvent.Data | Out-Default
            } -Content @(

				New-PodeWebBadge -Value 'successfully' -Colour Green
				

				
                New-PodeWebTextbox -Name 'Name' -AutoComplete {
                    return @('billy', 'bobby', 'alice', 'john', 'sarah', 'matt', 'zack', 'henry')
                }
                New-PodeWebTextbox -Name 'Password' -Type Password -PrependIcon Lock
                New-PodeWebTextbox -Name 'Date' -Type Date
                New-PodeWebTextbox -Name 'Time' -Type Time
                New-PodeWebDateTime -Name 'DateTime' -NoLabels
                New-PodeWebCredential -Name 'Credentials' -NoLabels
                New-PodeWebCheckbox -Name 'Checkboxes' -Options @('Terms', 'Privacy') -AsSwitch
                New-PodeWebRadio -Name 'Radios' -Options @('S', 'M', 'L')
                New-PodeWebSelect -Name 'Role' -Options @('User', 'Admin', 'Operations') -Multiple
                New-PodeWebRange -Name 'Cores' -Value 30 -ShowValue
				New-PodeWebSelect -Name 'Role' -Options @('Choose...', 'User', 'Admin', 'Operations') |
					Register-PodeWebEvent -Type Focus -ScriptBlock {
						Show-PodeWebToast -Message "The value was changed: $($WebEvent.Data['Role'])"
						
					}
            )
        )
    }

    Add-PodeWebPage -Name 'Processes' -ScriptBlock {
        New-PodeWebContainer -Content @(
			New-PodeWebText -Value get-location		
            New-PodeWebChart -Name 'Top Processes' -Type Bar -AutoRefresh -ScriptBlock {
                Get-Process |
                Sort-Object -Property CPU -Descending |
                Select-Object -First 10 |
                ConvertTo-PodeWebChartData -LabelProperty ProcessName -DatasetProperty CPU, Handles
            }
        )
    }


# --------------------------------------------------------------------------------------

	Add-PodeWebPage -Name 'error.log' -Icon 'Settings' -ScriptBlock {
		'test'
	}


# --------------------------------------------------------------------------------------
# --------------------------------------------------------------------------------------
# --------------------------------------------------------------------------------------

	Add-PodeWebPage -Name 'Tools' -Icon 'Settings' -ScriptBlock {
		$name, $model, $manufacturer = cInfo
		New-PodeWebContainer -NoBackground -Content @(
			New-PodeWebTextbox -Name 'Name' -Value ($env:username)
			New-PodeWebTextbox -Name 'PC Name' -Value ($name)
			New-PodeWebTextbox -Name 'Model' -Value ($model)
			New-PodeWebTextbox -Name 'Manufacturer' -Value ($manufacturer)
			New-PodeWebButton -Name 'Update' -ScriptBlock {
				
				Update-PodeWebTextbox -Name 'Current Directory' -Value (cookie)
			}
		)
	}
# --------------------------------------------------------------------------------------
# --------------------------------------------------------------------------------------
# --------------------------------------------------------------------------------------


	Add-PodeWebPage -Name 'code' -Icon 'Settings' -ScriptBlock {
		
		$name, $model, $manufacturer = cInfo	
		
		New-PodeWebContainer -NoBackground -Content @(
			New-PodeWebGrid -Cells @(
				New-PodeWebCell -Content @(
					New-PodeWebTextbox -Name 'PC Name' -Value ($name) 
				)
				New-PodeWebCell -Content @(
					New-PodeWebTextbox -Name 'Model' -Value ($model) 
				)
				New-PodeWebCell -Content @(
					New-PodeWebTextbox -Name 'Manufacturer' -Value ($manufacturer) 
				)
			)
	)

## --------------------------------------------------------------------------------------

#? --------------------------------------------------------------------------------------


	
		New-PodeWebCard -Content @(
			New-PodeWebTable -Name 'Services' -ScriptBlock {

					[ordered]@{
						Name     = "Jakoby"
						car      = "370"	
						snack    = "cookie"
						animal   = "cat"							
					}
			}
		)	
	
	
	}

# --------------------------------------------------------------------------------------	
		
