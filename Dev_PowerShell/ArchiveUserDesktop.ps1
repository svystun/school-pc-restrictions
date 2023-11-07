$userName = [Environment]::UserName
if ($userName -ne "User2023") {
    Exit
}

$DesktopPath = [Environment]::GetFolderPath("Desktop")
$DocsPath = [Environment]::GetFolderPath("MyDocuments")

#Remove-Item "C:\Users\Администратор\Desktop\test\*" -Recurse -Force
#Remove-Item "C:\Users\Администратор\Desktop\test\*" -Exclude "1.txt","2.txt" -Recurse -Force

$folderArchive = $DocsPath + "\Archive"

if (Test-Path $folderArchive) {
    #Folder Archive exists. Delete old files and folders...
    Get-Childitem -Path $folderArchive -Recurse | where-object {$_.LastWriteTime -lt (get-date).AddDays(-15)} | Remove-Item -Recurse -Force
} else {
    New-Item -ItemType Directory -Path $folderArchive -Force
}

$folderName = (Get-Date).tostring("dd-MM-yyyy")
$folderDest = $folderArchive + "\" + $folderName

if (Test-Path $folderDest) {
    Write-Host "Folder exists. Delete old files and folders..."
} else {
    New-Item -ItemType Directory -Path $folderDest -Force
}

$folderSource = $DesktopPath + "\*"

Write-Host "Moving files and folders..."
Get-Item –Path $folderSource | Move-Item -Destination $folderDest -Force
Write-Host "Finished!"