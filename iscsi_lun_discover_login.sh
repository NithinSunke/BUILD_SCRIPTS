#!/bin/bash

sh /tmp/BUILD_SCRIPTS/os_install_env.sh
# Discover iSCSI targets
echo "sudo iscsiadm --mode discovery --type sendtargets --portal sdsan02.scs.com"
sudo iscsiadm --mode discovery --type sendtargets --portal sdsan02.scs.com

echo "targets=$(iscsiadm --mode node | awk '{print $2}')"
targets=$(iscsiadm --mode node | awk '{print $2}')


# Loop through the discovered targets and log in
for target in $targets; do
    echo "Logging in to iSCSI target: $target"
    iscsiadm --mode node --targetname $target --login
done

echo "iSCSI discovery and login completed."
