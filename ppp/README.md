# ppp


```
interface Loopback2
 description CUSTOMER_FIRST_HOP
 ip vrf forwarding CUSTOMERS
 ip address 22.111.222.88 255.255.255.255


interface Virtual-Template1
 ip vrf forwarding CUSTOMERS
 ip unnumbered Loopback2
 ip tcp adjust-mss 1452
 peer default ip address pool VICDSL
 ppp mtu adaptive
 ppp authentication pap chap
 ppp ipcp dns 8.8.8.8 8.8.4.4


ip local pool VICDSL 111.222.120.1 111.222.120.127

```



The follow will display the RemMAC and LocMAC of a locally terminated ppppoe session.

```
R1# show pppoe session interface TenGigabitEthernet 0/1/0.2338
```

Find subcriber UID and VA identifier

```
R1# show subscriber sessions | user@domain

R1# show subscriber sessions uid <uid> detailed
```

This will allow you to see IP and if service policy has been applied.
