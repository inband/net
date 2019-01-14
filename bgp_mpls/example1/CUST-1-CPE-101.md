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
