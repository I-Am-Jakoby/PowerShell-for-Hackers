![Logo](https://github.com/I-Am-Jakoby/hak5-submissions/blob/main/Assets/logo-170-px.png?raw=true)

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

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#Description">Description</a></li>
    <li><a href="#The-Function">The Function</a></li>
    <li><a href="#Contact">Contact</a></li>
    <li><a href="#Acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

# Pause-Till-Mouse-Move

A function to pause a script until a mouse movement is detected. This is useful if you want to wait for an action to take place for 
when the target is in front of their PC. 

## Description

This function will get the position of the mouse cursor when the script is ran and save it as $originalPOS
Using a while loop it will check the position every X seconds as indicated by the $pauseTime variable
If the position of the cursor has not changed the capslock button will be pressed 
This is to stop the screen from sleeping and use the capslock light as an indicator the function is still waiting 
When a mouse movement is detected the function will break out of the loop and resume the script 

<p align="right">(<a href="#top">back to top</a>)</p>

## The Function

```
function Pause-Script{
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
