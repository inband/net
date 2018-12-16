# ssh

These examples will use **administrator** as username. Need to put in public **key**.

## Juniper SRX-210

```
root# set system login user administrator class super-user authentication ssh-rsa  "ssh-rsa <public_key> root@ns1"
```




## Ubiquiti EdgeRouter

Need to specify a **password**

```
set system login user administrator authentication plaintext-password <password>
set system login user administrator authentication public-keys root@ns1 key <public_key>
set system login user administrator authentication public-keys root@ns1 type ssh-rsa
set system login user administrator level admin

```
