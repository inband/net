# brocade icx

Dont forget default gateway - if you need to route to $TACACS_IP


```
vlan 1 name DEFAULT-VLAN by port
!
!
!
aaa authentication login default tacacs+ local
aaa authentication login privilege-mode
aaa authorization commands 0 default  tacacs+
aaa authorization exec default  tacacs+                           
aaa accounting commands 0 default start-stop  tacacs+
aaa accounting exec default start-stop  tacacs+
aaa accounting system default start-stop  tacacs+
enable snmp config-tacacs
ip address 192.168.253.98 255.255.255.0 
no ip dhcp-client enable
ip default-gateway 192.168.253.1
username $USER password $PASS
tacacs-server host $TACACS_IP
tacacs-server key $PRESHARED_KEY
```
