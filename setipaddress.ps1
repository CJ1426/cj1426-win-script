<#get network interface name #>
get-netAdapter

<#remove existing IP#>
Remove-NetIPaddress -InterfaceAlias "interface name" -AddressFamily IPv4

<#set static ip#>
New-NetIPAddress -InterfaceAlias "interface name" -IPAddress "your.ip.address.v4" -PrefixLength 24 -DefaultGateway "your.default.gateway.ip"

<#change back to dhcp#>
Set-NetIPInterface -InterfaceAlias "interface name" -Dhcp Enabled