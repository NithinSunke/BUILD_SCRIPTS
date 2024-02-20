#!/bin/bash

# Install multipath software
sudo yum install -y device-mapper-multipath

# Backup the original multipath configuration file
sudo cp /etc/multipath.conf /etc/multipath.conf.bak

# Configure multipath.conf
sudo cat << EOF > /etc/multipath.conf
defaults {
    user_friendly_names yes
}

blacklist {
    devnode "^(ram|raw|loop|fd|md|dm-|sr|scd|st)[0-9]*"
    devnode "^hd[a-z]"
    devnode "^cciss.*"
}

EOF

# Restart multipathd service
sudo systemctl restart multipathd

echo "Multipath configuration completed."
