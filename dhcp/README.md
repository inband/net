#dhcp (dynamic host configuration protocol)

rfc 1541 

CLIENT   -  SERVER
ip 0x0800   ip 0x0800
udp 68      udp 67

Discover >          
         <  Offer
Request  >
         <  Ack

```
07:51:29.419526 3e:35:be:2c:07:f6 > ff:ff:ff:ff:ff:ff, ethertype IPv4 (0x0800), length 342: (tos 0x10, ttl 128, id 0, offset 0, flags [none], proto UDP (17), length 328)
    0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 3e:35:be:2c:07:f6, length 300, xid 0x69b18560, Flags [none]
          Client-Ethernet-Address 3e:35:be:2c:07:f6
          Vendor-rfc1048 Extensions
            Magic Cookie 0x63825363
            DHCP-Message Option 53, length 1: Discover
            Requested-IP Option 50, length 4: 192.168.18.100
            Hostname Option 12, length 11: "dhcp-client"
            Parameter-Request Option 55, length 13: 
              Subnet-Mask, BR, Time-Zone, Default-Gateway
              Domain-Name, Domain-Name-Server, Option 119, Hostname
              Netbios-Name-Server, Netbios-Scope, MTU, Classless-Static-Route
              NTP
            Client-ID Option 61, length 19: hardware-type 255, be:2c:07:f6:00:01:00:01:26:c2:66:c6:3e:35:be:2c:07:f6
07:51:30.420966 4a:1c:5f:b7:7a:16 > 3e:35:be:2c:07:f6, ethertype IPv4 (0x0800), length 342: (tos 0x10, ttl 128, id 0, offset 0, flags [none], proto UDP (17), length 328)
    192.168.18.67.67 > 192.168.18.100.68: BOOTP/DHCP, Reply, length 300, xid 0x69b18560, Flags [none]
          Your-IP 192.168.18.100
          Client-Ethernet-Address 3e:35:be:2c:07:f6
          Vendor-rfc1048 Extensions
            Magic Cookie 0x63825363
            DHCP-Message Option 53, length 1: Offer
            Server-ID Option 54, length 4: 192.168.18.67
            Lease-Time Option 51, length 4: 3600
            Subnet-Mask Option 1, length 4: 255.255.255.0
            BR Option 28, length 4: 192.168.18.255
            Default-Gateway Option 3, length 4: 192.168.18.67
            Domain-Name Option 15, length 11: "example.com"
            Domain-Name-Server Option 6, length 4: 8.8.8.8
07:51:30.421328 3e:35:be:2c:07:f6 > ff:ff:ff:ff:ff:ff, ethertype IPv4 (0x0800), length 347: (tos 0x10, ttl 128, id 0, offset 0, flags [none], proto UDP (17), length 333)
    0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 3e:35:be:2c:07:f6, length 305, xid 0x69b18560, Flags [none]
          Client-Ethernet-Address 3e:35:be:2c:07:f6
          Vendor-rfc1048 Extensions
            Magic Cookie 0x63825363
            DHCP-Message Option 53, length 1: Request
            Server-ID Option 54, length 4: 192.168.18.67
            Requested-IP Option 50, length 4: 192.168.18.100
            Hostname Option 12, length 11: "dhcp-client"
            Parameter-Request Option 55, length 13: 
              Subnet-Mask, BR, Time-Zone, Default-Gateway
              Domain-Name, Domain-Name-Server, Option 119, Hostname
              Netbios-Name-Server, Netbios-Scope, MTU, Classless-Static-Route
              NTP
            Client-ID Option 61, length 19: hardware-type 255, be:2c:07:f6:00:01:00:01:26:c2:66:c6:3e:35:be:2c:07:f6
07:51:30.437504 4a:1c:5f:b7:7a:16 > 3e:35:be:2c:07:f6, ethertype IPv4 (0x0800), length 342: (tos 0x10, ttl 128, id 0, offset 0, flags [none], proto UDP (17), length 328)
    192.168.18.67.67 > 192.168.18.100.68: BOOTP/DHCP, Reply, length 300, xid 0x69b18560, Flags [none]
          Your-IP 192.168.18.100
          Client-Ethernet-Address 3e:35:be:2c:07:f6
          Vendor-rfc1048 Extensions
            Magic Cookie 0x63825363
            DHCP-Message Option 53, length 1: ACK
            Server-ID Option 54, length 4: 192.168.18.67
            Lease-Time Option 51, length 4: 3600
            Subnet-Mask Option 1, length 4: 255.255.255.0
            BR Option 28, length 4: 192.168.18.255
            Default-Gateway Option 3, length 4: 192.168.18.67
            Domain-Name Option 15, length 11: "example.com"
            Domain-Name-Server Option 6, length 4: 8.8.8.8

```












```
19:46:33.531675 04:18:d6:31:4d:42 > ff:ff:ff:ff:ff:ff, ethertype 802.1Q (0x8100), length 350: vlan 222, ethertype 802.1Q, vlan 999, p 0, ethertype IPv4, (tos 0x10, ttl 128, id 0, offset 0, flags [none], proto UDP (17), length 328)
    0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 04:18:d6:31:4d:42, length 300, xid 0x65abad36, secs 42, Flags [none]
	  Client-Ethernet-Address 04:18:d6:31:4d:42
	  Vendor-rfc1048 Extensions
	    Magic Cookie 0x63825363
	    DHCP-Message Option 53, length 1: Discover
	    Hostname Option 12, length 4: "ubnt"
	    Parameter-Request Option 55, length 6: 
	      Subnet-Mask, BR, Default-Gateway, Domain-Name-Server
	      Domain-Name, MTU
	    Agent-Information Option 82, length 36: 
	      Circuit-ID SubOption 1, length 15: AVC000123456789
	      Unknown SubOption 9, length 17: 
		0x0000:  0000 0de9 0c81 0400 0019 0082 0400 0076
		0x0010:  00
```


