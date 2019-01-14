# LAB_VXR_1 config

```
hostname LAB_VXR_1
!
boot-start-marker
boot-end-marker
!
!
vrf definition CUST_1
 rd 2000:1001
 !
 address-family ipv4
  route-target export 2000:101
  route-target import 2000:301
 exit-address-family
!
!
interface Loopback0
 ip address 172.16.100.1 255.255.255.255
!
!
interface GigabitEthernet0/1
 no ip address
 media-type rj45
 speed auto
 duplex auto
 negotiation auto
!
interface GigabitEthernet0/1.5
 encapsulation dot1Q 5
 ip address 172.16.5.20 255.255.255.0
!
interface GigabitEthernet0/1.12
 encapsulation dot1Q 12
 ip address 172.16.12.1 255.255.255.252
 mpls ip
!
interface GigabitEthernet0/1.99
 encapsulation dot1Q 99
 ip vrf forwarding MANAGEMENT
 ip address 172.16.99.20 255.255.255.0
!
interface GigabitEthernet0/1.101
 encapsulation dot1Q 101
 vrf forwarding CUST_1
 ip address 192.168.11.0 255.255.255.254
!
router ospf 1
 network 172.16.12.0 0.0.0.3 area 0
 network 172.16.100.1 0.0.0.0 area 0
!
router bgp 2000
 bgp log-neighbor-changes
 network 1.2.3.0 mask 255.255.255.0
 network 2.2.2.0 mask 255.255.255.0
 network 4.4.4.0 mask 255.255.255.0
 network 17.17.17.0 mask 255.255.255.0
 neighbor 172.16.5.1 remote-as 1000
 neighbor 172.16.100.3 remote-as 2000
 neighbor 172.16.100.3 update-source Loopback0
 !
 address-family vpnv4
  neighbor 172.16.100.3 activate
  neighbor 172.16.100.3 send-community extended
 exit-address-family
 !
 address-family ipv4 vrf CUST_1
  redistribute connected
  neighbor 192.168.11.1 remote-as 65001
  neighbor 192.168.11.1 activate
  neighbor 192.168.11.1 prefix-list CUST_1 in
 exit-address-family
!
!
no ip http server
no ip http secure-server
ip route 0.0.0.0 0.0.0.0 172.16.5.1
!
ip prefix-list CUST_1 seq 5 permit 192.168.91.0/24
ip prefix-list CUST_1 seq 10 deny 0.0.0.0/0 le 32
!

```
