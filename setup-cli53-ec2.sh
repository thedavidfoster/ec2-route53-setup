#!/bin/bash

wget https://raw.github.com/barnybug/cli53/master/scripts/cli53
chmod 700 cli53
mv cli53 /usr/local/bin/cli53
ln -s /usr/local/bin/cli53 /usr/bin/cli53

mkdir /etc/route53
chmod 700 /etc/route53
wget https://raw.github.com/thedavidfoster/ec2-route53-setup/master/config.sh
mv config.sh /etc/route53/config
chmod 600 /etc/route53/config

wget https://raw.github.com/thedavidfoster/ec2-route53-setup/master/update-route53-dns.sh
mv update-route53-dns.sh /usr/sbin/update-route53-dns

ln -s /usr/sbin/update-route53-dns /etc/dhcp/dhclient-exit-hooks.d/update-route53-dns 
