# mpls

```
mpls ldp
 router-id 2.2.2.2
 neighbor 1.1.1.1 password test
 neighbor 3.3.3.3 password test
 !
 address-family ipv4
  discovery transport-address 2.2.2.2
  !
  interface eth0.201
  !
  interface eth0.212
  !
 exit-address-family
 !
!
```



```
root@r1-dev-lab:~# vtysh 

Hello, this is FRRouting (version 5.0.1).
Copyright 1996-2005 Kunihiro Ishiguro, et al.

r1-dev-lab# show mpls status 
MPLS support enabled: no (mpls kernel extensions not detected)
```





On the Proxmox node(Debian 9) I had to enable MPLS modules

```
root@pve5-lab:~# lsmod | grep mpls
root@pve5-lab:~# modprobe mpls_router
root@pve5-lab:~# lsmod | grep mpls
mpls_router            28672  0
ip_tunnel              24576  1 mpls_router
root@pve5-lab:~# modprobe mpls_iptunnel
root@pve5-lab:~# lsmod | grep mpls
mpls_iptunnel          16384  0
mpls_router            28672  1 mpls_iptunnel
ip_tunnel              24576  1 mpls_router
```

Now on the containers (Debian 9) running frr - enable for interface eth0.201
```
root@r1-dev-lab:~# cat /proc/sys/net/mpls/conf/eth0.201/input
0
root@r1-dev-lab:~# sysctl -w net.mpls.conf.eth0/201.input=1
net.mpls.conf.eth0/201.input = 1
root@r1-dev-lab:~# sysctl -w net.mpls.platform_labels=100000
net.mpls.platform_labels = 100000
```

Will also need to enable for eth0.212

Then restart ffr service
```
root@r1-dev-lab:~# service frr restart
```


Check MPLS
```
root@r1-dev-lab:~# vtysh 

Hello, this is FRRouting (version 5.0.1).
Copyright 1996-2005 Kunihiro Ishiguro, et al.

r1-dev-lab# show mpls status 
MPLS support enabled: yes

```
