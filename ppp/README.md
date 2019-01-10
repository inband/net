# ppp


```
interface Loopback2
 description CUSTOMER_FIRST_HOP
 ip vrf forwarding VR-Customers
 ip address 22.111.222.88 255.255.255.255


interface Virtual-Template1
 ip vrf forwarding VR-CUSTOMERS
 ip unnumbered Loopback2
 ip tcp adjust-mss 1452
 peer default ip address pool VICDSL
 ppp mtu adaptive
 ppp authentication pap chap
 ppp ipcp dns 8.8.8.8 8.8.4.4


ip local pool VICDSL 111.222.120.1 111.222.120.127

```
