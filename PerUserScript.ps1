# Configuring Java to put Visual in the Trusted Sites List
#if (!(test-path -Path "$env:USERPROFILE\AppData\LocalLow\Sun\Java\Deployment\security\exception.sites"))  {  
#   New-Item -Path "$env:USERPROFILE\AppData\LocalLow\Sun\Java\Deployment\security\exception.sites" -ItemType File  
#}  
$javafile = "$env:USERPROFILE\AppData\LocalLow\Sun\Java\Deployment\security\exception.sites"
$site = 'https://visualemr.rhsvisual2.com/'
#if (! (select-string -quiet $site $javafile)) {
  Add-Content $javafile $site
#}

# Turns off "Let Internet Explorer open sites in Microsoft Edge"
Set-Itemproperty -path 'HKCU:\SOFTWARE\Microsoft\Edge\IEToEdge'-name 'RedirectionMode' -value '0'