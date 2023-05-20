function hackerQuiz {
$roles = @{
    'Bug Bounty Hunter' = 0
    'Malware Analyst' = 0
    'Payload Developer' = 0
    'Penetration Tester' = 0
    'Security Researcher' = 0
    'Cryptographer' = 0
    'Forensic Analyst' = 0
    'Security Auditor' = 0
    'Cyber Security Consultant' = 0
    'Network Security Engineer' = 0
}


# Each question adds points to different roles based on the answer
$questions = @(
   @{
        'Question' = "Are you interested in finding and exploiting vulnerabilities in software or web applications?"
        'Scores' = @{
            'Y' = @('Bug Bounty Hunter', 'Penetration Tester')
        }
    },
    @{
        'Question' = "Do you enjoy reverse engineering software or binary files?"
        'Scores' = @{
            'Y' = @('Malware Analyst', 'Security Researcher')
        }
    },
    @{
        'Question' = "Are you interested in developing scripts or tools for offensive security purposes?"
        'Scores' = @{
            'Y' = @('Payload Developer', 'Penetration Tester')
        }
    },
    @{
        'Question' = "Are you intrigued by cryptography and secure communication systems?"
        'Scores' = @{
            'Y' = @('Cryptographer', 'Security Researcher')
        }
    },
    @{
        'Question' = "Do you enjoy analyzing network traffic for suspicious activities?"
        'Scores' = @{
            'Y' = @('Network Security Engineer', 'Forensic Analyst')
        }
    },
    @{
        'Question' = "Do you have an eye for detail and enjoy reviewing code for potential security flaws?"
        'Scores' = @{
            'Y' = @('Security Auditor', 'Bug Bounty Hunter')
        }
    },
    @{
        'Question' = "Do you enjoy identifying, assessing, and managing risk?"
        'Scores' = @{
            'Y' = @('Security Auditor', 'Cyber Security Consultant')
        }
    },
    @{
        'Question' = "Are you interested in providing guidance on how to protect digital infrastructure?"
        'Scores' = @{
            'Y' = @('Cyber Security Consultant', 'Network Security Engineer')
        }
    },
    @{
        'Question' = "Are you fascinated by malicious software and their mechanisms?"
        'Scores' = @{
            'Y' = @('Malware Analyst', 'Forensic Analyst')
        }
    },
    @{
        'Question' = "Do you like the idea of trying to break into systems legally to find vulnerabilities?"
        'Scores' = @{
            'Y' = @('Penetration Tester', 'Bug Bounty Hunter')
        }
    },
    @{
        'Question' = "Are you drawn to the idea of developing defensive mechanisms against cyber attacks?"
        'Scores' = @{
            'Y' = @('Network Security Engineer', 'Security Architect')
        }
    },
    @{
        'Question' = "Are you interested in keeping up-to-date with the latest cybersecurity trends and threat landscape?"
        'Scores' = @{
            'Y' = @('Security Analyst', 'Threat Intelligence Analyst')
        }
    },
    @{
        'Question' = "Do you enjoy the legal and ethical aspects of information security?"
        'Scores' = @{
            'Y' = @('Cybersecurity Lawyer', 'Security Compliance Officer')
        }
    },
    @{
        'Question' = "Are you interested in designing and building secure systems?"
        'Scores' = @{
            'Y' = @('Security Architect', 'Penetration Tester')
        }
    },
    @{
        'Question' = "Would you like to help organizations prepare for and respond to security breaches?"
        'Scores' = @{
            'Y' = @('Incident Responder', 'Forensic Analyst')
        }
    },
    @{
        'Question' = "Are you keen on learning about different operating systems and their security features?"
        'Scores' = @{
            'Y' = @('Security Auditor', 'Penetration Tester')
        }
    }
)

$roles = @{} 
Add-Type -AssemblyName System.Windows.Forms
foreach ($question in $questions) { $msgBoxResult = [System.Windows.Forms.MessageBox]::Show($question['Question'], "Question", [System.Windows.Forms.MessageBoxButtons]::YesNo) 
cls 
if ($msgBoxResult -eq 'Yes') { foreach ($role in $question['Scores']['Y']) { if (!$roles.ContainsKey($role)) { $roles[$role] = 0 } $roles[$role] += 1 } } } 

# Calculate the highest scored role 

$maxScore = 0 
$chosenRole = $null 
foreach ($role in $roles.Keys) { if ($roles[$role] -gt $maxScore) { $maxScore = $roles[$role] 
$chosenRole = $role } }

# Output the suggested role

#$chosenRole = "Bug Bounty Hunter"
cls
switch ($chosenRole) {
    'Bug Bounty Hunter' {
        Write-Host "As a Bug Bounty Hunter, you'll find vulnerabilities in systems and earn rewards!"
        Start-Process https://github.com/I-Am-Jakoby/Youtube_Minus
    }
    'Malware Analyst' {
        Write-Host "As a Malware Analyst, you'll reverse-engineer malicious software to understand it!"
    }
    'Payload Developer' {
        Write-Host "As a Payload Developer, you'll craft scripts and tools to exploit vulnerabilities!"
    }
    'Penetration Tester' {
        Write-Host "As a Penetration Tester, you'll attempt to breach systems to find their weaknesses!"

    }
    'Security Researcher' {
        Write-Host "As a Security Researcher, you'll explore new methods and techniques for securing systems!"
    }
    'Cryptographer' {
        Write-Host "As a Cryptographer, you'll design secure encryption algorithms and systems!"
    }
    'Forensic Analyst' {
        Write-Host "As a Forensic Analyst, you'll investigate breaches and incidents to discover what happened!"
    }
    'Security Auditor' {
        Write-Host "As a Security Auditor, you'll inspect systems to ensure they comply with security standards!"
    }
    'Cyber Security Consultant' {
        Write-Host "As a Cyber Security Consultant, you'll provide guidance to organizations on how to secure their digital infrastructure!"
    }
    'Network Security Engineer' {
        Write-Host "As a Network Security Engineer, you'll design and maintain secure networks!"
    }
    default {
        Write-Host "That's not a recognized role in this context."
    }
}

}

hackerQuiz
# v.2
