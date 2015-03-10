params(
    [switch]$Build = $false
)

& C:\Users\Andrew\AppData\Local\GitHub\shell.ps1
Import-Module C:\Users\Andrew\AppData\Local\GitHub\PoshGit_869d4c5159797755bc04749db47b166136e59132\posh-git.psm1
$repo = "https://github.com/twosigma/tscandvm"
$localfolder = 'C:\Users\Andrew\git\tscandvm'
$homedir = ""

#Clone to local folder if it doesn't already exist
if(!$(Test-path $localfolder)){
    git clone $repo $localfolder
    If($LASTEXITCODE -ne 0){Write-Host "clone failed"}
}

#grab changes and status
cd $localfolder
git fetch
$status = git status

if($status -like "*branch is up-to-date*"){
    Write-Host "Up-to-date!"
    exit;   
}

If($status -like "*branch is behind*" -or $Build -eq $true){
    Write-Host "Change detected or set to build, pulling..."
    git pull
    if($LASTEXITCODE -eq 0){
        Write-host -ForegroundColor Green "Pull successful"

        #Build from current ovf
        $sourcepath = "$localfolder\vbox\current\packer-built.ovf"


        #Test build success

        Copy-Item "$localfolder\vbox\staging" -Destination "$homedir\vbox\current\" -Recurse
        Remove-Item "$homedir\vbox\staging" -Recurse

        #vagrant import box --update
        #vagrant up
        }
}