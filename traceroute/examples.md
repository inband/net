# traceroute examples



```
nat@ubuntu18:~$ traceroute -A -n 8.8.8.8
traceroute to 8.8.8.8 (8.8.8.8), 30 hops max, 60 byte packets
 1  192.168.17.1 [AS198949]  5.900 ms  5.813 ms  5.106 ms
 2  121.200.12.1 [AS4764]  18.773 ms  18.554 ms  18.295 ms
 3  8.8.8.8 [AS15169]  26.831 ms  30.313 ms  29.992 ms


```

```
20:05:56.284438 IP 192.168.17.55.44824 > 8.8.8.8.33434: UDP, length 32
20:05:56.284863 IP 192.168.17.55.59972 > 8.8.8.8.33435: UDP, length 32
20:05:56.285246 IP 192.168.17.55.36701 > 8.8.8.8.33436: UDP, length 32
20:05:56.285510 IP 192.168.17.55.37589 > 8.8.8.8.33437: UDP, length 32
20:05:56.285756 IP 192.168.17.55.52617 > 8.8.8.8.33438: UDP, length 32
20:05:56.286012 IP 192.168.17.55.33827 > 8.8.8.8.33439: UDP, length 32
20:05:56.286387 IP 192.168.17.55.53165 > 8.8.8.8.33440: UDP, length 32
20:05:56.286714 IP 192.168.17.55.38136 > 8.8.8.8.33441: UDP, length 32
20:05:56.287038 IP 192.168.17.55.57122 > 8.8.8.8.33442: UDP, length 32
20:05:56.287343 IP 192.168.17.55.43447 > 8.8.8.8.33443: UDP, length 32
20:05:56.287692 IP 192.168.17.55.40394 > 8.8.8.8.33444: UDP, length 32
20:05:56.288044 IP 192.168.17.55.51269 > 8.8.8.8.33445: UDP, length 32
20:05:56.288313 IP 192.168.17.55.56886 > 8.8.8.8.33446: UDP, length 32
20:05:56.288568 IP 192.168.17.55.44889 > 8.8.8.8.33447: UDP, length 32
20:05:56.288859 IP 192.168.17.55.47180 > 8.8.8.8.33448: UDP, length 32
20:05:56.289079 IP 192.168.17.55.38426 > 8.8.8.8.33449: UDP, length 32
20:05:56.290323 IP 192.168.17.1 > 192.168.17.55: ICMP time exceeded in-transit, length 68
20:05:56.290345 IP 192.168.17.1 > 192.168.17.55: ICMP time exceeded in-transit, length 68
20:05:56.290668 IP 192.168.17.1 > 192.168.17.55: ICMP time exceeded in-transit, length 68
20:05:56.292899 IP 127.0.0.1.48532 > 127.0.0.53.53: 64052+ [1au] A? whois.radb.net. (43)
20:05:56.293217 IP 192.168.17.55.48275 > 192.168.17.1.53: 24390+ [1au] A? whois.radb.net. (43)
20:05:56.293606 IP 127.0.0.1.48532 > 127.0.0.53.53: 36925+ [1au] AAAA? whois.radb.net. (43)
20:05:56.293818 IP 127.0.0.53.53 > 127.0.0.1.48532: 36925 1/0/1 AAAA 2001:48a8:6880::18 (71)
20:05:56.304277 IP 121.200.12.1 > 192.168.17.55: ICMP time exceeded in-transit, length 76
20:05:56.304301 IP 121.200.12.1 > 192.168.17.55: ICMP time exceeded in-transit, length 76
20:05:56.304304 IP 121.200.12.1 > 192.168.17.55: ICMP time exceeded in-transit, length 76
20:05:56.313211 IP 8.8.8.8 > 192.168.17.55: ICMP 8.8.8.8 udp port 33440 unreachable, length 36
20:05:56.316973 IP 202.142.143.224 > 192.168.17.55: ICMP time exceeded in-transit, length 148
20:05:56.317008 IP 180.150.1.157 > 192.168.17.55: ICMP time exceeded in-transit, length 76
20:05:56.317012 IP 202.142.143.82 > 192.168.17.55: ICMP time exceeded in-transit, length 148
20:05:56.317014 IP 202.142.143.82 > 192.168.17.55: ICMP time exceeded in-transit, length 148
20:05:56.317017 IP 202.142.143.224 > 192.168.17.55: ICMP time exceeded in-transit, length 148
20:05:56.317019 IP 202.142.143.82 > 192.168.17.55: ICMP time exceeded in-transit, length 148
20:05:56.317020 IP 8.8.8.8 > 192.168.17.55: ICMP 8.8.8.8 udp port 33441 unreachable, length 36
20:05:56.506056 IP 192.168.17.1.53 > 192.168.17.55.48275: 24390 1/0/1 A 198.108.0.18 (59)
20:05:56.506714 IP 127.0.0.53.53 > 127.0.0.1.48532: 64052 1/0/1 A 198.108.0.18 (59)
20:05:56.507297 IP 192.168.17.55.46390 > 198.108.0.18.43: Flags [S], seq 436573838, win 64240, options [mss 1460,sackOK,TS val 735325278 ecr 0,nop,wscale 7], length 0
20:05:56.764559 IP 198.108.0.18.43 > 192.168.17.55.46390: Flags [S.], seq 589467173, ack 436573839, win 28960, options [mss 1460,nop,nop,TS val 2915655857 ecr 735325278,nop,wscale 8], length 0
20:05:56.764713 IP 192.168.17.55.46390 > 198.108.0.18.43: Flags [.], ack 1, win 502, options [nop,nop,TS val 735325536 ecr 2915655857], length 0
20:05:56.767410 IP 192.168.17.55.46390 > 198.108.0.18.43: Flags [P.], seq 1:15, ack 1, win 502, options [nop,nop,TS val 735325538 ecr 2915655857], length 14
20:05:57.013077 ARP, Request who-has 192.168.17.32 tell 192.168.17.1, length 46
20:05:57.118782 IP 198.108.0.18.43 > 192.168.17.55.46390: Flags [.], ack 15, win 114, options [nop,nop,TS val 2915656120 ecr 735325538], length 0
20:05:57.834999 IP 198.108.0.18.43 > 192.168.17.55.46390: Flags [P.], seq 1:155, ack 15, win 114, options [nop,nop,TS val 2915656857 ecr 735325538], length 154
20:05:57.835057 IP 192.168.17.55.46390 > 198.108.0.18.43: Flags [.], ack 155, win 501, options [nop,nop,TS val 735326606 ecr 2915656857], length 0
20:05:57.835195 IP 198.108.0.18.43 > 192.168.17.55.46390: Flags [F.], seq 155, ack 15, win 114, options [nop,nop,TS val 2915656857 ecr 735325538], length 0
20:05:57.835454 IP 192.168.17.55.46390 > 198.108.0.18.43: Flags [F.], seq 15, ack 156, win 501, options [nop,nop,TS val 735326607 ecr 2915656857], length 0
20:05:57.835726 IP 192.168.17.55.56029 > 8.8.8.8.33450: UDP, length 32
20:05:57.835897 IP 192.168.17.55.44808 > 8.8.8.8.33451: UDP, length 32
20:05:57.836036 IP 192.168.17.55.40500 > 8.8.8.8.33452: UDP, length 32
20:05:57.836477 IP 192.168.17.55.46392 > 198.108.0.18.43: Flags [S], seq 3864977376, win 64240, options [mss 1460,sackOK,TS val 735326608 ecr 0,nop,wscale 7], length 0
20:05:57.863971 IP 209.85.175.176 > 192.168.17.55: ICMP time exceeded in-transit, length 36
20:05:57.863997 IP 180.150.1.157 > 192.168.17.55: ICMP time exceeded in-transit, length 76
20:05:57.864254 IP 180.150.1.157 > 192.168.17.55: ICMP time exceeded in-transit, length 76
20:05:58.036157 ARP, Request who-has 192.168.17.32 tell 192.168.17.1, length 46
20:05:58.036462 IP 192.168.17.71.57621 > 192.168.17.255.57621: UDP, length 40
20:05:58.097505 IP 198.108.0.18.43 > 192.168.17.55.46390: Flags [.], ack 16, win 114, options [nop,nop,TS val 2915657190 ecr 735326607], length 0
20:05:58.097565 IP 198.108.0.18.43 > 192.168.17.55.46392: Flags [S.], seq 598959014, ack 3864977377, win 28960, options [mss 1460,nop,nop,TS val 2915657190 ecr 735326608,nop,wscale 8], length 0
20:05:58.097591 IP 192.168.17.55.46392 > 198.108.0.18.43: Flags [.], ack 1, win 502, options [nop,nop,TS val 735326869 ecr 2915657190], length 0
20:05:58.098255 IP 192.168.17.55.46392 > 198.108.0.18.43: Flags [P.], seq 1:15, ack 1, win 502, options [nop,nop,TS val 735326869 ecr 2915657190], length 14
20:05:58.450280 IP 198.108.0.18.43 > 192.168.17.55.46392: Flags [.], ack 15, win 114, options [nop,nop,TS val 2915657452 ecr 735326869], length 0
20:05:58.450334 IP 198.108.0.18.43 > 192.168.17.55.46392: Flags [P.], seq 1:381, ack 15, win 114, options [nop,nop,TS val 2915657453 ecr 735326869], length 380
20:05:58.450353 IP 192.168.17.55.46392 > 198.108.0.18.43: Flags [.], ack 381, win 501, options [nop,nop,TS val 735327221 ecr 2915657453], length 0
20:05:58.450541 IP 198.108.0.18.43 > 192.168.17.55.46392: Flags [F.], seq 381, ack 15, win 114, options [nop,nop,TS val 2915657453 ecr 735326869], length 0
20:05:58.451292 IP 192.168.17.55.46392 > 198.108.0.18.43: Flags [F.], seq 15, ack 382, win 501, options [nop,nop,TS val 735327222 ecr 2915657453], length 0
20:05:58.452081 IP 192.168.17.55.46394 > 198.108.0.18.43: Flags [S], seq 835322058, win 64240, options [mss 1460,sackOK,TS val 735327223 ecr 0,nop,wscale 7], length 0
20:05:58.705738 IP 198.108.0.18.43 > 192.168.17.55.46394: Flags [S.], seq 857999295, ack 835322059, win 28960, options [mss 1460,nop,nop,TS val 2915657803 ecr 735327223,nop,wscale 8], length 0
20:05:58.705820 IP 192.168.17.55.46394 > 198.108.0.18.43: Flags [.], ack 1, win 502, options [nop,nop,TS val 735327477 ecr 2915657803], length 0
20:05:58.706186 IP 192.168.17.55.46394 > 198.108.0.18.43: Flags [P.], seq 1:10, ack 1, win 502, options [nop,nop,TS val 735327477 ecr 2915657803], length 9
20:05:58.709934 IP 198.108.0.18.43 > 192.168.17.55.46392: Flags [.], ack 16, win 114, options [nop,nop,TS val 2915657803 ecr 735327222], length 0
20:05:58.967277 IP 198.108.0.18.43 > 192.168.17.55.46394: Flags [.], ack 10, win 114, options [nop,nop,TS val 2915658061 ecr 735327477], length 0
20:05:58.967341 IP 198.108.0.18.43 > 192.168.17.55.46394: Flags [F.], seq 1:1079, ack 10, win 114, options [nop,nop,TS val 2915658062 ecr 735327477], length 1078
20:05:58.967527 IP 192.168.17.55.46394 > 198.108.0.18.43: Flags [.], ack 1080, win 501, options [nop,nop,TS val 735327739 ecr 2915658062], length 0
20:05:58.967763 IP 192.168.17.55.46394 > 198.108.0.18.43: Flags [F.], seq 10, ack 1080, win 501, options [nop,nop,TS val 735327739 ecr 2915658062], length 0
20:05:59.060906 ARP, Request who-has 192.168.17.32 tell 192.168.17.1, length 46
20:05:59.268408 IP 198.108.0.18.43 > 192.168.17.55.46394: Flags [.], ack 11, win 114, options [nop,nop,TS val 2915658322 ecr 735327739], length 0
20:05:59.268471 IP 35.189.57.185.1194 > 192.168.17.55.33308: UDP, length 38
20:05:59.268789 IP 192.168.17.55.33308 > 35.189.57.185.1194: UDP, length 41
^C
81 packets captured
86 packets received by filter
1 packet dropped by kernel
nat@ubuntu18:~$ ping whois.radb.net
PING whois.radb.net (198.108.0.18) 56(84) bytes of data.
^C64 bytes from 198.108.0.18: icmp_seq=2 ttl=46 time=320 ms

--- whois.radb.net ping statistics ---
2 packets transmitted, 1 received, 50% packet loss, time 1011ms
rtt min/avg/max/mdev = 320.085/320.085/320.085/0.000 ms

```
