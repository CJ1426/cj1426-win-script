<#get network interface name #>
get-netAdapter

<#change dns service#>
set-DnsClientServerAddress -interfaceAlias "interface name" -ServerAddresses "your.primary.dns.ip,your.second.dns.ip"