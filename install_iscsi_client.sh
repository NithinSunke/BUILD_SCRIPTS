#!/bin/bash

# Install iscsi-initiator-utils package
sudo yum install -y iscsi-initiator-utils

# Enable and start the iscsid service
sudo systemctl enable iscsid
sudo systemctl start iscsid

echo "iSCSI client installation completed."
