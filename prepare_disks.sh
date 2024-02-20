function prepare_disk {
  DISK_DEVICE=$1

  echo "******************************************************************************"
  echo "Prepare ${MOUNT_POINT} disk." `date`
  echo "******************************************************************************"
  # New partition for the whole disk.
  echo -e "n\np\n1\n\n\nw" | fdisk ${DISK_DEVICE}

}

prepare_disk /dev/${1}1
partprobe
