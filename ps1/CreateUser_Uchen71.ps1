## Show user properties ##
#> net user school71

## Set user account expire date ##
#> Set-LocalUser -Name school71 -AccountExpires 05/11/2023 -Verbose

# Set execution policy
Set-ExecutionPolicy RemoteSigned ЦForce
#Get-ExecutionPolicy -List

$UserName = "Uchen71"

$UserID = Get-LocalUser -Name $UserName -ErrorAction SilentlyContinue
if ($UserID) {
   Write-Host "$($UserName) has already exists. Exit!"
   Exit
}

# Create new user
New-LocalUser -Name $UserName -Password ([securestring]::new()) -UserMayNotChangePassword -PasswordNeverExpires

$GroupUserEng = "Users"
If ((Get-LocalGroup | ? Name -eq $GroupUserEng | Measure).Count -eq 1) {
    Add-LocalGroupMember -Group $GroupUserEng -Member $UserName
}

$GroupUserRus = "Пользователи"
If ((Get-LocalGroup | ? Name -eq $GroupUserRus | Measure).Count -eq 1) {
    Add-LocalGroupMember -Group $GroupUserRus -Member $UserName
}

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