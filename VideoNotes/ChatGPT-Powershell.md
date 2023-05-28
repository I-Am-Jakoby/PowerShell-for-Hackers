# Invoke-AIFunctionBuilder

---

## Usage

https://user-images.githubusercontent.com/13159458/230610955-c37ad3e8-f12c-4802-83d5-20ed550f4a2c.mp4   

### To launch the function builder interactively:
```pwsh
Invoke-AIFunctionBuilder
```
### To edit an existing function provide the text and a prompt that would be used to create it, the builder will correct any issues and validate it meets the prompt requirements:
```pwsh
Invoke-AIFunctionBuilder -InitialFunction "function Say-Hello { Write-Host 'hello' }" -Prompt "Write a powershell function that will say hello"
```

### The function builder is designed to run interactively so you can see the work the LLM is doing but if you want to you can run the function builder non-interactively with the `-NonInteractive` switch:
```pwsh
"Write a powershell function that will list all available wifi networks" | Invoke-AIFunctionBuilder -NonInteractive
```

---

# Invoke-AIErrorHelper

Invoke-AIErrorHelper is a function that uses the OpenAI GPT-3 API to provide insights into errors that occur in a PowerShell script. 

It takes the last error record and uses it to generate a detailed summary of the error and offer a potential PowerShell solution. 

The function is invoked by typing "Invoke-AIErrorHelper" or "ieh" into the PowerShell command line. 

If no error has occurred, the function will output a message saying "No error has occurred".

```powershell
# Invoke-AIErrorHelper is a function that uses the OpenAI GPT-3 API to provide insights into errors that occur in a powershell script.

Invoke-AIErrorHelper
```

---

# Generating Dalle Image

This is a PowerShell function that uses the OpenAI API to generate an image based on a description. 

It takes two parameters, Description and Size, and an optional switch parameter, Raw, which will return the raw response from the API if set. 

It also takes an optional switch parameter, NoProgress, which will hide the write-progress if set. 

The function will convert the description to a JSON object and send it to the OpenAI API. 

If the Raw parameter is not set, the function will save the image to a temporary file and return the path to that file.

```powershell
Get-DalleImage -Description "a cat in a rockband"
```

---

# Custom Functions

## Custom function to translate text to any language

```powershell
function Invoke-AiTranslate {

	[CmdLetBinding()]
	param (
	
	[String]$text,
	[String]$language,
	[Switch]$takeInput
	)
	if($takeInput){
		$text = Read-Host " "
	}
	$response = Get-GPT4Completion -Content "can you translate the following text to $language : $text"
	return $response
}
```

## Explain My Payloads

### You can use this to pull down any script from github and have it explained to you

```powershell
# formatted with my shorturl for my payloads

invoke-AIExplain -Value (irm jakoby.lol/voicelogger)

# Same command with the URL expanded

invoke-AIExplain -Value (irm https://raw.githubusercontent.com/I-Am-Jakoby/Flipper-Zero-BadUSB/main/Payloads/VoiceLogger/VL.ps1)
```

### Ai Powered Portscan

This is an example of how easy it is to do a general query and pass it off to Ai for analyzing



```powershell
# Command to get all open ports

$ports = Get-NetTCPConnection | Where-Object { $_.State -eq 'Established' } | Select-Object LocalPort, RemotePort | Sort-Object LocalPort, RemotePort -Unique

# Example array for this demo

$ports = @('22' , '53')
```

---

```powershell
# Custom function to load array of ports into custom prompt to generate a security report

function Invoke-portReport ($ports){
$date = Get-Date -Format "yyyy-MM-dd"
$name = $env:username
$Script:portReport = Get-GPT4Completion -Content "can you generate a pentesting report inserting the $date and $name highlighting the dangers of having the following ports open: $ports"
}
```

---



