## tacacs

Terminal Access Controller Access Control System (TACACS)

Note:

User EXEC
```
ROUTER>
```

Privileged EXEC
```
ROUTER#
```

Global configuration
```
ROUTER(config)#
```


```
aaa new-model

aaa group server tacacs+ $GROUP-TACACS
server-private $TACACS_SERVER_IP key 0
#ip vrf forwarding $MANAGEMENT_VRF (if you are running vrf's)

# this allows local and tacacs authenication
aaa authentication login default local group $GROUP-TACACS

# this allows tacacs authenication and local auth if tacacs is UNREACHABLE
aaa authentication login default local group $GROUP-TACACS
```

You can authenticate with TACACS but will not be able to enter "Privileged EXEC" mode.  You need the following:


This still didn't allow me to enter "Privileged EXEC":
```
aaa authentication enable default group GROUP-TACACS enable

%Error in Authentication

no aaa authentication enable default group GROUP-TACACS enable
```



The following will login to "Privileged EXEC" mode.

```
aaa authorization exec default local group $GROUP-TACACS
```


Thought I might need following
```
aaa authorization commands 15 default local group $GROUP-TACACS
```

but:

```
ROUTER#show privilege
Current privilege level is 15
```

So far so good but need accounting (logging) on TACAC server. (command may vary)
```
aaa accounting exec default start-stop group $GROUP-TACACS
```


Now log commands
```
aaa accounting commands 15 default start-stop group $GROUP-TACACS
aaa accounting commands 1 default start-stop group $GROUP-TACACS
aaa accounting commands 0 default start-stop group $GROUP-TACACS
```

15 - show run, conf t

1  - show mac address-table


