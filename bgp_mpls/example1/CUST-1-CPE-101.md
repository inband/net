# CUST-1-CPE-101


```
root@CUST-1-CPE-101:~# vtysh 

Hello, this is FRRouting (version 6.0.2).
Copyright 1996-2005 Kunihiro Ishiguro, et al.

CUST-1-CPE-101# show run
Building configuration...

Current configuration:
!
frr version 6.0.2
frr defaults traditional
hostname CUST-1-CPE-101
log syslog informational
no ipv6 forwarding
service integrated-vtysh-config
!
router bgp 65001
 neighbor 192.168.11.0 remote-as 2000
 !
 address-family ipv4 unicast
  network 192.168.91.0/24
 exit-address-family
!
line vty
!
end

```
```
root@CUST-1-CPE-101:~# ifconfig
-bash: ifconfig: command not found
root@CUST-1-CPE-101:~# ip addr 
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
71: eth0@if72: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether f6:24:99:10:29:ae brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 172.16.99.113/24 brd 172.16.99.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::f424:99ff:fe10:29ae/64 scope link 
       valid_lft forever preferred_lft forever
73: eth0.101@if74: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether ea:4a:72:a3:48:8d brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 192.168.11.1/31 brd 255.255.255.255 scope global eth0.101
       valid_lft forever preferred_lft forever
    inet6 fe80::e84a:72ff:fea3:488d/64 scope link 
       valid_lft forever preferred_lft forever
87: eth0.91@if88: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 36:fe:57:cd:29:b4 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 192.168.91.1/24 scope global eth0.91
       valid_lft forever preferred_lft forever
    inet6 fe80::34fe:57ff:fecd:29b4/64 scope link 
       valid_lft forever preferred_lft forever
root@CUST-1-CPE-101:~# 

```
