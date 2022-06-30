![Logo](https://github.com/I-Am-Jakoby/hak5-submissions/blob/main/Assets/logo-170-px.png?raw=true)

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#Description">Description</a></li>
    <li><a href="#SYNTAX">Syntax</a></li>	  
    <li><a href="#The-Function">The Function</a></li>
    <li><a href="#Examples">Examples</a></li>
    <li><a href="#Contact">Contact</a></li>
    <li><a href="#Acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

# Text to Image

## Description

This function will convert a text file to an image

## [SYNTAX]

### Encode an Image 
```
txt-img -txtPath "C:\Users\User\Desktop\text.txt" -imgPath "C:\Users\User\Desktop\img.jpg"
```

## The Function

### [txt-img] 

This function will convert your text file to an image

Use the txtPath tag to provide the path of the text file you are trying to convert

Using the imgPath parameter will set where the image is saved to and what it is saved as

If no imgPath is designated it will save it to the desktop with the name foo.jpg by default

```
function txt-img {
[CmdletBinding()]
param (

[Parameter (Mandatory = $True, ValueFromPipeline = $True)]
[string]$txtPath,

[Parameter (Mandatory = $False)]
[string]$imgPath
)

if (!$imgPath) {$imgPath = "$Env:USERPROFILE\Desktop\foo.jpg"}

$content = [IO.File]::ReadAllText($txtPath)
Add-Type -AssemblyName System.Drawing
$bmp = new-object System.Drawing.Bitmap 1920,1080 
$font = new-object System.Drawing.Font Consolas,18 
$brushBg = [System.Drawing.Brushes]::White 
$brushFg = [System.Drawing.Brushes]::Black 
$graphics = [System.Drawing.Graphics]::FromImage($bmp) 
$graphics.FillRectangle($brushBg,0,0,$bmp.Width,$bmp.Height) 
$graphics.DrawString($content,$font,$brushFg,500,100) 
$graphics.Dispose() 
$bmp.Save($imgPath) 
}
```

<p align="right">(<a href="#top">back to top</a>)</p>


## Examples 

Listed below are payloads that have used one of these functions:

[Wallpaper-Troll](https://github.com/I-Am-Jakoby/hak5-submissions/tree/main/OMG/Payloads/OMG-Wallpaper-Troll)

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

</p>



<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Hak5](https://hak5.org/)
* [UberGuidoZ](https://github.com/UberGuidoZ)

***

[HOME-PAGE](https://github.com/I-Am-Jakoby/PowerShell-for-Hackers)

<p align="right">(<a href="#top">back to top</a>)</p>
