REM open command prompt with shift+F10
REM create user
net user username * /add
net localgroup administrators username /add
net user username /active:yes
net user username /expires:never

REM disable admin and default account
net user Administrator /active:no
net user defaultUser0 /delete

REM check created user
net users

REM change registro edit
regedit

REM goto HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE
REM delete DefaultAccountAction, DefaultAccountSAMName, DefaultAccountSID
REM rename LaunchUserOOBE to SkipMachineOOBE and set value to 1

REM restart your pc
