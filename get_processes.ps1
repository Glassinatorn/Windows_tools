# asking for name
$name = Read-Host "Enter string to search for"

# fetching processes
Get-Process | Where-Object { $_.Name -like "*$name*" } | Select-Object -Property Name, Id