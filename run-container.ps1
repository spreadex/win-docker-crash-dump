param($flag="ue")

$dumpFolder = (Get-Item ./Dumps).FullName
if(-not (Test-Path $dumpFolder)){
    New-Item $dumpFolder -ItemType Directory
}

Get-ChildItem $dumpFolder | Remove-Item -Force

if((docker ps -a --filter name=crash-test) -is [array]){
    docker rm crash-test
}

docker run -e FLAGGS=$flag -v "$($dumpFolder):c:\Dumps" --name crash-test crash-test

if((Get-ChildItem ./Dumps) -ne $null){
    Write-Host "Dump created :)" -ForegroundColor Green
} else {
    Write-Host "No dump created :(" -ForegroundColor Red
}