#!/bin/sh

# Make sure only root can run our script                
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Load configuration
. /etc/route53/config

# Use command line scripts to get instance ID and public hostname
PUBLIC_HOSTNAME=$(ec2metadata | grep 'public-hostname:' | cut -d ' ' -f 2)

# Create a new CNAME record on Route 53, replacing the old entry if nessesary
cli53 rrcreate "$ZONE" "$SUB" CNAME "$PUBLIC_HOSTNAME" --replace --ttl "$TTL"
