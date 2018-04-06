#created by aa 02.12.17
#powershell -ExecutionPolicy ByPass -File script.ps1

function print_from_subf{        #funktsioon

Write-Output "print * files from ->"
Write-Output "=============================="

$dir = Read-Host -Prompt "sisesta kataloogi URL"
$laiend = Read-Host -Prompt "sisesta faililaiend (pdf, xls, txt vms)"
Get-ChildItem -Path $dir -Recurse -Include "*$laiend" | Format-Table name, length, lastwritetime

$kinnitus = Read-Host -Prompt "soovid neid faile printida? y/n"

if ($kinnitus -eq "y") {
    Get-ChildItem -Path $dir -Recurse -Include "*$laiend" | ForEach-Object {Start-Process -FilePath $_.FullName -Verb Print -PassThru | ForEach-Object{Start-Sleep 10;$_} | Stop-Process}
    } elseif ($kinnitus -eq "n"){
    Write-Output "/ragequit"
    exit
    } else {
    Write-Output "vale sisend! vasta y/n"
    }


#write-progress [0000---------->]
#for ($i = 1; $i -le 100; $i++)
#    {Write-Progress -Activity "prindin" -Status "$i% valmis:" -PercentComplete $i;}
}

print_from_subf      #kutsume välja funktsiooni