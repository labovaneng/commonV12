#Set-ExecutionPolicy RemoteSigned

Set-Location "C:\Users\ENG\Documents\AdobeUserSettings\"

$AdobeSettings = "C:\Users\ENG\Documents\Adobe\Premiere Pro\12.0\Profile-ENG\";
$SettingsOpslaan = "C:\Users\ENG\Documents\AdobeUserSettings\";

# Maak lijst van settings 
$list = Get-ChildItem -Path $SettingsOpslaan | Where-Object {$_.PSIsContainer} | Foreach-Object {$_.Name}

# Toon all settings
Write-Host 'User Settings:'
write-host "---------------"
write $list
write-host "`n"


$user = Read-Host 'Geef een naam op om je settings op te slaan'


$checkfile = Test-Path $user

#Copy-Item $AdobeSettings $SettingsOpslaan$user -Recurse -Force -Verbose

if($checkfile -eq 'true'){
    #Copy-Item $AdobeSettings $SettingsOpslaan$user -Recurse -Force -Verbose
    Remove-Item $user -Recurse -Force -Verbose
    Copy-Item $AdobeSettings $SettingsOpslaan$user -Recurse -Force -Verbose
    Write-Host "Gelukt! Settings zijn gekopieerd naar" $SettingsOpslaan$user ". :)"
}
else{
    Copy-Item $AdobeSettings $SettingsOpslaan$user -Recurse -Force -Verbose
    }



# Wachten op input voor af te sluiten
function Wait-KeyPress($prompt='Druk op een toets ...!') {
	Write-Host $prompt 	
	do {
		Start-Sleep -milliseconds 100
	} until ($Host.UI.RawUI.KeyAvailable)

	$Host.UI.RawUI.FlushInputBuffer()
}


# Wait-KeyPress
