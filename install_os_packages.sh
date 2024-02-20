echo "******************************************************************************"
echo "Prepare yum repos and install base packages." `date`
echo "******************************************************************************"
echo "search scs.com" > /etc/resolv.conf
echo "nameserver 192.168.0.10" >> /etc/resolv.conf
chattr +i /etc/resolv.conf
yum install -y yum-utils
yum install -y zip unzip # sshpass 
yum install lvm2 -y
yum install -y nfs-utils
yum -y update
