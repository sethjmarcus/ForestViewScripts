# ForestViewScripts
Scripts for common/useful/boring things at Forest View
## Set up
### Do once, run everywhere
1. Create a shortcut of the .ps1 (to be referred to as, "the script") in the location of your choice.
    1. This should be placed somewhere in the server where **everyone** can access it
2. Modify the target of the shortcut
    1. Right click on the shortcut, set the target to something along the lines of:
    ```
    C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File "<location-accessible-to-everyone>\ComputerSetUp.ps1"
    ```
    2. This should work on all Windows machines, as PowerShell should be located there for everyone
### Once for every machine
Assuming the previous section has been completed, all you need to do is run the script by double clicking the shortcut.
