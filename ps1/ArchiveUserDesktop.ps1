$userName = [Environment]::UserName
if ($userName -ne "Uchen71") {
    Exit
}

Function Show-School-Rules {
    $title = "-> Увага! Перечитайте ці правила!"
    $rules = "> > > > > > > > > > > ПРАВИЛА ТЕХНІКИ БЕЗПЕКИ < < < < < < < < <`n`n"
    $rules += "ЗАБОРОНЯЄТЬСЯ:`n`n"
    $rules += "1. ЗАХОДИТИ В КАБІНЕТ БЕЗ ДОЗВОЛУ УЧИТЕЛЯ`n`n"
    $rules += "2. ЗНАХОДИТИСЯ В КАБІНЕТІ У ВЕРХНЬОМУ ОДЯЗІ`n`n"
    $rules += "3. ВКЛЮЧАТИ АБО ВИКЛЮЧАТИ АПАРАТУРУ БЕЗ ВКАЗІВКИ ВЧИТЕЛЯ`n`n"
    $rules += "4. ПОЧИНАТИ РОБОТУ НА КОМП’ЮТЕРІ  БЕЗ ДОЗВОЛУ ВЧИТЕЛЯ`n`n"
    $rules += "5. ТОРКАТИСЯ ДО АПАРАТУРИ ВОЛОГИМИ АБО БРУДНИМИ РУКАМИ`n`n"
    $rules += "6. ВСТАВАТИ БЕЗ ДОЗВОЛУ ВИКЛАДАЧА ЗІ СВОЇХ МІСЦЬ ПІД ЧАС РОБОТИ ЗА КОМП’ЮТЕРАМИ`n`n"
    $rules += "7. ТОРКАТИСЯ ДО ЗАХИСНОГО ЕКРАНУ АБО ДО ЕКРАНУ МОНІТОРА`n`n"
    $rules += "8. ТОРКАТИСЯ ДО РОЗ'ЄМІВ СИСТЕМНОГО БЛОКУ, КАБЕЛІВ, ДРОТІВ, РОЗЕТОК І ПРИСТРОЇВ ЗАЗЕМЛЕННЯ`n`n"
    $rules += "9. КЛАСТИ КНИГИ І ЗОШИТИ НА МОНІТОР АБО КЛАВІАТУРУ`n`n"
    $rules += "10. САМОСТІЙНО УСУВАТИ НЕСПРАВНІСТЬ В РОБОТІ КОМП'ЮТЕРА`n`n"
    $rules += "11. БІГАТИ ПО КАБІНЕТУ`n`n"
    $rules += "12. ПРАЦЮВАТИ ПРИ ПОГАНОМУ САМОПОЧУТТІ`n`n"
    $rules += "13. ЗАВАЖАТИ РОБОТІ ІНШИХ УЧНІВ`n`n"
    $rules += "14. ЗАВАЖАТИ РОБОТІ ВИКЛАДАЧА.`n`n"

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
Get-Item -Path $folderSource | Move-Item -Destination $folderDest -Force
Show-School-Rules
