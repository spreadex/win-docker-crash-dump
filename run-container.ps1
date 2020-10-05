param($flag="ue")

$ErrorActionPreference = "Stop"

$dumpFolder = Join-Path $PSScriptRoot "Dumps"
if(-not (Test-Path $dumpFolder)){
    New-Item $dumpFolder -ItemType Directory
}

Write-Host "Deleting $dumpFolder"
Get-ChildItem $dumpFolder | Remove-Item -Force

if((docker ps -a --filter name=crash-test) -is [array]){
    docker rm crash-test
}

docker run -e FLAGGS=$flag -v "$($dumpFolder):c:\Dumps" --name crash-test crash-test

if($null -ne (Get-ChildItem $dumpFolder)){
    Write-Host "Dump created :)" -ForegroundColor Green
} else {
    Write-Host "No dump created :(" -ForegroundColor Red
}