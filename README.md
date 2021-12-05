# ForestViewScripts
Scripts for common tasks at Forest View.
## Set up
### Do once per script, run everywhere
1. Create a shortcut of the .ps1 (to be referred to as "the script") in the location of your choice.
    1. The script should be placed somewhere in the server where **NOT** everyone can access it.
2. Modify the target of the shortcut.
    1. Right click on the shortcut, set the target to match the following format:
    ```
    C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File "<location-**NOT**accessible-to-everyone>\<script-file-name>.ps1"
    ```
    2. The script should work on all Windows machines, as PowerShell should be located in that exact directory for everyone.
    3. The security settings of the shortcut **must** be changed so that **only administrators** can execute the script.
        1. This will prevent against multiple installs of any of these files. 
        2. This will help prevent against any potentail injection attack.
### Once for every machine
Assuming the previous steps have been completed, all that remains to be done is to run each script by double clicking the shortcut.

## What still needs to be done
### Security
1. Finalize the security situation regarding these scripts.
    1. This mostly means what parts should be hidden from non-administrators, and what should be accessible to non-administrators.
    2. Which parts should be hidden remains to be determined, but something that does need to be figured out.
### Other tasks
1. Automating the resetting of the default apps needs to be researched further.
2. There is no way to not have to "okay" the running of the .exe's, for as some guy on the Internet said, "If you could bypass this, every malware ever would do so."
3. The following tasks  regarding VisualEMR will also need research:
    1. Making the icon visible for all users immediately (i.e. putting it onto the public desktop).
    2. Adding VisualEMR to “Compatibility View Settings" in Internet Explorer.
4. Automating steps 45 and 49 of [this](https://docs.google.com/document/d/1zjRuDJZ9edF4uzdXzuZWPIB-RvldM5An2VRJ51vOpL4/edit?usp=sharing) document.
5. Mapping network drives (Cliffside only).
