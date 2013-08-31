#!/bin/bash
apt-get install python-pip

pip install cli53

mkdir /etc/route53
chmod 700 /etc/route53

wget https://raw.github.com/thedavidfoster/ec2-route53-setup/master/config.sh

mv config /etc/route53/config
chmod 600 /etc/route53/config

wget https://raw.github.com/thedavidfoster/ec2-route53-setup/master/boto.cfg

mv boto.cfg /etc/boto.cfg
chmod 600 /etc/boto.cfg

wget https://raw.github.com/thedavidfoster/ec2-route53-setup/master/update-route53-dns.sh

mv update-route53-dns.sh /usr/sbin/update-route53-dns

ln -s /usr/sbin/update-route53-dns /etc/dhcp/dhclient-exit-hooks.d/update-route53-dns 
