# scp

Attempting to scp running config from Cisco device

```
nat@ubuntu-16:~$ scp 192.168.253.138:running-config .
The authenticity of host '192.168.253.138 (192.168.253.138)' can't be established.
RSA key fingerprint is SHA256:OYg+af/fStiHoSGExBbLpsPc4GUgS5V2UoTu3fss9/U.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '192.168.253.138' (RSA) to the list of known hosts.
Password: 
Administratively disabled.
```

On Cisco device needed to enable scp server.
```
LAB1(config)#ip scp server enable 
```

Now try again.


```
nat@ubuntu-16:~$ scp 192.168.253.138:running-config .
Password: 
running-config 
```
