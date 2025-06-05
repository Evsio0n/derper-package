#!/bin/sh
systemctl daemon-reload
systemctl enable derper
mkdir -p /etc/derper

echo " Add user derper"
useradd -m derper

echo "Add group derper"
groupadd derper

echo "Add user derper to group derper"
usermod -aG derper derper

chown -R derper:derper /etc/derper

touch /etc/derper/derper.conf

chown derper:derper /etc/derper/derper.conf

chmod 640 /etc/derper/derper.conf

echo "Edit /etc/derper/derper.conf to enable derper"



#systemctl start derper