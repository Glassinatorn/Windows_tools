# getting servers to check
$servers = Get-Content -Path "servers.secret"

# getting users
$users = Get-WmiObject -computername $env:computername -class Win32_UserAccount -filter "LocalAccount=True" | select PSComputername, Name, Status

Write-Output $users
