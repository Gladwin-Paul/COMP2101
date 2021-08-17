get-ciminstance win32_networkadapterconfiguration | 
where-object IPEnabled -eq $True |
select-object description, 
@{n="Index";e={$_.index}},
@{n="IP Address";e={$_.ipaddress}},
@{n="Subnet Mask";e={$_.IPSubnet}},
@{n="DNS Domain Name";e={$_.DNSHostName}},
@{n="DNS Server";e={$_.DNSServerSearchOrder}} |
format-table 