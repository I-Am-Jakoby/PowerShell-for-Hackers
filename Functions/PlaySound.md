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

# PlaySound

<p align="center">
      <a href="https://www.youtube.com/watch?v=Qm7KeuuNvMI&t">
        <img src=https://i.ytimg.com/vi/Qm7KeuuNvMI/hqdefault.jpg width="300" alt="Python" />
      </a>
      <br>YouTube Tutorial	
</p>

## Description

Play a sound file from the console window

## The Function

### [PlaySound] 

Pass the path of the sound file into this function to have it play using the following syntax:
```
PlaySound "C:\Users\User\AppData\Local\Temp\sound.wav"
```

```
function PlaySound {
[CmdletBinding()]
param (	
[Parameter (Mandatory = $True, Position=0, ValueFromPipeline = $True)]
[string]$File
)
$PlaySound=New-Object System.Media.SoundPlayer;$PlaySound.SoundLocation=$File;$PlaySound.playsync()
}
```

<p align="right">(<a href="#top">back to top</a>)</p>


## Examples 
[//]: # (Examples of scripts that have used your function) 
Listed below are payloads that have used one of these functions:

[JumpScare](https://github.com/I-Am-Jakoby/hak5-submissions/tree/main/OMG/Payloads/OMG-JumpScare)


<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

I am Jakoby
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
