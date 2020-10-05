param($ExeName)

$key = "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps\{0}" -f $ExeName
New-Item $key -Force
Push-Location $key
New-ItemProperty . -Name DumpType -Value 2 -PropertyType DWord
New-ItemProperty . -Name DumpFolder -Value "C:\Dumps" -PropertyType String
Pop-Location