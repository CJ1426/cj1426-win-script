$adminCheck = [bool]([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

if ($adminCheck) {
	write-host "you are admin"
} else {
	write-host "you are not admin"
}