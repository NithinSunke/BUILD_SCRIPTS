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
  echo "Prepare ${MOUNT_POINT} disk." `date`
  echo "******************************************************************************"
  # New partition for the whole disk.
  echo -e "n\np\n1\n\n\nw" | fdisk ${DISK_DEVICE}

  echo "create physical volume"
  pvcreate $2
  pvs

  echo "create volume group"
  vgcreate $3 $3
  vgs

  echo "creating logical volume"
  lvcreate -n $4 -L $5 $3
  lvs

  # Add file system.
  mkfs.xfs -f  /dev/mapper/${3}-${4}

  # Mount it.
  UUID=`blkid -o value /dev/mapper/${3}-${4} | grep -v xfs`
  mkdir ${MOUNT_POINT}
  echo "UUID=${UUID}  ${MOUNT_POINT}    xfs    defaults 1 2" >> /etc/fstab
  mount ${MOUNT_POINT}
}

prepare_disk /h01 /dev/mapper/mpathb dbh-vg dbh-lvh 24.98G
prepare_disk /d02 /dev/mapper/mpathc dbf-vg dbh-lvh 24.98G
