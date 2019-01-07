# traceroute

Traceroute is not as simple as I first thought.  I ran a traceroute from my home ISP to a known AS of which I have visability and observed behaviour that was difficult to explain.

There was a response from a source interface that I could not explain.  However, using the following commands helped work through what was happening.



```
traceroute to 27.116.38.5 (27.116.38.5), 64 hops max, 52 byte packets
 1  192.168.17.1 (192.168.17.1)  3.888 ms  1.954 ms  2.246 ms
 2  10.74.0.1 (10.74.0.1)  9.332 ms  9.765 ms  9.841 ms
 3  * * *
 4  * * *
 5  * * *
 6  59.154.142.232 (59.154.142.232)  13.723 ms  12.393 ms
    59.154.142.222 (59.154.142.222)  11.685 ms
 7  119.225.19.210 (119.225.19.210)  13.111 ms  13.990 ms  12.844 ms
 8  po8.mflindist01.aapt.net.au (202.10.14.30)  11.483 ms
    po9.mflindist02.aapt.net.au (202.10.14.32)  12.448 ms
    po8.mflindist01.aapt.net.au (202.10.14.30)  12.365 ms
 9  * * *
10  59-100-241-10.mel.static-ipl.aapt.com.au (59.100.241.10)  13.574 ms  24.199 ms  12.328 ms
11  ge-20-core-2.mel.0101.net.au (27.116.36.168)  14.230 ms  17.050 ms  11.554 ms
12  ge-0-2-lns-2.mel.0101.net.au (27.116.36.177)  11.541 ms  11.616 ms  10.949 ms
13  * * *
14  * * *


```

```
R1#show ip route vrf VRF-INTERNET 27.116.38.5 

Routing Table: VRF-INTERNET
Routing entry for 27.116.38.5/32
  Known via "ospf 2", distance 110, metric 20, type extern 2, forward metric 104
  Last update from 27.116.36.166 on GigabitEthernet0/0/1.104, 5d10h ago
  Routing Descriptor Blocks:
    27.116.36.166, from 27.116.36.179, 5d10h ago, via GigabitEthernet0/0/1.104
      Route metric is 20, traffic share count is 1
  * 27.116.36.162, from 27.116.36.178, 5d10h ago, via GigabitEthernet0/0/0.101
      Route metric is 20, traffic share count is 1

```

```
R1#show ip cef vrf VRF-INTERNET 27.116.38.5             
27.116.38.5/32
  nexthop 27.116.36.162 GigabitEthernet0/0/0.101
  nexthop 27.116.36.166 GigabitEthernet0/0/1.104

```
From Jeff Doyle's Routing TCP/IP Volume I, CiscoPress page 104

"
CEF performs per-destination load sharing by default.  This is actually **per source-destination pair** load sharing.  All traffic that has a particular source address and is destined to a specific destination address will exit the same interface.  Traffic with a different source/destination address pair **may** exit the next interface. 
"

So, even though we have load-balancing - per source/destination pairs will only use
a single interface. 

```
R1#show ip cef vrf VRF-INTERNET exact-route 8.8.8.8 27.116.38.5
8.8.8.8 -> 27.116.38.5 =>IP adj out of GigabitEthernet0/0/0.101, addr 27.116.36.162
```
Where:
 - 8.8.8.8 is the source IP
 - 27.116.38.5 is the destination
 - Gi 0/0/0.101 is outgoing interface
 - 27.116.36.162 is the next hop




```
R1#show ip cef vrf VRF-INTERNET exact-route 8.8.8.8 27.116.38.54
8.8.8.8 -> 27.116.38.54 =>Null0
```


```
R1#show ip cef vrf VRF-INTERNET exact-route 8.8.8.8 6.6.6.6     
8.8.8.8 -> 6.6.6.6 =>IP adj out of TenGigabitEthernet0/2/0.98, addr 103.194.0.66

```


The other interesting thing I found is

 - devices may use egress interface as source address for icmp response in **traceroute**.  This is what I found with Exteme EXOS anyway - more testing is required for other devices.  

https://serverfault.com/questions/705115/icmp-replies-ingress-or-egress-interface-e-g-from-a-traceroute
