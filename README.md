# ForestViewScripts
Scripts for common/useful/boring things at Forest View
## Set up
### Do once, run everywhere
1. Create a shortcut of the .ps1 (to be referred to as, "the script") in the location of your choice.
    1. This (the script) should be placed somewhere in the server where **NOT** everyone can access it.
2. Modify the target of the shortcut
    1. Right click on the shortcut, set the target to something along the lines of:
    ```
    C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File "<location-accessible-to-everyone>\ComputerSetUp.ps1"
    ```
    2. This should work on all Windows machines, as PowerShell should be located there for everyone
    3. The security settings of the shortcut **Must** be changed such that **only administrators** can execute the script.
        1. I really don't want to deal with multiple installs of any of these files. Also, this will prevent against potentail injection attacks.
### Once for every machine
Assuming the previous section has been completed, all you need to do is run the script by double clicking the shortcut.

## What still needs to be done
1. It appears that there is no way to automate resetting the default apps.
2. There is no way to not have to, "okay" the running of the .exe's. For as some guy on the Internet said, "If you could bypass this, every malware ever would do so."
3. I will have to look into doing the following regarding VisualEMR
    1. Making the icon visible for all users immideatly
    2. Making a seperate script to do the following:
        1. Automate configuration Internet Explorer settings
        2. Automate configuration of Java
4. Automating steps 45 to 50 of [this](https://docs.google.com/document/d/1zjRuDJZ9edF4uzdXzuZWPIB-RvldM5An2VRJ51vOpL4/edit?usp=sharing) document
