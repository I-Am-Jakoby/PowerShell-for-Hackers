
# Main Function

```powershell
function ?ai 
    {
        [CmdLetBinding()]
        param (
        [String]$apiKey = "API-KEY-HERE",
        
        [ValidateSet("text-davinci-003", "code-cushman-001", "code-davinci-001", "gpt-3.5-turbo")]
        [String]$model = "gpt-3.5-turbo",
        
        [Parameter(
			HelpMessage="This is the help message",
            Position=0,
            Mandatory = $true,
            ValueFromPipeline = $true
            )]
        [String]$question,
		
		[Switch]$speak,
		
		[Parameter(
			HelpMessage="This dictates how the Ai Responds. Ex: 'Pretend to be a...'",
            Mandatory = $false
            )]
        [String]$tone = "You are a helpful assistant",

        [int]$maxtokens = 4000,

        [ValidateRange(0,1)]
        [int]$temperature = 0.5
        )

    begin {
        $apiEndpoint = "https://api.openai.com/v1/chat/completions"
    }
    
    process {
        # Set the request headers
        $headers = @{
        "Content-Type" = "application/json"
        "Authorization" = "Bearer $apiKey"
        }   

        # Set the request body
		$requestBody = @{
			"model" = $model
			"messages" = @(
				@{
					"role" = "system"
					"content" = $tone
				},
				@{
					"role" = "user"
					"content" = $question
				}
			)
			"max_tokens" = $maxtokens
			"temperature" = $temperature
		}

        # Send the request
        $response = Invoke-RestMethod -Method POST -Uri $apiEndpoint -Headers $headers -Body (ConvertTo-Json $requestBody)

        # Print the response
        $replyMessage = $response.choices[0].message.content
		
		$replyMessage 
		if($speak){speak $replyMessage}

    }

    end {

    }
}
```

# Option PSReadLine Hotkey

```powershell
$parameters = @{
    Key = 'Alt+c'
    BriefDescription = 'Ask chatGPT'
    LongDescription = 'Submits the text currently in the console to chatGPT'
    ScriptBlock = {
      param($key, $arg)   # The arguments are ignored in this example

      # GetBufferState gives us the command line (with the cursor position)
      $line = $null
      $cursor = $null
      [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line,[ref]$cursor)

      # AddToHistory saves the line in history, but does not execute it.
      [Microsoft.PowerShell.PSConsoleReadLine]::AddToHistory($line) 


	  $ai = ?ai "$line"

	  [Microsoft.PowerShell.PSConsoleReadLine]::DeleteLine()
	  [Microsoft.PowerShell.PSConsoleReadLine]::Insert("$ai")


  }
}
Set-PSReadLineKeyHandler @parameters
```

# Banner for AiChat

```powershell
$aiBanner = @"
Write-Host "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" -ForegroundColor blue
Write-Host "⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠾⠛⠉⠉⠉⠉⠉⠉⠛⠳⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀" -ForegroundColor blue
Write-Host "⠀⠀⠀⠀⠀⠀⢀⣴⠟⠁⣠⣄⣀⣴⡦⠀⠀⠀⠀⠀⠀⠹⣦⡀⠀⠀⠀⠀⠀⠀ " -ForegroundColor blue -NoNewline; Write-Host "	Welcome to PS Ai Chat bot"     -ForegroundColor cyan
Write-Host "⠀⠀⠀⠀⠀⢠⣾⠏⠀⠀⣸⡿⠛⠻⣷⣤⡄⠀⠀⠀⠀⠀⠘⣷⡄⠀⠀⠀⠀⠀" -ForegroundColor blue -NoNewline; Write-Host "	Press 'CTRL + C' to EXIT"     -ForegroundColor DarkYellow
Write-Host "⠀⠀⠀⠀⢀⣾⡟⠀⠀⠿⢿⣧⣀⣠⣿⠛⠃⠀⢠⣤⠀⠀⠀⢸⣷⡀⠀⠀⠀⠀ " -ForegroundColor blue 
Write-Host "⠀⠀⠀⠀⣸⣿⡇⠀⠀⠀⠰⣿⠛⠛⠿⢿⣷⣤⣾⣿⣦⣤⡇⢸⣿⣇⠀⠀⠀⠀" -ForegroundColor blue -NoNewline; Write-Host "	Commands:"        -ForegroundColor green
Write-Host "⠀⠀⠀⠀⣿⣿⣷⠀⠀⠀⠀⠀⢰⣷⣴⣿⣿⣿⣿⣿⣿⣿⠃⣸⣿⣿⠀⠀⠀⠀" -ForegroundColor blue -NoNewline; Write-Host "		 Ai-newChat"  -ForegroundColor red -NoNewline; Write-Host "  | Start a new chat/clear chat history" -ForegroundColor white
Write-Host "⠀⠀⠀⠀⣿⣿⣿⣧⡀⠀⠀⠀⠀⣼⣿⣿⣿⡿⠋⠉⠻⠃⣰⣿⣿⣿⠀⠀⠀⠀" -ForegroundColor blue -NoNewline; Write-Host "		 Ai-getLog"  -ForegroundColor red -NoNewline; Write-Host "   | Opens chat history in Grid View "    -ForegroundColor white
Write-Host "⠀⠀⠀⠀⣿⣿⣿⣿⣷⣄⡀⠸⠿⣿⣿⣿⣿⠇⠀⠀⣠⣾⣿⣿⣿⣿⠀⠀⠀⠀" -ForegroundColor blue -NoNewline; Write-Host "		 Ai-Image"   -ForegroundColor red -NoNewline; Write-Host "    | Generate an image with Dalle "      -ForegroundColor white 
Write-Host "⠀⠀⠀⠀⢹⣿⣿⣿⣿⠿⠿⣶⣤⣬⣭⣭⣥⣤⣶⠿⢿⣿⣿⣿⣿⡏⠀⠀⠀⠀" -ForegroundColor blue -NoNewline; Write-Host "		 Ai-Whisper" -ForegroundColor red -NoNewline; Write-Host "  | Speech Recognition Engine "         -ForegroundColor white 
Write-Host "⠀⠀⠀⠀⠈⢿⣿⣿⠃⠀⠀⠘⣿⣿⣿⣿⣿⣿⠁⠀⠀⢹⣿⣿⡿⠁⠀⠀⠀⠀" -ForegroundColor blue
Write-Host "⠀⠀⠀⠀⠀⠘⢿⣿⣧⣀⣀⣼⣿⣿⣿⣿⣿⣿⣦⣀⣠⣾⣿⡿⠃⠀⠀⠀⠀⠀" -ForegroundColor blue
Write-Host "⠀⠀⠀⠀⠀⠀⠀⠀⣉⠙⠛⠛⠻⠿⠿⠿⠿⠟⠛⠛⠋⢉⠁⠀⠀⠀⠀⠀⠀⠀" -ForegroundColor blue
Write-Host "⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⣷⣶⠀⣶⣶⡆⢀⣾⠃⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀" -ForegroundColor blue
Write-Host "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠀⠛⠛⠃⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ " -ForegroundColor blue
Write-Host ""
Write-Host ""
Write-Host ""
"@
```

