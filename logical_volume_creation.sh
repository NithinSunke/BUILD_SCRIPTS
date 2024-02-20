#!/bin/bash
volume=$1
vgname=$2
lvname=$3
size_in_gb=$4

EXPECTED_ARGS=4
if [ $# -ne $EXPECTED_ARGS ]; then
    echo "Error: Incorrect number of input variables."
    echo "Usage: $0 <volume name> <vgname> <lvname> <size_in_gb(G)>"
    exit 1
fi


echo "create physical volume"
pvcreate $1
pvs

echo "create volume group"
vgcreate $2 $1
vgs

echo "creating logical volume"
lvcreate -n $3 -L $4 $2
lvs