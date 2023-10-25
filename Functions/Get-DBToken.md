<p align="center">
  <img src="https://github.com/HackingMark/Assets/blob/main/Hackingmark_low.gif?raw=true" width="720" title="www.hak5.org">
</p>

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

# Get-DBToken

## Description

Obtains a fresh Authtoken, prevents Authtoken timeouts after 4h. 

## The Function

### [GET-DBToken] 

After retreiving a Refreshtoken you could use this function to obtain a fresh Authtoken for the Dropbox Upload function.
This solve the problem of timing out after 4 hours.

Use e.g. $DBToken=Get-DBToken and use $DBToken instead of your token.

```
function Get-DBToken {
  $headersDB = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $headersDB.Add("grant_type", "refresh_token")
        $headersDB.Add("refresh_token", "INSERT YOUR REFRESH TOKEN HERE")
        $headersDB.Add("client_id", "YOUR_APP_KEY")
        $headersDB.Add("client_secret", "YOUR_APP_SECRET")
  
  $BodyDB = @{
        grant_type = "refresh_token"
        refresh_token = "INSERT YOUR REFRESH TOKEN HERE"
        client_id = "YOUR_APP_KEY"
        client_secret = "YOUR_APP_SECRET"

  }
Invoke-RestMethod -Uri https://www.dropbox.com/oauth2/token -Method Post -Headers $headersDB -Body $BodyDB
}
```
<p align="right">(<a href="#top">back to top</a>)</p>


## Examples 
[//]: # (Examples of scripts that have used your function) 
Listed below are payloads that have used one of these functions:




<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

HackingMark
  <p><br/>

  <img src="https://media.giphy.com/media/VgCDAzcKvsR6OM0uWg/giphy.gif" width="50"> 

  <a href="https://github.com/HackingMark/">
    <img src="https://img.shields.io/badge/GitHub-HackingMark">
  </a>



</p>



<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Hak5](https://hak5.org/)
* [UberGuidoZ](https://github.com/UberGuidoZ)

***

[HOME-PAGE](https://github.com/I-Am-Jakoby/PowerShell-for-Hackers)

<p align="right">(<a href="#top">back to top</a>)</p>
