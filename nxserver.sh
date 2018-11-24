#!/bin/sh
groupadd -r $USER -g 433
useradd -u 431 -r -g $USER -d /home/$USER -s /bin/bash -c "$USER" $USER
adduser $USER sudo
mkdir -p /home/$USER
cp -a /activateconda.sh /home/$USER
#chown -R $USER:$USER /home/$USER moved below
echo $USER':'$PASSWORD | chpasswd
chmod +x /home/$USER/activateconda.sh

mkdir -p /home/$USER/.ssh
chmod 0700 /home/$USER/.ssh
cp -a /root/.ssh/jiri_kulik /home/$USER/.ssh/jiri_kulik
cp -a /root/.ssh/jiri_kulik.pub /home/$USER/.ssh/jiri_kulik.pub
chmod 600 /home/$USER/.ssh/jiri_kulik
chmod 600 /home/$USER/.ssh/jiri_kulik.pub

chown -R $USER:$USER /home/$USER

#su $USER
eval $(ssh-agent -s)
ssh-add /home/$USER/.ssh/jiri_kulik

/etc/NX/nxserver --startup
tail -f /usr/NX/var/log/nxserver.log
