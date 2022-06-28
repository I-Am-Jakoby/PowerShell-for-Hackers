![Logo](https://github.com/I-Am-Jakoby/hak5-submissions/blob/main/Assets/logo-170-px.png?raw=true)

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#Description">Description</a></li>
    <li><a href="#The-Functions">The Functions</a></li>
    <li><a href="#Examples">Examples</a></li>
    <li><a href="#Contact">Contact</a></li>
    <li><a href="#Acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

# Abuse-CapsLock

## Description

These few functions will be different ways that you can take advantage of the CapsLock button 

## The Functions

### [Stop-Sleep] 

This function will ensure your targets screen will not go to sleep
The caplock light will serve as an indicator that the script is still running 
This script uses the previous Caps-Off script to make sure the capslock is turned back off 
You will need to include both functions for this one to work

```
function Stop-Sleep {
Add-Type -AssemblyName System.Windows.Forms
$originalPOS = [System.Windows.Forms.Cursor]::Position.X
$o=New-Object -ComObject WScript.Shell

    while (1) {
        $pauseTime = 3
        if ([Windows.Forms.Cursor]::Position.X -ne $originalPOS){
            Caps-Off
            break
        }
        else {
            $o.SendKeys("{CAPSLOCK}");Start-Sleep -Seconds $pauseTime
        }
    }
}
```

### [Caps-Indicator] 

This function is meant to serve as an indicator for stages of your scripts 
Using the following function will make the capslock light blink on and off the number of times the variable $num indicates
The blinking will be in intervals of X amount of seconds as indicated by the $pause variable 
Use the following syntax:
(blinks 3 times pausing for a second between each) 

```
Caps-Indicator -pause 1 -blinks 3
```

```
function Caps-Indicator {

[CmdletBinding()]
param (	
[Parameter (Mandatory = $True, ValueFromPipeline = $True)]
[string]$pause,

[Parameter (Mandatory = $True)]
[int]$blinks
)

Add-Type -AssemblyName System.Windows.Forms
$o=New-Object -ComObject WScript.Shell
for($i = 1; $i -le $blinks * 2; $i++) {
    $o.SendKeys("{CAPSLOCK}");Start-Sleep -Milliseconds $pause
    }
}
```

### [Caps-Off] 

This function will make sure capslock is turned back off if one of your other scripts leaves it one

```
function Caps-Off {
Add-Type -AssemblyName System.Windows.Forms
$caps = [System.Windows.Forms.Control]::IsKeyLocked('CapsLock')

#If true, toggle CapsLock key, to ensure that the script doesn't fail
if ($caps -eq $true){

$key = New-Object -ComObject WScript.Shell
$key.SendKeys('{CapsLock}')
}
}
```

<p align="right">(<a href="#top">back to top</a>)</p>


## Examples 

Listed below are payloads that have used one of these functions:

[Acid Burn](https://github.com/I-Am-Jakoby/hak5-submissions/tree/main/OMG/Payloads/OMG-AcidBurn)

[JumpScare](https://github.com/I-Am-Jakoby/hak5-submissions/tree/main/OMG/Payloads/OMG-JumpScare)


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