# AiChat Function

```powershell
function AiChat {
	
	param (
		[Switch]$speak	
	)
	
	cls
	$aiBanner | iex
	$log = "$env:AiChatLog"
	

	
	if (-not [System.Environment]::GetEnvironmentVariable('aichatlog', 'User')){[System.Environment]::SetEnvironmentVariable('aichatlog', "$env:tmp\AiChatLog.txt", 'User')}
	if (!(Test-Path -Path $log)) { New-Item -ItemType File -Path $log } 
	
	while ($true){
		write-host "$env:username" -ForegroundColor green -NoNewline ;write-host " >" -NoNewline
		$user = read-host " "

		if($user -like 'Ai-*') { $user | iex ; AiChat}
	
		$history = get-content $env:tmp/AiChatLog.txt
		$question = "$history $user"
		$response = ?ai $question 
		echo "$env:username : '$question'" >> $log
		echo ""
		write-host "Ai" -ForegroundColor blue -NoNewline ;write-host " > : " -NoNewline; echo $response
		if($speak){speak $response}		
		echo "Ai: '$response'" >> $log
		echo ""
	}
}
```

# AiChat SubFunctions 

```powershell
function Ai-newChat {
Clear-Content "$env:tmp/AiChatLog.txt"
}

function Ai-getLog {

Get-Content "$env:tmp/AiChatLog.txt" | Out-GridView
}
```


# Ai Image Generation

```powershell
function Ai-Image {

	[CmdLetBinding()]
	param (
	
	[String]$prompt,
	
	[String]$fileName = "$prompt.png",
	
	[String]$size = "1024x1024",
	
	[Switch]$showGallery	
	)

$AiGallery = "$env:userprofile/Documents/Ai_Image_Gallery"
if (-not [System.Environment]::GetEnvironmentVariable('aigallery', 'User')){[System.Environment]::SetEnvironmentVariable('aigallery', "$env:userprofile/Documents/Ai_Image_Gallery", 'User')}
if (!(Test-Path -Path $AiGallery)) { New-Item -ItemType Directory -Path $AiGallery }

if($showGallery){Invoke-Item $AiGallery; exit}

$apiKey = "API-KEY-HERE"
$apiEndpoint = "https://api.openai.com/v1/images/generations"

$headers = @{
    "Content-Type" = "application/json"
    "Authorization" = "Bearer $apiKey"
}

$requestBody = @{
    "prompt" = $prompt
    "n" = 1
    "size" = $size
}

$response = Invoke-RestMethod -Method Post -Uri $apiEndpoint -Headers $headers -Body (ConvertTo-Json $requestBody)

$url = $response.data.url

$filename = $fileName 
$fullpath = Join-Path -Path $AiGallery -ChildPath $filename

Invoke-WebRequest -Uri $url -OutFile $fullpath
	
}
```


# Speak Function

```powershell
function speak {

[CmdletBinding()]
param (	
[Parameter (Position=0,Mandatory = $True,ValueFromPipeline=$true)]
[string]$Sentence
) 

$s=New-Object -ComObject SAPI.SpVoice
$s.Rate = 1
$s.Speak($Sentence)
}
```
