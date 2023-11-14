## Show user properties ##
#> net user school71

## Set user account expire date ##
#> Set-LocalUser -Name school71 -AccountExpires 05/11/2023 -Verbose

# Set execution policy
Set-ExecutionPolicy RemoteSigned –Force
#Get-ExecutionPolicy -List

$UserName = "Admin71"

$UserID = Get-LocalUser -Name $UserName -ErrorAction SilentlyContinue
if ($UserID) {
   Write-Host "$($UserName) has already exists. Exit!"
   Exit
}

# Create Admin user
$password = ConvertTo-SecureString "30571" -AsPlainText -Force
New-LocalUser -Name $UserName -Password $password -UserMayNotChangePassword -PasswordNeverExpires

$GroupAdminEng = "Administrators"
If ((Get-LocalGroup | ? Name -eq $GroupAdminEng | Measure).Count -eq 1) {
    Add-LocalGroupMember -Group $GroupAdminEng -Member $UserName
    Write-Host "$($UserName) has been added to group $($GroupAdminEng)"
}

$GroupAdminRus = "Администраторы"
If ((Get-LocalGroup | ? Name -eq $GroupAdminRus | Measure).Count -eq 1) {
    Add-LocalGroupMember -Group $GroupAdminRus -Member $UserName
    Write-Host "$($UserName) has been added to group $($GroupAdminRus)"
}

