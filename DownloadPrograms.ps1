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

# Headers to make requests for and to download Chrome and WinDirStat. Talk to Seth or Google "Http headers" for more info
$NiniteHeaders = @{
	'authority'= 'ninite.com'
	'method'= 'GET'
	'path'= '/chrome-windirstat/ninite.exe'
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
$JavaHeaders = @{
    'Accept'='text/html, application/xhtml+xml, image/jxr, */*'
    'Accept-Encoding'='gzip, deflate'
    'Accept-Language'='en-US'
    'Host'='javadl.oracle.com'
    'Referer'='https://java.com/en/download/windows_manual.jsp'
    'User-Agent'='Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko'
}

# Actually making the requests/downloading
Invoke-WebRequest 'https://ninite.com/chrome-windirstat/ninite.exe' -Headers $NiniteHeaders -OutFile "$($downloadPath)\NiniteChromeWinDirStat.exe"
Invoke-WebRequest 'https://admdownload.adobe.com/bin/live/readerdc64_en_jd_crd_install.exe' -Headers $AdobeHeaders -OutFile "$($downloadPath)\Adobe.exe"
Invoke-WebRequest 'https://javadl.oracle.com/webapps/download/AutoDL?BundleId=245476_4d5417147a92418ea8b615e228bb6935' -Headers $JavaHeaders -OutFile "$($downloadPath)\Java.exe"
Invoke-WebRequest 'http://reliablehealth.com/visualemr.exe' -OutFile "$($downloadPath)\Visual.exe"

# Running these .exe's
# Start-Process -FilePath "$($downloadPath)\Adobe.exe" -WorkingDirectory 'C:\Windows\System32'
# Start-Process -FilePath "$($downloadPath)\NiniteChromeWinDirStat.exe" -WorkingDirectory 'C:\Windows\System32'
# Start-Process -FilePath "$($downloadPath)\Visual.exe" -WorkingDirectory 'C:\Windows\System32'
# Start-Process -FilePath "$($downloadPath)\Java.exe" -WorkingDirectory 'C:\Windows\System32'