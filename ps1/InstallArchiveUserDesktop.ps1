# Set execution policy
Set-ExecutionPolicy RemoteSigned –Force
#Get-ExecutionPolicy -List

$PublicDocsPath = [Environment]::GetFolderPath("CommonDocuments")
$outputFile = $PublicDocsPath + "\ArchiveUserDesktop.ps1"

Import-Module BitsTransfer
Start-BitsTransfer -Source "https://github.com/svystun/school-pc-restrictions/blob/main/ps1/ArchiveUserDesktop.ps1?raw=true" -Destination $outputFile

$outputFile = $PublicDocsPath + "\InstallArchiveUserDesktop.ps1"
Start-BitsTransfer -Source "https://github.com/svystun/school-pc-restrictions/blob/main/ps1/InstallArchiveUserDesktop.ps1?raw=true" -Destination $outputFile