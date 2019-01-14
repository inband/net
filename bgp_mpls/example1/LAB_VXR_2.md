# LAB_VXR_2 config

```
hostname LAB_VXR_2
!
!
interface Loopback0
 ip address 172.16.100.2 255.255.255.255
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
 ip address 172.16.5.22 255.255.255.0
!
interface GigabitEthernet0/1.12
 encapsulation dot1Q 12
 ip address 172.16.12.2 255.255.255.252
 mpls ip
!
interface GigabitEthernet0/1.23
 encapsulation dot1Q 23
 ip address 172.16.23.1 255.255.255.252
 mpls ip
!
interface GigabitEthernet0/2
 no ip address
 shutdown
 duplex auto
 speed auto
 media-type rj45
 no negotiation auto
!
interface GigabitEthernet0/3
 no ip address
 shutdown
 duplex auto
 speed auto
 media-type rj45
 no negotiation auto
!
interface FastEthernet1/0
 no ip address
 shutdown
 duplex auto
 speed auto
!
interface FastEthernet1/1
 no ip address
 shutdown
 duplex auto
 speed auto
!
router ospf 1
 log-adjacency-changes
 network 172.16.12.0 0.0.0.3 area 0
 network 172.16.23.0 0.0.0.3 area 0
 network 172.16.100.2 0.0.0.0 area 0
!
ip forward-protocol nd
no ip http server
no ip http secure-server
!
!

```




