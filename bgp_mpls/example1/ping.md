# ping 

In this example ping behaviour will be examined.
192.168.30.0 (LAB_VXR_3 egress)  to 192.168.91.1 (CUST-1-CPE LAN)

```
LAB_VXR_3#ping vrf CUST_1 192.168.91.1         

Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 192.168.91.1, timeout is 2 seconds:
!!!!!
Success rate is 100 percent (5/5), round-trip min/avg/max = 1/1/4 ms
```

```
LAB_VXR_3#traceroute vrf CUST_1 192.168.91.1

Type escape sequence to abort.
Tracing the route to 192.168.91.1

  1 172.16.23.1 [MPLS: Labels 16/21 Exp 0] 0 msec 0 msec 0 msec
  2 192.168.11.0 [MPLS: Label 21 Exp 0] 0 msec 0 msec 0 msec
  3 192.168.91.1 0 msec 0 msec 0 msec
```

  

```
LAB_VXR_3#show ip route vrf CUST_1 192.168.91.1
Routing entry for 192.168.91.0/24
  Known via "bgp 2000", distance 200, metric 0
  Tag 65001, type internal
  Last update from 172.16.100.1 01:27:47 ago
  Routing Descriptor Blocks:
  * 172.16.100.1 (Default-IP-Routing-Table), from 172.16.100.1, 01:27:47 ago
      Route metric is 0, traffic share count is 1
      AS Hops 1
      Route tag 65001
```

```
LAB_VXR_3#show ip cef vrf CUST_1 192.168.91.1 detail 
192.168.91.0/24, epoch 0
  recursive via 172.16.100.1 label 21
    nexthop 172.16.23.1 GigabitEthernet0/1.23 label 16

```



Let's send 1 ping and look at each of the hops.  LAB_VXR_3 - LAB_VXR_2 - LAB_VXR_3 - CUST-1-CPE-101

```
LAB_VXR_3#ping vrf CUST_1 192.168.91.1 repeat 1
```

On the C3750 switch change the **source** monitoring.

Gi1/0/17 is trunk to LAB_VXR_1

Gi1/0/18 is trunk to LAB_VXR_2

Gi1/0/19 is trunk to LAB_VXR_3


```
!
monitor session 1 source interface Gi1/0/19
monitor session 1 destination interface Gi1/0/21
!
```

VXR_1

```
root@pve5-lab:~# tcpdump -nneti enp4s0f0 'not port 22 && (icmp || mpls)'

 length 122: MPLS (label 16, exp 0, ttl 255) (label 21, exp 0, [S], ttl 255) 192.168.31.0 > 192.168.91.1: ICMP echo request, id 66, seq 0, length 80
00:0e:38:84:38:1b > 00:11:92:e9:3d:1b, ethertype MPLS unicast (0x8847), length 118: MPLS (label 21, exp 0, [S], ttl 254) 192.168.31.0 > 192.168.91.1: ICMP echo request, id 66, seq 0, length 80
00:11:92:e9:3d:1b > ea:4a:72:a3:48:8d, ethertype IPv4 (0x0800), length 114: 192.168.31.0 > 192.168.91.1: ICMP echo request, id 66, seq 0, length 80
ea:4a:72:a3:48:8d > 00:11:92:e9:3d:1b, ethertype IPv4 (0x0800), length 114: 192.168.91.1 > 192.168.31.0: ICMP echo reply, id 66, seq 0, length 80
00:11:92:e9:3d:1b > 00:0e:38:84:38:1b, ethertype MPLS unicast (0x8847), length 122: MPLS (label 17, exp 0, ttl 63) (label 20, exp 0, [S], ttl 63) 192.168.91.1 > 192.168.31.0: ICMP echo reply, id 66, seq 0, length 80
00:0e:38:84:38:1b > 00:01:c9:74:4c:1b, ethertype MPLS unicast (0x8847), length 118: MPLS (label 20, exp 0, [S], ttl 62) 192.168.91.1 > 192.168.31.0: ICMP echo reply, id 66, seq 0, length 80

```


CUST-1-CPE-101

```
root@CUST-1-CPE-101:~# tcpdump -nnei eth0.101 icmp
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth0.101, link-type EN10MB (Ethernet), capture size 262144 bytes

01:06:24.846727 00:11:92:e9:3d:1b > ea:4a:72:a3:48:8d, ethertype IPv4 (0x0800), length 114: 192.168.31.0 > 192.168.91.1: ICMP echo request, id 70, seq 0, length 80
01:06:24.846755 ea:4a:72:a3:48:8d > 00:11:92:e9:3d:1b, ethertype IPv4 (0x0800), length 114: 192.168.91.1 > 192.168.31.0: ICMP echo reply, id 70, seq 0, length 80


```
