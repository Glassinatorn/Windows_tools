# getting servers to check
$content = Get-Content servers.secret | ConvertFrom-Json

$desktops = $content.Desktops
$servers = $content.Servers

# getting users
foreach ($desktop in $desktops) {
    $users = Get-WmiObject -computername $desktop -class Win32_UserAccount -filter "LocalAccount=True" | select PSComputername, Name, Status

    Write-Output $users
}

