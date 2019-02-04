Set-Location C:\Users\ENG\Documents\AdobeUserSettings

# Wachten op input voor af te sluiten
function Wait-KeyPress($prompt='Druk op een toets ...!') {
	Write-Host $prompt 	
	do {
		Start-Sleep -milliseconds 100
	} until ($Host.UI.RawUI.KeyAvailable)

	$Host.UI.RawUI.FlushInputBuffer()
}

$ProcessActive = Get-Process 'Adobe Premiere Pro' -ErrorAction SilentlyContinue
if($ProcessActive -eq $null) 
    {
        # Maak lijst van settings 
        $list = @(Get-ChildItem | Where-Object { $_.PSIsContainer })
        $SequencePresets = "C:\Users\ENG\Desktop\Admin Tools\Scripts\Custom";
        $AdobeSettings = "C:\Users\ENG\Documents\Adobe\Premiere Pro\12.0\Profile-ENG";
        
        # Toon all settings
        Write-Host 'User Settings:'
        write-host "---------------"
        write $list.name
        write-host "`n"
        
        $user = Read-Host 'Welke settings wil je laden?'
        
        # Check of settings bestaan, indien ja kopieer settings. Indien niet, error settings niet gevonden. 
        $checkfile = Test-Path $user
        
            if($checkfile -eq 'true'){                
                Remove-Item "C:\Users\ENG\Documents\Adobe\Premiere Pro\12.0\Profile-ENG\*" -Force -Recurse
                Copy-Item  $user\* $AdobeSettings -Recurse -Force -Verbose
                Write-Host "Gelukt! Settings zijn gekopieerd."
                Remove-Item 'C:\Users\ENG\Documents\Adobe\Premiere Pro\12.0\Profile-ENG\Settings\Custom' -Force -Recurse
                Copy-Item "C:\Users\ENG\Desktop\Admin Tools\Scripts\Presets\Custom\" 'C:\Users\ENG\Documents\Adobe\Premiere Pro\12.0\Profile-ENG\Settings\Custom' -Force -Recurse
    	    }
    	    else{
    	         write-host "`n"
    	         Write-Host "Settings niet gevonden, kopieer eerst je settings naar de map 'AdobeUserSettings' in mijn documenten"}
    }
    else
{
    Write-Host "Sluit Premiere af!"
    Wait-KeyPress
}  
