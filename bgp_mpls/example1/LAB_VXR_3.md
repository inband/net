# LAB_VXR_3 config

```
!
hostname LAB_VXR_3
!
boot-start-marker
boot-end-marker
!
vrf definition CUST_1
 rd 2000:1001
 route-target import 2000:101
 !
 address-family ipv4
 route-target export 2000:301
 exit-address-family
!
logging message-counter syslog
!
aaa new-model
!
!
!
!
aaa session-id common
ip source-route
ip cef
!
!
!
!
ip domain name inband.io
no ipv6 cef
!
multilink bundle-name authenticated
!
!
ip ssh version 2
!
!
!
!
interface Loopback0
 ip address 172.16.100.3 255.255.255.255
!
interface GigabitEthernet0/1
 no ip address
 duplex auto
 speed auto
 media-type rj45
 no negotiation auto
!
interface GigabitEthernet0/1.5
 encapsulation dot1Q 5
 ip address 172.16.5.23 255.255.255.0
!
interface GigabitEthernet0/1.23
 encapsulation dot1Q 23
 ip address 172.16.23.2 255.255.255.252
 mpls ip
!
interface GigabitEthernet0/1.301
 vrf forwarding CUST_1
 encapsulation dot1Q 301
 ip address 192.168.31.0 255.255.255.254
!
router ospf 1
 log-adjacency-changes
 network 172.16.23.0 0.0.0.3 area 0
 network 172.16.100.3 0.0.0.0 area 0
!
router bgp 2000
 no synchronization
 bgp log-neighbor-changes
 neighbor 172.16.100.1 remote-as 2000
 neighbor 172.16.100.1 update-source Loopback0
 no auto-summary
 !
 address-family vpnv4
  neighbor 172.16.100.1 activate
  neighbor 172.16.100.1 send-community extended
 exit-address-family
 !
 address-family ipv4 vrf CUST_1
  redistribute connected
  no synchronization
 exit-address-family
!
ip forward-protocol nd
no ip http server
no ip http secure-server
!
!
!
!
!
!
!
!
!
control-plane
!
```





