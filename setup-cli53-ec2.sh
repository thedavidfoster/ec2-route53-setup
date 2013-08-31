#!/bin/bash

wget https://github.com/barnybug/cli53

mkdir /etc/route53
chmod 700 /etc/route53
wget https://raw.github.com/thedavidfoster/ec2-route53-setup/master/config.sh
mv config.sh /etc/route53/config
chmod 600 /etc/route53/config

wget https://raw.github.com/thedavidfoster/ec2-route53-setup/master/update-route53-dns.sh
mv update-route53-dns.sh /usr/sbin/update-route53-dns
ln -s /etc/dhcp3/dhclient-exit-hooks.d/update-route53-dns /usr/sbin/update-route53-dns