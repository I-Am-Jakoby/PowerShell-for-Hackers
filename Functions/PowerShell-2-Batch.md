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

# PowerShell-2-Batch

<p align="center">
      <a href="https://www.youtube.com/watch?v=rbDC9C0Unpg">
        <img src=https://i.ytimg.com/vi/rbDC9C0Unpg/hqdefault.jpg width="300" alt="Python" />
      </a>
      <br>YouTube Tutorial	
</p>

## Description

This function will convert a PowerShell script to a Batch file

## The Function

### [PowerShell-2-Batch] 

Using this function will convert your powershell payload over to Base64 and then change the extension on it to be a .BAT file
Make the conversion with this function using the following syntax: 

```
P2B -Path "C:\Users\User\Desktop\example.ps1"

or

"C:\Users\User\Desktop\example.ps1" | P2B
```

```
function P2B {
    param
    (
        [Parameter(Mandatory,ValueFromPipeline,ValueFromPipelineByPropertyName)]
        [string]
        $Path
    )
 
    process
    {
        $encoded = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes((Get-Content -Path $Path -Raw -Encoding UTF8)))
        $newPath = [Io.Path]::ChangeExtension($Path, ".bat")
        "@echo off`npowershell -w h -NoP -NonI -Exec Bypass -enc $encoded" | Set-Content -Path $newPath -Encoding Ascii
    }
}
```

<p align="right">(<a href="#top">back to top</a>)</p>


## Examples 

Listed below are payloads that have used one of these functions:

No payloads have made use of this function yet, please feel free to contact me to get your payload featured here if you do use it


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
