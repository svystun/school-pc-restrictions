$PublicDocsPath = [Environment]::GetFolderPath("CommonDocuments")
$outputFile = $PublicDocsPath + "\ArchiveUserDesktop.ps1"

Import-Module BitsTransfer
Start-BitsTransfer -Source "https://github.com/svystun/school-pc-restrictions/blob/main/ps1/ArchiveUserDesktop.ps1?raw=true" -Destination $outputFile