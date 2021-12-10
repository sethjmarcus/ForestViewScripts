﻿'Import-Module !Microsoft.PowerShell.Management'
set executionpolicy bypass –force

$desktop = "C:\Users\Public\Desktop"
$fileExists = Test-Path $desktop
if(!$fileExists){
    $desktop = "C:\Users\Public\Public Desktop"
}

# Create shortcut to the file
$SourceVisualEMR = "C:\rhs\visual\emr\amd64\ie8\Visual_IE8.bat"
$ShortcutVisualEMR = "$($desktop)\VisaulEMR.lnk"

$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutVisualEMR)
$shortcut.TargetPath = $SourceVisualEMR
$shortcut.IconLocation = "C:\rhs\Visual\emr\Visuali.ico"
$shortcut.Save()
