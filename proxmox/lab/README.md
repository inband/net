# LAB

The LAB needs to have an addressing convention that is easy to follow.

Addresses will come from **41.0.0.0/8** range.  Please note that the LAB is private and any external access 
to the internet will be NATed.

Management
```
172.16.99.20N
where N is 1 for r1
```

Range
```
41.0.0.0/8
```

Hostnames
```
rN-dev-lab

where N is an integer 1 to 9 
```

Network interfaces

Loopback is N.N.N.N

r1-dev-lab
```
1.1.1.1
```

r9-dev-lab
```
9.9.9.9
```


Connections between routers follow:
```
41.1.2.0/24
```
This would be the link between r1(2nd octet) and r2(3rd octet).
The host octet will be 1 or 2 with 1 corresponding to the lower **rN-dev-lab**.


r1-dev-lab
```
41.1.2.1/24
```

r2-dev-lab
```
41.1.2.2/24
```

Let do a few to get a better understanding:

41.3.4.2/24 - this is the interface on r4-dev-lab that links to r3-dev-lab

41.2.5.1/24 - this is the interface on r2-dev-lab that links to r5-dev-lab

41.6.9.0/24 - this is the link between r6-dev-lab and r9-dev-lab


OK, that also needs to be vlans for the links as the Management interface is already using native vlan.

The convention for this link from rN-dev-lab to rM-dev-lab becomes:
```
vlan 2NM
eth0.2NM

```

So how does this relate to PROXMOX.  Say I have created CT 205 with hostname r5-dev-lab want to add an
interface to connect to r4-dev-lab

The interface will be:  eth0.245

The vlan will be:       245

The IP address will be:  41.4.5.2/24

This is how to add the net interface to r5-dev-lab in PROXMOX
```
root@pve5-lab:~# pct set 205 --net2 name=eth0.245,bridge=vmbr0,ip=41.4.5.2/24,tag=245,type=veth
```

THis needs to be tested further - what if there is already a netX device - does it overwrite or throw an error?




