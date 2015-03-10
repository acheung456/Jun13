& C:\Users\Andrew\AppData\Local\GitHub\shell.ps1
Import-Module C:\Users\Andrew\AppData\Local\GitHub\PoshGit_869d4c5159797755bc04749db47b166136e59132\posh-git.psm1
$repo = "https://github.com/acheung456/Jun13"
$localfolder = 'C:\Users\Andrew\git\Jun13'
$homedir = ""

#Clone to local folder if it doesn't already exist
if(!$localfolder){
    git clone $repo $localfolder
    If($LASTEXITCODE -ne 0){Write-Host "clone failed"}
}

#grab changes and status
cd $localfolder
git fetch
$status = git status

if($status -like "*branch is up-to-date*"){
    Write-Host "Up-to-date!"    
}

If($status -like "*branch is behind*"){
    Write-Host "Change detected, pulling..."
    git pull
    if($LASTEXITCODE -eq 0){
        Write-host -ForegroundColor Green "Pull successful"
        
        #Build from current ovf

        #Test build success

        Copy-Item "$homedir\vbox\staging" -Destination "$homedir\vbox\current\" -Recurse
        Remove-Item "$homedir\vbox\staging" -Recurse

        #vagrant import box --update
        #vagrant up
        }
    
}


