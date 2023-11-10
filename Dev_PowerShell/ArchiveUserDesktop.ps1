$userName = [Environment]::UserName
if ($userName -ne "User2023") {
    Exit
}

Function Show-School-Rules {
    $title = "-> сБЮЦЮ! оЕПЕВХРЮИРЕ ЖЁ ОПЮБХКЮ!"
    $rules = "> > > > > > > > > > > опюбхкю реум╡йх аегоейх < < < < < < < < <`n`n"
    $rules += "гюанпнмъ╙рэяъ:`n`n"
    $rules += "1. гюундхрх б йюа╡мер аег днгбнкс свхрекъ`n`n"
    $rules += "2. гмюундхрхяъ б йюа╡мер╡ с бепумэнлс ндъг╡`n`n"
    $rules += "3. бйкчвюрх юан бхйкчвюрх юоюпюрспс аег бйюг╡бйх бвхрекъ`n`n"
    $rules += "4. онвхмюрх пнанрс мю йнло▓чреп╡  аег днгбнкс бвхрекъ`n`n"
    $rules += "5. рнпйюрхяъ дн юоюпюрспх бнкнцхлх юан апсдмхлх псйюлх`n`n"
    $rules += "6. бярюбюрх аег днгбнкс бхйкюдювю г╡ ябн╞у л╡яжэ о╡д вюя пнанрх гю йнло▓чрепюлх`n`n"
    $rules += "7. рнпйюрхяъ дн гюухямнцн ейпюмс юан дн ейпюмс лнм╡рнпю`n`n"
    $rules += "8. рнпйюрхяъ дн пнг'╙л╡б яхярелмнцн акнйс, йюаек╡б, дпнр╡б, пнгернй ╡ опхярпн╞б гюгелкеммъ`n`n"
    $rules += "9. йкюярх ймхцх ╡ гньхрх мю лнм╡рнп юан йкюб╡юрспс`n`n"
    $rules += "10. яюлняр╡имн сясбюрх меяопюбм╡ярэ б пнанр╡ йнло'чрепю`n`n"
    $rules += "11. а╡цюрх он йюа╡мерс`n`n"
    $rules += "12. опюжчбюрх опх онцюмнлс яюлнонвсрр╡`n`n"
    $rules += "13. гюбюфюрх пнанр╡ ╡мьху свм╡б`n`n"
    $rules += "14. гюбюфюрх пнанр╡ бхйкюдювю.`n`n"

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

#Remove-Item "C:\Users\юДЛХМХЯРПЮРНП\Desktop\test\*" -Recurse -Force
#Remove-Item "C:\Users\юДЛХМХЯРПЮРНП\Desktop\test\*" -Exclude "1.txt","2.txt" -Recurse -Force


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
Get-Item √Path $folderSource | Move-Item -Destination $folderDest -Force
Show-School-Rules
