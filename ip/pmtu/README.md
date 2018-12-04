# pmtu - path mtu discovery

[rfc1191](https://tools.ietf.org/html/rfc1191)


```
tracepath -n 8.8.8.8
```

```
nat@ubuntu-16:~$ sudo tcpdump -nni any 'host 8.8.8.8 || icmp'
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 262144 bytes
15:27:30.961272 IP 192.168.1.178.50542 > 8.8.8.8.44444: UDP, length 1472
15:27:30.967055 IP 192.168.1.1 > 192.168.1.178: ICMP time exceeded in-transit, length 556
15:27:30.967292 IP 192.168.1.178.50542 > 8.8.8.8.44445: UDP, length 1472
15:27:30.970345 IP 192.168.1.1 > 192.168.1.178: ICMP time exceeded in-transit, length 556
15:27:30.970559 IP 192.168.1.178.50542 > 8.8.8.8.44446: UDP, length 1472
15:27:30.973505 IP 192.168.1.1 > 192.168.1.178: ICMP 8.8.8.8 unreachable - need to frag (mtu 1492), length 556
15:27:30.973677 IP 192.168.1.178.50542 > 8.8.8.8.44447: UDP, length 1464
```

What is happening here?  

 - **tracepath** looks up route for 8.8.8.8
 - it will match default route 


```
nat@ubuntu-16:~$ ip route 
default via 192.168.1.1 dev ens33  proto static  metric 100 
192.168.1.0/24 dev ens33  proto kernel  scope link  src 192.168.1.178  metric 100 
```
 - send to **192.168.1.1**

```
nat@ubuntu-16:~$ ip route get 8.8.8.8
8.8.8.8 via 192.168.1.1 dev ens33  src 192.168.1.178
```

```
nat@ubuntu-16:~$ ip link show ens33
2: ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP mode DEFAULT group default qlen 1000
    link/ether 00:0c:29:20:8e:f0 brd ff:ff:ff:ff:ff:ff
```

 - interface is mtu is **1500**
 - sent udp with length (1500mtu - 8udp - 20ip) **1472**
 - **192.168.1.1** sends back **unreachable - need to frag (mtu 1492)**
 - adjust length (1492mtu - 8udp - 20ip) **1464**

The extra 8-Bytes in this case were used by PPPoE encapsulation. 
