############################################################################################################################################################                      
#                                  |  ___                           _           _              _             #              ,d88b.d88b                     #                                 
# Title        : Ducky-Base64-Exec | |_ _|   __ _   _ __ ___       | |   __ _  | | __   ___   | |__    _   _ #              88888888888                    #           
# Author       : I am Jakoby       |  | |   / _` | | '_ ` _ \   _  | |  / _` | | |/ /  / _ \  | '_ \  | | | |#              `Y8888888Y'                    #           
# Version      : 1.0               |  | |  | (_| | | | | | | | | |_| | | (_| | |   <  | (_) | | |_) | | |_| |#               `Y888Y'                       #
# Category     : Execute           | |___|  \__,_| |_| |_| |_|  \___/   \__,_| |_|\_\  \___/  |_.__/   \__, |#                 `Y'                         #
# Target       : Windows 7,10,11   |                                                                   |___/ #           /\/|_      __/\\                  #     
#                                  |                                                           |\__/,|   (`\ #          /    -\    /-   ~\                 #             
#                                  |  My crime is that of curiosity                            |_ _  |.--.) )#          \    = Y =T_ =   /                 #      
#                                  |   and yea curiosity killed the cat                        ( T   )     / #   Luther  )==*(`     `) ~ \   Hobo          #                                                                                              
#                                  |    but satisfaction brought him back                     (((^_(((/(((_/ #          /     \     /     \                #    
#__________________________________|_________________________________________________________________________#          |     |     ) ~   (                #
#                                                                                                            #         /       \   /     ~ \               #
#  github.com/I-Am-Jakoby                                                                                    #         \       /   \~     ~/               #         
#  twitter.com/I_Am_Jakoby                                                                                   #   /\_/\_/\__  _/_/\_/\__~__/_/\_/\_/\_/\_/\_#                     
#  instagram.com/i_am_jakoby                                                                                 #  |  |  |  | ) ) |  |  | ((  |  |  |  |  |  |#              
#  youtube.com/c/IamJakoby                                                                                   #  |  |  |  |( (  |  |  |  \\ |  |  |  |  |  |#
############################################################################################################################################################

<#
.SYNOPSIS
  This is a powershell cmdlet that will convert a script to Base64 then format it into ducky script 

.DESCRIPTION 
  This is a cmdlet that takes a file path and converts the contents of that file to a Base64 string 
  That Base64 string is then formatted into ducky script ready to be used with the OMG devices or rubber ducky
  The output of that conversion will be saved to the desktop by default 
  Use the "-output" tag to change the directory where the payload is saved to
  The name of the file will be "converted.txt" by default
  Use the "-File" tag to change the name of the file 
  Estimated time to execute script is calculate and provided at the top of the output file
  

.PARAMETER source
  (Mandatory = $True)
  Provide the exact path to the file to be converted
 
.PARAMETER output
  (Mandatory = $False)
  Provide the exact path to where the output file will be saved 
  
.PARAMETER FileName
  (Mandatory = $False)
  Provide the name of the file   
  
.EXAMPLE
  B64 -source "C:\Users\USER\Desktop\script.ps1" -output "C:\Users\User\Desktop" -File example
  B64 -so "C:\Users\USER\Desktop\script.ps1" -out "C:\Users\User\Desktop" -File example
  B64 -so "C:\Users\USER\Desktop\script.ps1" -File example
  "C:\Users\USER\Desktop\script.ps1" | B64 -File example
  
#>

function B64{
	[CmdletBinding()]
	param (
	
	[Parameter (Mandatory = $True, ValueFromPipeline = $True)]
	[Alias("source")]
	[string]$so,

	[Parameter (Mandatory = $False)]
	[Alias("output")]
	[string]$Path, 

	[Parameter (Mandatory = $False)]
	[Alias("FileName")]
	[string]$File 

	)	

	if (!$File) { $File = "converted.txt" }

	if (!$Path) { $Path = [Environment]::GetFolderPath("Desktop") }
	
	$FilePath = ($Path+"\"+$File+".txt")

	$FilePath

	$converted = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes((Get-Content -Path $so -Raw -Encoding UTF8)))

	$numChar = $converted.length
	$Time = $numChar/140 
	$estTime = [math]::Round($Time,2)
	$incriment = 275

	$pre = "STRING powershell -enc "
	$string = "STRING "

	function splitLines{
		While ($converted)
		{ 
		$x,$converted = ([char[]]$converted).where({$_},'Split',$incriment)
		$x -join ''
		}
	}

	$lSplit = splitLines

	echo "REM --> $numChar Characters: Estimated $estTime seconds to execute" >> $FilePath
	echo "" >> $FilePath
	echo "GUI r" >> $FilePath
	echo "DELAY 250" >> $FilePath
	echo "powershell" >> $FilePath
	echo "DELAY 250" >> $FilePath
	echo "ENTER" >> $FilePath
	echo "DELAY 250" >> $FilePath
	echo $pre >> $FilePath
	echo "DELAY 250" >> $FilePath

	echo $string$converted >> $FilePath

	echo "DELAY 250" >> $FilePath
	echo "ENTER" >> $FilePath
}

