#!/bin/bash

# Specify the multipath device names
multipath_devices=("dockerfs" "mpath2" )

# Specify the WWIDs (World Wide Identifiers) for the multipath devices
wwids=("3600140554635325d7904feaad638e6bb" "wwid3")

# Specify other multipath settings as needed

# Loop through the devices and append configuration to /etc/multipath.conf
for ((i=0; i<${#multipath_devices[@]}; i++)); do
    echo "multipaths {
    multipath {
    wwid ${wwids[i]}
    alias ${multipath_devices[i]}
    path_grouping_policy $path_group_policy
  }
}" >> /etc/multipath.conf
done

# Reload or restart the multipath service to apply changes
systemctl restart multipathd


echo "multipath configuration completed" 