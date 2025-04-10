function Show-Menu {
    param (
        [string]$Title = 'Menu'
    )
    Write-Host "================ $Title ================"
    Write-Host "1: Get users from desktops"
    Write-Host "2: Get users from servers"
    Write-Host "q: Exit"
    Write-Host "========================================="
}

# getting servers to check
$content = Get-Content servers.secret | ConvertFrom-Json

$desktops = $content.Desktops
$servers = $content.Servers

$command = Get-WmiObject -computername $desktop -class Win32_UserAccount -filter "LocalAccount=True" | select PSComputername, Name, Status

do {
    Show-Menu

    $selection = Read-Host "Please make a selection"
    switch ($selection) {
        '1' {
            Clear-Host
            foreach ($desktop in $desktops) {

                $users = $command

                Write-Output $users
            }
        } '2' {
            Clear-Host
            foreach ($server in $servers) {
                $users = Invoke-Command -ComputerName $server -ScriptBlock { $command }

                Write-Output $users
            }
        }
    }
} until ($selection -eq 'q')