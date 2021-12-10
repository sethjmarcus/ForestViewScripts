set executionpolicy bypass –force

$desktop = "C:\Users\Public\Desktop"
# Why I couldn't test the path in the if I don't know
$fileExists = Test-Path $desktop
if(!$fileExists){
    $desktop = "C:\Users\Public\Public Desktop"
}

# Create shortcut to the file
$SourceVisualEMR = "C:\rhs\visual\emr\amd64\ie8\Visual_IE8.bat"
$ShortcutVisualEMR = "$($desktop)\VisaulEMR.lnk"

# Configuring the shortcut
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutVisualEMR)
$shortcut.TargetPath = $SourceVisualEMR
$shortcut.IconLocation = "C:\rhs\Visual\emr\Visuali.ico"
$shortcut.Save()
