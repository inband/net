# proxmox


This CT 201 was created manually through the PROXMOX web interface.

```
root@pve5-lab:~# cat /etc/pve/lxc/201.conf 
arch: amd64
cores: 1
hostname: r1-dev-lab
memory: 512
net0: name=eth0,bridge=vmbr0,gw=172.16.99.1,hwaddr=0E:65:BF:DC:91:D9,ip=172.16.99.201/24,type=veth
net1: name=eth1,bridge=vmbr0,hwaddr=C2:A3:D0:EC:79:E2,ip=172.16.222.201/24,type=veth
net2: name=eth0.201,bridge=vmbr0,hwaddr=BA:B9:A6:0C:4C:24,ip=41.0.1.2/24,tag=201,type=veth
net3: name=eth0.212,bridge=vmbr0,hwaddr=D2:B0:63:85:99:53,ip=41.1.2.1/24,tag=212,type=veth
onboot: 1
ostype: debian
rootfs: local-lvm:vm-201-disk-1,size=8G
swap: 512
```

Note: Up to 10 network interface can be configured for a single container.
Let's try to create a CT from the command line on the host.  CT is 250.

```
oot@pve5-lab:~# pct create 250 local:vztmpl/debian-9.0-standard_9.3-1_amd64.tar.gz --arch amd64 --cores 1 \ 
--hostname r50-dev-lab --memory 512 \
--net0 name=eth0,bridge=vmbr0,gw=172.16.99.1,ip=172.16.99.250/24,type=veth \
--onboot 1 --ostype debian --swap 512 --rootfs local-lvm:8 --password
```

This still prompted for password to be entered twice.  Verify CT configuration file.

```
root@pve5-lab:~# cat /etc/pve/lxc/250.conf 
arch: amd64
cores: 1
hostname: r50-dev-lab
memory: 512
net0: name=eth0,bridge=vmbr0,gw=172.16.99.1,hwaddr=EE:82:70:0F:89:B2,ip=172.16.99.250/24,type=veth
onboot: 1
ostype: debian
rootfs: local-lvm:vm-250-disk-1,size=8G
swap: 512
```

Looks OK but not reachable - probably didn't boot.

```
root@pve5-lab:~# pct status 250
status: stopped
root@pve5-lab:~# pct start 250
```

That is better but can't ssh in with root.  

```
root@pve5-lab:~#pct enter 250
```
OK that works but nw have to either add public key to authorized file or edit ssh to allow login from password.  Got a better idea...


Let's try again creating CT 251
```
root@pve5-lab:~/.ssh# pct create 251 local:vztmpl/debian-9.0-standard_9.3-1_amd64.tar.gz --arch amd64 --cores 1 \
--hostname r51-dev-lab --memory 512 \
--net0 name=eth0,bridge=vmbr0,gw=172.16.99.1,ip=172.16.99.251/24,type=veth \
--onboot 1 --ostype debian --swap 512 --rootfs local-lvm:8 --ssh-public-keys ~/.ssh/lab_key 
root@pve5-lab:~# pct start 251
```


Add to ssh config file 
```
nat@ubuntu-16:~$ vim .ssh/config 
## Add the following lines
Host 172.16.99.251
	User root
	IdentityFile ~/.ssh/nats_lab
nat@ubuntu-16:~$ ssh 172.16.99.251
```


OK this works.

So this gives a basic CT with management IP.  Now what if I want to add a net device.

```
root@pve5-lab:~# pct set 251 --net2 name=eth0.251,bridge=vmbr0,ip=41.0.251.1/24,tag=251,type=veth
root@pve5-lab:~# pct start 251
root@pve5-lab:~# pct enter 251
root@r51-dev-lab:~# ip addr show eth0.251
177: eth0.251@if178: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 72:59:34:b6:ab:bc brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 41.0.251.1/24 brd 41.0.251.255 scope global eth0.251
       valid_lft forever preferred_lft forever
    inet6 fe80::7059:34ff:feb6:abbc/64 scope link 
       valid_lft forever preferred_lft forever
```



