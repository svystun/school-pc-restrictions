$PublicDocsPath = [Environment]::GetFolderPath("CommonDocuments")
$outputFile = $PublicDocsPath + "\Message.ps1"

Import-Module BitsTransfer
Start-BitsTransfer -Source "https://github.com/svystun/school-pc-restrictions/blob/main/Dev_PowerShell/Message.ps1?raw=true" -Destination $outputFile