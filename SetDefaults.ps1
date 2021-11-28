function Set-DefaultBrowser
{
    $regKey      = "HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\{0}\UserChoice"
    $regKeyFtp   = $regKey -f 'ftp'
    $regKeyHttp  = $regKey -f 'http'
    $regKeyHttps = $regKey -f 'https'

   
   
    #Set-ItemProperty $regKeyFtp   -name ProgId ChromeHTML
    #Set-ItemProperty $regKeyHttp  -name ProgId ChromeHTML
    #Set-ItemProperty $regKeyHttps -name ProgId ChromeHTML

    #Set-ItemProperty $regKeyFtp   -name ProgId FirefoxURL
    #Set-ItemProperty $regKeyHttp  -name ProgId FirefoxURL
    #Set-ItemProperty $regKeyHttps -name ProgId FirefoxURL

    SFTA.exe AcroExch.Document.DC .pdf


<#
(Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\ftp\UserChoice').ProgId
(Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice').ProgId
(Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice').ProgId
#>

}

Set-DefaultBrowser