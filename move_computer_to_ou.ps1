<#get computer OU name#>
$computer = Get-ADComputer -Identity "your computer name" 

<#move that computer to other OU#>
Move-ADObject -Identity $computer.DistinguishedName -TargetPath "OU=targetOU,DC=Target,DC=DC"