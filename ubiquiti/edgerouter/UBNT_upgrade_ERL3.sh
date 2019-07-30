#!/bin/bash

IP=192.168.1.1
USER=ubnt
PASS=ubnt
FIRMWARE_FOLDER='/usr/local/bin/UBNT_firmware/'
ERL3=ER-e100.v1.10.3.5082526.tar 

WRAPPER=/opt/vyatta/bin/vyatta-op-cmd-wrapper

/usr/bin/ssh-keygen -f "/root/.ssh/known_hosts" -R 192.168.1.1
/usr/bin/sshpass -p $PASS /usr/bin/ssh -o StrictHostKeyChecking=no $USER@$IP "$WRAPPER show version" 
/usr/bin/sshpass -p $PASS /usr/bin/scp -o StrictHostKeyChecking=no $FIRMWARE_FOLDER$ERL3 $USER@$IP:/tmp/
/usr/bin/sshpass -p $PASS /usr/bin/ssh -o StrictHostKeyChecking=no $USER@$IP "$WRAPPER add system image /tmp/$ERL3;$WRAPPER show system image;$WRAPPER reboot now" 




