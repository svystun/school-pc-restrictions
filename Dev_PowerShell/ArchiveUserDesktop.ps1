$userName = [Environment]::UserName
if ($userName -ne "User2023") {
    Exit
}

Function Show-School-Rules {
    $title = "-> �����! ����������� �� �������!"
    $rules = "> > > > > > > > > > > ������� ���Ͳ�� ������� < < < < < < < < <`n`n"
    $rules += "�������ߪ����:`n`n"
    $rules += "1. �������� � ������� ��� ������� �������`n`n"
    $rules += "2. ����������� � ������Ҳ � ��������� ���ǲ`n`n"
    $rules += "3. �������� ��� ��������� ��������� ��� ���ǲ��� �������`n`n"
    $rules += "4. �������� ������ �� ���ϒ���в  ��� ������� �������`n`n"
    $rules += "5. ��������� �� ��������� �������� ��� �������� ������`n`n"
    $rules += "6. �������� ��� ������� ��������� ǲ ��ί� ̲��� ϲ� ��� ������ �� ���ϒ�������`n`n"
    $rules += "7. ��������� �� ��������� ������ ��� �� ������ ��Ͳ����`n`n"
    $rules += "8. ��������� �� ���'�̲� ���������� �����, ����˲�, ���Ҳ�, ������� � ������ί� ����������`n`n"
    $rules += "9. ������ ����� � ������ �� ��Ͳ��� ��� ���²�����`n`n"
    $rules += "10. �����Ҳ��� ������� �������Ͳ��� � ����Ҳ ����'�����`n`n"
    $rules += "11. ������ �� ��������`n`n"
    $rules += "12. ��������� ��� �������� ���������Ҳ`n`n"
    $rules += "13. �������� ����Ҳ ����� ��Ͳ�`n`n"
    $rules += "14. �������� ����Ҳ ���������.`n`n"

    #[System.Windows.Forms.MessageBox]::Show($rules, $title, 'OK');

    Add-Type -AssemblyName PresentationFramework
    $result = [System.Windows.MessageBox]::Show($rules, $title, "YesNo")
    #Write-Host $result   
}

$DesktopPath = [Environment]::GetFolderPath("Desktop")
$DocsPath = [Environment]::GetFolderPath("MyDocuments")

$items = Get-ChildItem -Path $DesktopPath
if ($items.Count -eq 0) {
    Show-School-Rules
    Exit
}

#Remove-Item "C:\Users\�������������\Desktop\test\*" -Recurse -Force
#Remove-Item "C:\Users\�������������\Desktop\test\*" -Exclude "1.txt","2.txt" -Recurse -Force


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
Get-Item �Path $folderSource | Move-Item -Destination $folderDest -Force
Show-School-Rules
