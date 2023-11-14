## Show user properties ##
#> net user school71

## Set user account expire date ##
#> Set-LocalUser -Name school71 -AccountExpires 05/11/2023 -Verbose

# Set execution policy
Set-ExecutionPolicy RemoteSigned –Force
#Get-ExecutionPolicy -List

$UserName = "Teacher71"

$UserID = Get-LocalUser -Name $UserName -ErrorAction SilentlyContinue
if ($UserID) {
   Write-Host "$($UserName) has already exists. Exit!"
   Exit
}

# Create Teacher user
$password = ConvertTo-SecureString "30571" -AsPlainText -Force
New-LocalUser -Name $UserName -Password $password -UserMayNotChangePassword -PasswordNeverExpires

$GroupUserEng = "Users"
If ((Get-LocalGroup | ? Name -eq $GroupUserEng | Measure).Count -eq 1) {
    Add-LocalGroupMember -Group $GroupUserEng -Member $UserName
    Write-Host "$($UserName) has been added to group $($GroupUserEng)"
}

$GroupUserRus = "Пользователи"
If ((Get-LocalGroup | ? Name -eq $GroupUserRus | Measure).Count -eq 1) {
    Add-LocalGroupMember -Group $GroupUserRus -Member $UserName
    Write-Host "$($UserName) has been added to group $($GroupUserRus)"
}

