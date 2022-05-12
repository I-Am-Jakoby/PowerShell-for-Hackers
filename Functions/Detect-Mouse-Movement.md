![Logo](https://github.com/I-Am-Jakoby/hak5-submissions/blob/main/Assets/logo-170-px.png?raw=true)

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#Description">Description</a></li>
    <li><a href="#The-Function">The Functions</a></li>
    <li><a href="#Examples">Examples</a></li>
    <li><a href="#Contact">Contact</a></li>
    <li><a href="#Acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

# Detect-Mouse-Movement

Detecting the mousemovent of a terget could be helpful in 2 different situations. 
Finding out if they just came back to their PC 
or finding out if they stepped away from their PC 

## Description

These functions will get the position of the mouse cursor when the script is ran and save it as $originalPOS
Using a while loop it will check the position every X seconds as indicated by the $pauseTime variable

# [Target-Comes] 
In this first function the position of the cursor will be checked every 3 seconds
If the position of the cursor has not changed the capslock button will be pressed every 3 seconds as well
This is to stop the screen from sleeping and use the capslock light as an indicator the function is still waiting 
When the position of the cursor is different the function will break out of the loop and resume the script 
This is helpful if you are wanting to run a script once they return to their computer

# [Target-Leaves] 
In the second function the position of the cursor will be checked 
Then the script will sleep for the number of seconds defined by the $PauseTime variable 
If the cursor is in the same position it will break out of the function and continue the script
This is helpful if you are trying to determine if the target is away to run a script while they are gone

<p align="right">(<a href="#top">back to top</a>)</p>

## The Function

```
function Target-Comes {
Add-Type -AssemblyName System.Windows.Forms
$originalPOS = [System.Windows.Forms.Cursor]::Position.X
$o=New-Object -ComObject WScript.Shell

    while (1) {
        $pauseTime = 3
        if ([Windows.Forms.Cursor]::Position.X -ne $originalPOS){
            break
        }
        else {
            $o.SendKeys("{CAPSLOCK}");Start-Sleep -Seconds $pauseTime
        }
    }
}
```

```
function Target-Leaves {
Add-Type -AssemblyName System.Windows.Forms
$o=New-Object -ComObject WScript.Shell

    while (1) {
        $pauseTime = 5
	  $originalPOS = [System.Windows.Forms.Cursor]::Position.X
	  Start-Sleep -Seconds $pauseTime
        if ([Windows.Forms.Cursor]::Position.X -eq $originalPOS){
            break
        }
        else {
            Start-Sleep -Seconds 1
        }
    }
}
```
<p align="right">(<a href="#top">back to top</a>)</p>


## Examples

Listed below are payloads that have used this function


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

  Project Link: [https://github.com/I-Am-Jakoby/PowerShell-for-Hackers)
</p>



<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Hak5](https://hak5.org/)
* [MG](https://github.com/OMG-MG)
* [UberGuidoZ](https://github.com/UberGuidoZ)
* [0iphor13](https://github.com/0iphor13)



<p align="right">(<a href="#top">back to top</a>)</p>
