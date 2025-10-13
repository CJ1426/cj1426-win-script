REM add new user
net user <user name> <password> /add

REM add user with seperate password
net user <user name> * /add

REM add user to admin group
net localgroup administrators <user name> /add

REM set your user to active
net user <user name> /active:yes

REM set password not expires
net user <user name> /expires:never
