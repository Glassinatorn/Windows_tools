# getting servers to check
$content = Get-Content servers.secret | ConvertFrom-Json

$desktops = $content.Desktops
$servers = $content.Servers

# getting users
foreach ($desktop in $desktops) {
    Write-Output $desktop
    #$users = Get-WmiObject -computername $server -class Win32_UserAccount -filter "LocalAccount=True" | select PSComputername, Name, Status
}

Write-Output $users
