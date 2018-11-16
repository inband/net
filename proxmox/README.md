# proxmox


This CT was created manually through the PROXMOX web interface.

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

```
root@pve5-lab:~# pct create 250 local:vztmpl/debian-9.0-standard_9.3-1_amd64.tar.gz --arch amd64 --cores 1 --hostname r50-dev-lab --memory 512 --net0 name=eth0,bridge=vmbr0,gw=172.16.99.1,ip=172.16.99.250/24,type=veth --onboot 1 --ostype debian --rootfs local-lvm:vm-250-disk-1,size=8G --swap 512


```
