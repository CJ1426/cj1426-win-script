# create rule for ipv4
New-NetFirewallRule -DisplayName "Ping-ipv4" -Protocol ICMPv4 -Direction Inbound -Action Allow

# create rule for ipv6
New-NetFirewallRule -DisplayName "Ping-ipv6" -Protocol ICMPv6 -Direction Inbound -Action Allow

#bat
netsh advfirewall firewall add rule name="Allow ICMPv4-In" protocol=icmpv4:8,any dir=in action=allow