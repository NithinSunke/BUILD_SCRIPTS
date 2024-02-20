#!/bin/bash
function prepare_disk {
  MOUNT_POINT=$1
  DISK_DEVICE=$2
  VGNAME=$3
  LVNAME=$4
  SIZE_IN_GB=$5

EXPECTED_ARGS=5
if [ $# -ne $EXPECTED_ARGS ]; then
    echo "Error: Incorrect number of input variables."
    echo "Usage: $0 <MOUNT_POINT> <volume name> <vgname> <lvname> <size_in_gb(G)>"
    exit 1
fi

  echo "******************************************************************************"
  echo "Prepare ${MOUNT_POINT} disk ${DISK_DEVICE}." `date`
  echo "******************************************************************************"
  # New partition for the whole disk.
  echo -e "n\np\n1\n\n\nw" | fdisk ${2}
  partprobe

  echo "create physical volume"
  pvcreate ${2}p1
  pvs

  echo "create volume group"
  vgcreate $3 ${2}p1
  vgs

  echo "creating logical volume"
  lvcreate -n $4 -L $5 $3
  lvs

  # Add file system.
  mkfs.xfs -f  /dev/mapper/${3}-${4}

  # Mount it.
  mkdir ${MOUNT_POINT}
  echo "/dev/mapper/${3}-${4}  ${MOUNT_POINT}    xfs    defaults 1 2" >> /etc/fstab
  mount ${MOUNT_POINT}
}

prepare_disk /h02 /dev/mapper/dbh01 dbhm_vg dbhm_lvh 24.98G
prepare_disk /d02 /dev/mapper/dbf01 dbfs_vg dbfs_lvh 24.98G

