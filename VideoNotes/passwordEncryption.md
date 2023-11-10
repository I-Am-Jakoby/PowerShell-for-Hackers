# File Encryption and Decryption Tutorial Using PowerShell

This tutorial demonstrates how to encrypt and decrypt files using PowerShell and the .NET Framework's AES encryption.

## Prerequisites

- PowerShell
- Basic understanding of scripting
- A file to encrypt and decrypt

## PowerShell Script

```powershell
# Load necessary assembly for encryption
Add-Type -AssemblyName System.Security

# Encryption Process
# Creating AES encryption provider
$aes = New-Object System.Security.Cryptography.AesCryptoServiceProvider
$aes.GenerateKey()
$aes.GenerateIV()

# Reading the file to encrypt
$plaintextBytes = [System.IO.File]::ReadAllBytes("path\\to\\your\\file")

# Encrypting the data
$encryptor = $aes.CreateEncryptor($aes.Key, $aes.IV)
$encryptedBytes = $encryptor.TransformFinalBlock($plaintextBytes, 0, $plaintextBytes.Length)

# Writing the encrypted data to a new file
[System.IO.File]::WriteAllBytes("path\\to\\encrypted\\file", $encryptedBytes)

# Saving the key and IV for decryption
$key = [Convert]::ToBase64String($aes.Key)
$IV = [Convert]::ToBase64String($aes.IV)
$key | Out-File "path\\to\\keyfile"
$IV | Out-File "path\\to\\ivfile"

# Decryption Process
# Setting up AES decryption provider
$aesDecryptor = New-Object System.Security.Cryptography.AesCryptoServiceProvider
$aesDecryptor.Key = [Convert]::FromBase64String($key)
$aesDecryptor.IV = [Convert]::FromBase64String($IV)

# Reading the encrypted file
$encryptedBytes = [System.IO.File]::ReadAllBytes("path\\to\\encrypted\\file")

# Decrypting the data
$decryptor = $aesDecryptor.CreateDecryptor($aesDecryptor.Key, $aesDecryptor.IV)
$decryptedBytes = $decryptor.TransformFinalBlock($encryptedBytes, 0, $encryptedBytes.Length)

# Writing the decrypted data to a file
[System.IO.File]::WriteAllBytes("path\\to\\decrypted\\file", $decryptedBytes)
