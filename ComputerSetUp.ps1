#Pick which folder we want to put all our downloads into
Function Get-Folder($initialDirectory="")
{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")|Out-Null

    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.Description = "Select a folder"
    $foldername.rootfolder = "MyComputer"
    $foldername.SelectedPath = $initialDirectory

    if($foldername.ShowDialog() -eq "OK")
    {
        $folder += $foldername.SelectedPath
    }
    return $folder
}
$downloadPath = Get-Folder

# Headers to make requests and to download. Talk to Seth or Google "Http headers" for more info
$NiniteHeaders = @{
	'authority'= 'ninite.com'
	'method'= 'GET'
	'path'= '/adoptjava8-chrome-windirstat/ninite.exe'
	'scheme'= 'https'
	'accept'= 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9'
	'accept-encoding'= 'gzip, deflate, br'
	'accept-language'= 'en-US,en;q=0.9'
	'referer'= 'https://ninite.com/adoptjava8-chrome-windirstat/'
	'sec-fetch-dest'= 'document'
	'sec-fetch-mode'= 'navigate'
	'sec-fetch-site'= 'same-origin'
	'sec-gpc'= '1'
	'upgrade-insecure-requests'= '1'
	'user-agent'= 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'
}
$AdobeHeaders = @{
    'Accept'='text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9'
	'Accept-Encoding'='gzip, deflate, br'
	'Accept-Language'='en-US,en;q=0.9'
	'Host'='admdownload.adobe.com'
	'Referer'='https://get.adobe.com/'
	'Sec-Fetch-Dest'='document'
	'Sec-Fetch-Mode'='navigate'
	'Sec-Fetch-Site'='same-site'
	'Sec-GPC'='1'
	'Upgrade-Insecure-Requests'='1'
	'User-Agent'='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'
}

# Actually making the requests/downloading
Invoke-WebRequest 'https://ninite.com/adoptjava8-chrome-windirstat/ninite.exe' -Headers $NiniteHeaders -OutFile "$($downloadPath)\NiniteChromeJava.exe"
Invoke-WebRequest 'https://admdownload.adobe.com/bin/live/readerdc64_en_jd_crd_install.exe' -Headers $AdobeHeaders -OutFile "$($downloadPath)\Adobe.exe"
Invoke-WebRequest 'http://reliablehealth.com/visualemr.exe' -OutFile "$($downloadPath)\Visual.exe"

# Configuring Java to put Visual in the Trusted Sites List
if (!(test-path -Path "$env:USERPROFILE\AppData\LocalLow\Sun\Java\Deployment\security\exception.sites"))  {  
   New-Item -Path "$env:USERPROFILE\AppData\LocalLow\Sun\Java\Deployment\security\exception.sites" -ItemType File  
}  
$javafile = "$env:USERPROFILE\AppData\LocalLow\Sun\Java\Deployment\security\exception.sites"
$site = 'https://visualemr.rhsvisual2.com/'
if (! (select-string -quiet $site $javafile)) {
  Add-Content $javafile $site
}

# Turns off "Let Internet Explorer open sites in Microsoft Edge"
Set-Itemproperty -path 'HKCU:\SOFTWARE\Microsoft\Edge\IEToEdge'-name 'RedirectionMode' -value '0'

# Running these .exe's
Start-Process -FilePath "$($downloadPath)\Adobe.exe"
Start-Process -FilePath "$($downloadPath)\NiniteChromeJava.exe"
Start-Process -FilePath "$($downloadPath)\Visual.exe"